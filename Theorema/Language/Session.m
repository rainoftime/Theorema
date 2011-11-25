(* Theorema 
    Copyright (C) 2010 The Theorema Group

    This file is part of Theorema.2
    
    Theorema.2 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Theorema.2 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*)

BeginPackage["Theorema`Language`Session`"];

Needs["Theorema`Common`"];
Needs["Theorema`Language`"];
Needs["Theorema`Interface`Language`"];

Begin["`Private`"] (* Begin Private Context *) 


(* ::Section:: *)
(* Preprocessing *)


freshNames[expr_Hold] :=
    replaceAllExcept[ expr, 
    {DoubleLongRightArrow|DoubleRightArrow->implies$TM, DoubleLongLeftRightArrow|DoubleLeftRightArrow->iff$TM,
    	SetDelayed->equalDef$TM, Wedge->and$TM, Vee->or$TM,
    s_Symbol/;(Context[s]==="System`") :> Module[ {name = ToString[s]},
                    If[ StringTake[name,{-1}]==="$",
                        s,
                        ToExpression[ToLowerCase[StringTake[name,1]]<>StringDrop[name,1]<> "$TM"]
                    ]
                ],
    s_Symbol :> Module[ {name = ToString[s]},
                    If[ StringTake[name,{-1}]==="$",
                        s,
                        ToExpression[name <> "$TM"]
                    ]
                ]}, {Hold}]
freshNames[args___] := unexpected[ freshNames, {args}]

specifiedVariables[RNG$[r___]] :=
    Map[ Part[#,1]&, {r}]

markVariables[Hold[QU$[r_RNG$, expr_]]] := 
 Module[{s = Map[#->VAR$[#]&, specifiedVariables[r]]},
  		replaceAllExcept[markVariables[Hold[expr]], s, {SEQ$, VAR$, NEW$, FIX$}]]

markVariables[Hold[h_[e___]]] := applyHold[
  		markVariables[Hold[h]],
  		markVariables[Hold[e]]]

markVariables[Hold[f_, t__]] := joinHold[
  		markVariables[Hold[f]],
  		markVariables[Hold[t]]]

markVariables[Hold[]] := Hold[]

markVariables[Hold[e_]] := Hold[e]

markVariables[args___] := unexpected[ markVariables, {args}]


(*processEnvironment[\[GraySquare]] :=
    (closeEnvironment[];
     SelectionMove[EvaluationNotebook[], After, EvaluationCell];)
*)
SetAttributes[processEnvironment,HoldAll];

processEnvironment[x_] :=
    Module[ {nb = EvaluationNotebook[], newLab},
        newLab = adjustFormulaLabel[nb];
        updateKnowledgeBase[ReleaseHold[ freshNames[ markVariables[ Hold[x]]]], newLab];
    ]
processEnvironment[args___] := unexcpected[ processEnvironment, {args}]

adjustFormulaLabel[nb_NotebookObject] := 
	Module[{cellTags,cellID,newCellTags, cleanCellTags}, 
		SelectionMove[nb, All, EvaluationCell];
        {cellTags,cellID} = {CellTags,CellID} /. Options[NotebookSelection[nb], {CellTags,CellID}];
		(*
		 * Make sure we have a list of CellTags
		 *)
		cellTags = Flatten[{cellTags}];
		(*
		 * Remove any automated labels (begins with "CellID_" or "Context_").
		 * Remove initLabel.
		 *)
		cleanCellTags = getCleanCellTags[cellTags];
        (*
         * Replace unlabeled formula with counter.
         *)
         If[cleanCellTags==={},
         	cleanCellTags = automatedFormulaLabel[nb];
         	,
         	True
         ];
        (*
         * Relabel Cell and hide CellTags.
         *)
        newCellTags = relabelCell[nb,cleanCellTags,cellID];
        SelectionMove[nb, After, Cell];
        newCellTags
	]
adjustFormulaLabel[args___]	:= unexpected[adjustFormulaLabel,{args}]

(*
 * Returns all CellTags except CellTag used for cell identification: CellID_12345.
 *)
getCleanCellTags[cellTags_] :=
	Module[{},
		Select[cellTags, StringPosition[#, "CellID_"] === {} && StringPosition[#, "Context_"] === {} && # != $initLabel &]
	]
getCleanCellTags[args___]	:= unexpected[getCleanCellTags,{args}]

relabelCell[nb_NotebookObject, cellTags_List, cellID_Integer] :=
	Module[{newFrameLabel,newCellTags,duplicateCellTags},
		(* Perform check, weather are the given CellTags unique in the documment. *)
		duplicateCellTags = findDuplicateCellTags[nb,cellTags];
		If[duplicateCellTags=!={},
			DialogInput[Column[{translate["notUniqueLabel"] <> StringJoin @@ Riffle[duplicateCellTags,$labelSeparator],
				Button["OK", DialogReturn[True]]}]]
		];
		(* Join list of CellTags, use $labelSeparator. *)
		newFrameLabel = StringJoin @@ Riffle[cellTags,$labelSeparator];
		(* Put newFrameLabel in brackets. *)
		newFrameLabel = "("<>newFrameLabel<>")";
		(* Keep cleaned CellTags and add identification (CellId and Context). *)
		newCellTags = Join[{getCellIDLabel[cellID],getContextLabel[]},cellTags];
		SetOptions[NotebookSelection[nb], CellFrameLabels->{{None,newFrameLabel},{None,None}}, CellTags->newCellTags, ShowCellTags->False];
		newCellTags
	]
relabelCell[args___] := unexpected[ relabelCell,{args}]

getCellIDLabel[cellID_Integer] :=
	Module[{},
		"CellID_" <> ToString[cellID]
	]
getCellIDLabel[args___] := unexpected[ getCellIDLabel,{args}]

getContextLabel[] :=
	Module[{},
		"Context_" <> $Context
	]
getContextLabel[args___] := unexpected[ getContextLabel,{args}]
	
findDuplicateCellTags[nb_NotebookObject, cellTags_List] :=
	Module[{rawNotebook,allCellTags,selectedCellTags,duplicateCellTags},
		rawNotebook = NotebookGet[nb];
		(* Collect all CellTags from document. *)
		allCellTags = Flatten[Cases[rawNotebook,Cell[___,CellTags -> tags_,___] -> tags, Infinity]];
		(* We look only for the duplicates to elements of current CellTags list.*)
		selectedCellTags = Select[allCellTags,MemberQ[cellTags,#] &];
		(* Are there more elements (clean cellTags as duplicate might appear even in one cell CellTags)? *)
		(* Check if CellTags are unique in curent Notebook. *)
		If[Length[selectedCellTags] > Length[DeleteDuplicates[cellTags]],
				(* If not select and return duplicate Labels, *)
				duplicateCellTags = Cases[Select[Tally[selectedCellTags],uniqueLabel[#]==False &],{cellTag_,_} -> cellTag]
			,
				(* else return {} *)
				{}
		]
	]
findDuplicateCellTags[args___] := unexpected[findDuplicateCellTags,{args}]

uniqueLabel[{_,occurences_Integer}] := occurences == 1
uniqueLabel[args___] := unexpected[uniqueLabel,{args}]


(* ::Section:: *)
(* Region Title *)

automatedFormulaLabel[nb_NotebookObject] := 
	Module[{formulaCounter, newCellTags},
		incrementFormulaCounter[nb];
		(* Find highest value of any automatically counted formula. *)
		formulaCounter = getFormulaCounter[nb];
		(* Construct new CellTags with value of the incremented formulaCounter as a list. *)
		newCellTags = {ToString[formulaCounter]}
	]
automatedFormulaLabel[args___] := unexpected[ automatedFormulaLabel, {args}]

updateKnowledgeBase[ form_, lab_] :=
    If[ inArchive[], 
    	$tmaArch = Union[ $tmaArch, {{lab, form}}, SameTest -> (#1[[1]]===#2[[1]]&)],
    	$tmaEnv = Union[ $tmaEnv, {{lab, form}}, SameTest -> (#1[[1]]===#2[[1]]&)]
    ]
updateKnowledgeBase[args___] := unexpected[ updateKnowledgeBase, {args}]

		
initSession[] :=
    Module[ {},
        $environmentLabels = {};
        $tmaEnv = {};
        $tmaArch = {};
        $tmaArchNeeds = {};
        $formulaCounterName = "TheoremaFormulaCounter";
        $archiveFileName = "";
    ]
initSession[args___] := unexpected[ initSession, {args}]

currentEnvironment[] := First[$environmentLabels]
currentEnvironment[args___] := unexpected[ currentEnvironment, {args}]

incrementFormulaCounter[nb_NotebookObject] :=
	Module[{formulaCounter},
		formulaCounter = getFormulaCounter[nb];
		formulaCounter++;
		(* Save Incremented formulaCounter to the notebook options. *)
		SetOptions[nb, CounterAssignments -> {{$formulaCounterName -> formulaCounter}}]
	]
incrementFormulaCounter[args___] := unexpected[ incrementFormulaCounter, {args}]

getFormulaCounter[nb_NotebookObject] :=
	Module[{formulaCounter},
		(* Extract theoremaFormulaCounter from the options of the notebook. *)
		formulaCounter = 
			$formulaCounterName /. Flatten[
				(* Extract CounerAssignments from the options of the notebook. *)
				{CounterAssignments } /. Options[nb, CounterAssignments]
			]
	]
getFormulaCounter[args___] := unexpected[ getFormulaCounter, {args}]
 
openEnvironment[type_String] :=
    Module[{},
		$parseTheoremaExpressions = True; 
        PrependTo[$environmentLabels, type];
        SetOptions[ InputNotebook[], DefaultNewCellStyle -> "FormalTextInputFormula"];
        PrependTo[ $ContextPath, "Theorema`Language`"];
        (* Set default context if I am not in an archive. *)
        If[ !inArchive[], Begin["Theorema`Knowledge`"]];
    ]
openEnvironment[args___] := unexpected[ openEnvironment, {args}]

closeEnvironment[] := 
	Module[{},
		(* Restore context if I am not in an archive. *)
		If[ !inArchive[], End[]];
		$ContextPath = DeleteCases[ $ContextPath, "Theorema`Language`"];
		SetOptions[ InputNotebook[], DefaultNewCellStyle -> "Input"];
        $environmentLabels = Rest[$environmentLabels];
		$parseTheoremaExpressions = False; 
        updateKBBrowser[];
	]
closeEnvironment[args___] := unexpected[ closeEnvironment, {args}]

(* ::Section:: *)
(* Archives *)

getArchivePath[arch_String] :=
    Module[ {fn},
        Which[ FileExtension[arch]==="ta",
            arch,
            StringQ[fn = Quiet[ContextToFileName[ arch]]],
            StringReplacePart[ fn, "ta", -1],
            True,
            notification[ Theorema::archiveName, context]
        ]
    ];
getArchivePath[args___] := unexpected[ getArchivePath, {args}]

getArchiveNotebookPath[arch_String] := StringReplacePart[getArchivePath[arch],"nb",{-2,-1}]
getArchiveNotebookPath[args___] := unexpected[ getArchiveNotebookPath, {args}]

openArchive[name_String] :=
	Module[{nb = EvaluationNotebook[]},
		NotebookFind[nb, "ArchiveInfo", All, CellStyle];
		BeginPackage[name, {"Theorema`"}];
		(* Based on the current context set the $archiveFileName for the current archive notebook. *)
		Theorema`Common`$archiveFileName = getArchiveNotebookPath[$Context];
		SelectionEvaluate[nb];
	]
openArchive[args___] := unexpected[openArchive, {args}]

inArchive[] := 
	Module[{}, 
		StringLength[$Context] >= 9 && StringTake[$Context,-9]==="`private`"
	]
inArchive[args___] := unexpected[inArchive, {args}]

SetAttributes[ processArchiveInfo, HoldAll];

processArchiveInfo[ a_] :=
	Module[{nb = EvaluationNotebook[], cf},
		SelectionMove[nb, All, EvaluationCell];
        {cf} = {CellFrameLabels} /. Options[NotebookSelection[nb], CellFrameLabels];
		Switch[cf[[1,1]],
			translate["archLabelNeeds"],
			$tmaArchNeeds = a; Scan[ loadArchive, a], (* Remember and load current dependencies. *)
			translate["archLabelPublic"],
			ReleaseHold[freshNames[ Hold[a]]];
			Begin["`private`"];
			SelectionMove[nb, After, Cell];      
		];
	]
processArchiveInfo[args___] := unexpected[processArchiveInfo, {args}]

closeArchive[_String] :=
	Module[{nb = EvaluationNotebook[], archivePath, archiveNotebookPath},
		End[];
		archivePath = getArchivePath[ $Context];
		archiveNotebookPath = getArchiveNotebookPath[ $Context];
		$tmaArchTree = archiveNotebookPath /. Theorema`Interface`GUI`Private`$kbStruct;
		EndPackage[];
		(* Reset the context path in order to force Mathematica to write
		explicit contexts to the file *)
		Block[{$ContextPath = {"System`"}},
			(* Create the directory for an archive if does not exist. *)
			If[!DirectoryQ[ DirectoryName[ archivePath]],
				CreateDirectory[ DirectoryName[ archivePath]]
			];
			(* Save an archive. *)
			Put[ archivePath];
			Put[ Definition[$tmaArch], archivePath];
			PutAppend[ Definition[$tmaArchTree], archivePath];
			PutAppend[ Definition[$tmaArchNeeds], archivePath];
			NotebookSave[ nb, archiveNotebookPath];
		];
		(* Reset archive related variables. *)
		$archiveFileName = "";
		$tmaArch = {};
		$tmaArchTree = {};
		$tmaArchNeeds = {};
	]
closeArchive[args___] := unexpected[closeArchive, {args}]

SetAttributes[ loadArchive, Listable]

loadArchive[name_String, globals_List:{}] :=
	Module[{archivePath, archiveNotebookPath, pos, originalArchNeeds, tmpArchNeeds},
		(* Save Current Settings into the local Variables *)
		originalArchNeeds = $tmaArchNeeds;
		archivePath = getArchivePath[ name];
		If[!FileExistsQ[archivePath],
			notification[ Theorema::archiveNotFound, name];
			Return[]
		];
		BeginPackage[ name];
			Get[archivePath, Path->$TheoremaArchivePath];
		EndPackage[]; (* ContextPath updated in order to make sure that public archive symbols are visible *)
		$tmaEnv = Union[$tmaEnv, $tmaArch];
		If[!FileExistsQ[archiveNotebookPath=getArchiveNotebookPath[ name]],archiveNotebookPath=archivePath];
        If[ (pos = Position[ Theorema`Interface`GUI`Private`$kbStruct, archiveNotebookPath -> _]) === {},
            AppendTo[ Theorema`Interface`GUI`Private`$kbStruct, archivePath -> $tmaArchTree],
            Theorema`Interface`GUI`Private`$kbStruct[[pos[[1,1]]]] = archiveNotebookPath -> $tmaArchTree
        ];
        (* Resursively load all dependencies, we need a local variable 
           in order not to be overriden by first subarchive load call. *)
        tmpArchNeeds = $tmaArchNeeds;
        If[ tmpArchNeeds =!= {},
        	Scan[ loadArchive, tmpArchNeeds]
        ];
        (* Restore Original Settings *)
		$tmaArchNeeds = originalArchNeeds;
	]
loadArchive[args___] := unexpected[loadArchive, {args}]

(* ::Section:: *)
(* Computation *)

SetAttributes[processComputation, HoldAll];

processComputation[x_] := Module[ {},
	printComputationInfo[];
	ReleaseHold[ freshNames[ markVariables[ Hold[x]]]]
]
processComputation[args___] := unexcpected[ processComputation, {args}]

openComputation[] := 
	Module[{},
		$parseTheoremaExpressions = True; 
		Begin["Theorema`Computation`"];
	]
openComputation[args___] := unexcpected[ openComputation, {args}]

closeComputation[] :=
    Module[ {},
        End[];
		$parseTheoremaExpressions = False;
    ]
closeComputation[args___] := unexcpected[ closeComputation, {args}]

(* ::Section:: *)
(* Built-in computation *)

Begin["Theorema`Computation`"]

activeComputation[_] := False
activeComputationKB[_] := False

plus$TM /; activeComputation["plus"] = Plus
times$TM /; activeComputation["times"] = Times
set$TM /; activeComputation["equal"] = equal

End[]

(* ::Section:: *)
(* end of package *)

initSession[];
  
End[] (* End Private Context *)

EndPackage[];