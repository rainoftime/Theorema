(* ::Package:: *)

BeginPackage["Theorema`Computation`Language`"]

Needs[ "Theorema`Common`"]

(*
   Load the same symbols like in Theorema`Language` so that all language constructs will be
   available in Computation context as well *)
Map[ Get, FileNames[ "*.m", FileNameJoin[{$TheoremaDirectory, "Theorema", "Language", "LanguageData"}]]];

Begin[ "`Private`"]

cleanupComputation[ ] :=
	Module[{},
		Clear[ "Theorema`Computation`Knowledge`*"]
	]
cleanupComputation[ args___] := unexpected[ cleanupComputation, {args}]

kbSelectCompute[_] := False;

buiActive[ f_String] :=
	Switch[ $computationContext,
		"prove",
		buiActProve[ f], 
		"compute",
		buiActComputation[ f],
		"solve",
		buiActSolve[ f]
	]
buiActive[ args___] := unexpected[ buiActive, {args}]

setComputationContext[ c_String] :=
    Module[ {},
        $computationContext = c;
    ]
setComputationContext[ args___] := unexpected[ setComputationContext, {args}]


(* ::Section:: *)
(* Arithmetic *)


   
Plus$TM[ a__] /; buiActive["Plus"] := Plus[ a]
Times$TM[ a__] /; buiActive["Times"] := Times[ a]
Power$TM[ a_, b_] /; buiActive["Power"] := Power[ a, b]
Equal$TM[ a_, b_] /; buiActive["Equal"] := a == b
Less$TM[ a__] /; buiActive["Less"] := Less[ a]
LessEqual$TM[ a__] /; buiActive["LessEqual"] := LessEqual[ a]
Greater$TM[ a__] /; buiActive["Greater"] := Greater[ a]
GreaterEqual$TM[ a__] /; buiActive["GreaterEqual"] := GreaterEqual[ a]



(* ::Section:: *)
(* Logic *)


Not$TM[ a_] /; buiActive["Not"] := Not[ a]
And$TM[ pre___, a_, mid___, a_, post___] /; buiActive["And"] := And$TM[ pre, a, mid, post]
And$TM[ a__] /; buiActive["And"] := And[ a]
Or$TM[ pre___, a_, mid___, a_, post___] /; buiActive["Or"] := Or$TM[ pre, a, mid, post]
Or$TM[ a__] /; buiActive["Or"] := Or[ a]
Implies$TM[ a__] /; buiActive["Implies"] := Implies[ a]
Iff$TM[ a__] /; buiActive["Iff"] := Equivalent[ a]

rangeToIterator[ SETRNG$[ x_, A_Set$TM]] := { x, Apply[ List, A]}
rangeToIterator[ 
  STEPRNG$[ x_, l_Integer, h_Integer, s_Integer]] := {x, l, h, s}
rangeToIterator[ _] := $Failed
rangeToIterator[ args___] := unexpected[ rangeToIterator, {args}]

ClearAll[ Forall$TM, Exists$TM, SequenceOf$TM]
Scan[ SetAttributes[ #, HoldRest] &, {Forall$TM, Exists$TM, 
  SequenceOf$TM}]
Scan[ SetAttributes[ #, HoldFirst] &, {SETRNG$, STEPRNG$}]

Forall$TM[ RNG$[ r_, s__], cond_, form_] /; buiActive["Forall"] := 
 	Module[ {splitC},
  		splitC = splitAnd[ cond, {r[[1]]}];
  		With[ {rc = splitC[[1]], sc = splitC[[2]]},
   			Forall$TM[ RNG$[r], rc, Forall$TM[ RNG$[s], sc, form]]
   		]
  	]

Forall$TM[ RNG$[ r : _SETRNG$ | _STEPRNG$], cond_, form_] /; 
  buiActive["Forall"] :=
 	Module[ {iter},
     		forallIteration[ iter, cond, 
    form] /; (iter = rangeToIterator[ r]) =!= $Failed
  	]

(* We introduce local variables for the iteration so that we can \
substitute only for free occurrences.
   Technically, Mathematica coulf iterate the VAR$[..] directly, but \
it would substitute ALL occurrences then *)
SetAttributes[ \
forallIteration, HoldRest]
forallIteration[ {x_, iter__}, cond_, form_] :=
     
 Module[ {uneval = {}, ci, sub},
          Catch[
               Do[ If[ TrueQ[ cond],
                         ci = True,
                         
     ci = ReleaseHold[ substituteFree[ Hold[ cond], {x -> i}]]
                     ];
                    If[ ci,
                         
     sub = ReleaseHold[ substituteFree[ Hold[ form], {x -> i}]];
                         If[ sub,
                              Continue[],
                              Throw[ False],
                              AppendTo[ uneval, sub]
                          ],
                         Continue[],
                         
     AppendTo[ uneval, 
      Implies$TM[ ci, 
       ReleaseHold[ substituteFree[ Hold[ form], {x -> i}]]]]
                     ],
                    { i, iter}
                ];
               makeConjunction[ uneval, And$TM]
           ]
      ]
    
Exists$TM[ RNG$[ r_, s__], cond_, form_] /; buiActive["Exists"] := 
 	Module[ {splitC},
  		splitC = splitAnd[ cond, {r[[1]]}];
  		With[ {rc = splitC[[1]], sc = splitC[[2]]},
   			Exists$TM[ RNG$[r], rc, Exists$TM[ RNG$[s], sc, form]]
   		]
  	]

Exists$TM[ RNG$[ r : _SETRNG$ | _STEPRNG$], cond_, form_] /; 
  buiActive["Exists"] :=
 	Module[ {iter},
     		existsIteration[ iter, cond, 
    form] /; (iter = rangeToIterator[ r]) =!= $Failed
  	]

SetAttributes[ existsIteration, HoldRest]
existsIteration[ {x_, iter__}, cond_, form_] :=
     
 Module[ {uneval = {}, ci, sub},
          Catch[
               Do[ If[ TrueQ[ cond],
                         ci = True,
                         
     ci = ReleaseHold[ substituteFree[ Hold[ cond], {x -> i}]]
                     ];
                    If[ ci,
                         
     sub = ReleaseHold[ substituteFree[ Hold[ form], {x -> i}]];
                         If[ sub,
                              Throw[ True],
                              Continue[],
                              AppendTo[ uneval, sub]
                          ],
                         Continue[],
                         
     AppendTo[ uneval, 
      And$TM[ ci, 
       ReleaseHold[ substituteFree[ Hold[ form], {x -> i}]]]]
                     ],
                     {i, iter}
                 ];
               makeDisjunction[ uneval, Or$TM]
           ]
      ]

(* Instead of nesting SequenceOf expressions and then concatenating the sequences, we construct a multi-iterator from the given ranges *)
SequenceOf$TM[ RNG$[ r__STEPRNG$], cond_, form_] :=
 	Module[ {s},
		Apply[ Sequence, s] /; (s = sequenceOfIteration[ Map[ rangeToIterator, {r}], cond, form]) =!= $Failed
	]

(* The multi-iterator is used in a Do-loop. Local variables have to \
be introduced to be substituted during the iteration *)   	
SetAttributes[ sequenceOfIteration, HoldRest]
sequenceOfIteration[ iter : {__List}, cond_, form_] :=
     
 Module[ {seq = {}, ci, comp, 
   tmpVar = Table[ Unique[], {Length[ iter]}], 
   iVar = Map[ First, iter]},
          Catch[
               
   With[ {locIter = 
      Apply[ Sequence, 
       MapThread[ ReplacePart[ #1, 1 -> #2] &, {iter, tmpVar}]], 
     locSubs = Thread[ Rule[ iVar, tmpVar]]},
                    Do[ If[ TrueQ[ cond],
                              ci = True,
                              
      ci = ReleaseHold[ substituteFree[ Hold[ cond], locSubs]]
                          ];
                         If[ ci,
                              
      comp = ReleaseHold[ substituteFree[ Hold[ form], locSubs]];
                              AppendTo[ seq, comp],
                              Continue[],
                              Throw[ $Failed]
                          ],
                         locIter
                     ]
                ];
            seq
           ]
      ]
sequenceOfIteration[ iter_List, cond_, form_] := $Failed
sequenceOfIteration[ args___] := 
 unexpected[ sequenceOfIteration, {args}]

SetOf$TM[ RNG$[ r__], cond_, form_] :=
	Module[ {s},
		Apply[ makeSet, s] /; (s = sequenceOfIteration[ Map[ rangeToIterator, {r}], cond, form]) =!= $Failed
	]

TupleOf$TM[ RNG$[ r__], cond_, form_] :=
	Module[ {s},
		Apply[ makeTuple, s] /; (s = sequenceOfIteration[ Map[ rangeToIterator, {r}], cond, form]) =!= $Failed
	]



(* ::Section:: *)
(* Sets *)


Set$TM /: Equal$TM[a__Set$TM] /; buiActive["SetEqual"] := SameQ[a]
Set$TM /: SubsetEqual$TM[a_Set$TM, b_Set$TM] /; buiActive["SubsetEqual"] := Equal$TM[Intersection[a, b],a]
Set$TM /: Subset$TM[a_Set$TM, b_Set$TM] /; buiActive["Subset"] := And[SubsetEqual$TM[a,b],Not[Equal$TM[a, b]]]
Set$TM /: SupersetEqual$TM[a_Set$TM, b_Set$TM] /; buiActive["SupersetEqual"] := SubsetEqual$TM[b, a]
Set$TM /: Superset$TM[a_Set$TM, b_Set$TM] /; buiActive["Superset"] := Subset$TM[b, a]
Set$TM /: Union$TM[ a__Set$TM] /; buiActive["Union"] := Union[ a] /. List -> Set$TM
Set$TM /: Intersection$TM[ a__Set$TM] /; buiActive["Intersection"] := Intersection[ a] /. List -> Set$TM
Set$TM /: Backslash$TM[ a_Set$TM,b_Set$TM] /; buiActive["Difference"] := Complement[a, b] /. List -> Set$TM
Set$TM /: EmptyUpTriangle$TM[ a_Set$TM,b_Set$TM] /; buiActive["SymmetricDifference"] := Union[Complement[a, b], Complement[b, a]] /. List -> Set$TM
Set$TM /: Cross$TM[ a__Set$TM] /; buiActive["CartesianProduct"] := Apply[Set$TM, Replace[Tuples[{a}],List[x__]:> Tuple$TM[x] ,{1}]]
Set$TM /: Element$TM[ p_,a_Set$TM] /; buiActive["IsElement"] := MemberQ[ a, p]
Set$TM /: \[ScriptCapitalP]$TM[ a_Set$TM] /; buiActive["PowerSet"] := Subsets[ a] /. List -> Set$TM
Set$TM /: BracketingBar$TM[ a_Set$TM] /; buiActive["Cardinality"] && isSequenceFree[a] := Length[ a]
Set$TM /: max$TM[ a_Set$TM] /; buiActive["MaximumElementSet"] := Max[a /. Set$TM -> List] /. Max -> max$TM
Set$TM /: min$TM[ a_Set$TM] /; buiActive["MinimumElementSet"] := Min[ a/. Set$TM -> List] /. Min -> min$TM


(* ::Section:: *)
(* Tuples *)


Tuple$TM /: Subscript$TM[ a_Tuple$TM, Rule$TM[ p_, q_]] /; buiActive["Insert"] && isSequenceFree[a] := Insert[ a, p, q /. Tuple$TM -> List]

(* Delete elements at one or more positions *)
Tuple$TM /: Subscript$TM[ a_Tuple$TM, LeftArrow$TM[ b_]] /; buiActive["DeleteAt"] && isSequenceFree[a] := Delete[ a, b //. Tuple$TM -> List]

(* Delete elements of a certain shape. Multiple deletions are not possible, because it would need
	special syntax how to specify multiple shapes. Tuples cannot be used because for this *)
Tuple$TM /: Subscript$TM[a_Tuple$TM, d:(LeftArrowBar$TM[_]..)] /; buiActive["Delete"] := Fold[ DeleteCases[ #1, #2[[1]]]&, a, {d}] 

Tuple$TM /: Equal$TM[a__Tuple$TM] /; buiActive["TupleEqual"] && SameQ[a ] := True
Tuple$TM /: Equal$TM[a__Tuple$TM] /; buiActive["TupleEqual"] && isVariableFree[{a},{2}] := False

Tuple$TM /: Cup$TM[a_Tuple$TM,p_] /; buiActive["Append"] := Append[ a,p]
Tuple$TM /: Cap$TM[p_,a_Tuple$TM] /; buiActive["Prepend"] := Prepend[ a,p]
Tuple$TM /: CupCap$TM[a__Tuple$TM] /; buiActive["Join"] := Join[ a]

Tuple$TM /: Element$TM[p_,a_Tuple$TM] /; buiActive["IsElement"] && MemberQ[a,p] := True
Tuple$TM /: Element$TM[p_,a_Tuple$TM] /; buiActive["IsElement"] && isVariableFree[a] := False

Tuple$TM /: max$TM[a_Tuple$TM] /; buiActive["Max"] && isVariableFree[a] := Max[a /. Tuple$TM -> List] /. Max -> max$TM
Tuple$TM /: min$TM[a_Tuple$TM] /; buiActive["Min"] && isVariableFree[a] := Min[a /. Tuple$TM -> List] /. Min -> min$TM

Tuple$TM /: BracketingBar$TM[ a_Tuple$TM] /; buiActive["Length"] && isSequenceFree[a] := Length[ a]

Tuple$TM /: Subscript$TM[ a_Tuple$TM, p:LeftArrow$TM[_, _]..] /; buiActive["ReplacePart"] && isSequenceFree[a] :=
	ReplacePart[ a, MapAt[# /. {Tuple$TM -> List}&, {p} /. LeftArrow$TM -> Rule, Table[ {i, 1}, {i, Length[{p}]}]]]

Tuple$TM /: Subscript$TM[ a_Tuple$TM, s:LeftArrowBar$TM[_, _]..] /; buiActive["Replace"] := Fold[ ReplaceAll, a, {s} /. LeftArrowBar$TM -> Rule]

Tuple$TM /: Subscript$TM[ a_Tuple$TM, p__Integer] /; buiActive["Subscript"] := Subscript$TM[ a, Tuple$TM[ p]]
Tuple$TM /: Subscript$TM[ a_Tuple$TM, p_?isPositionSpec] /; buiActive["Subscript"] && isSequenceFree[a] := Extract[ a, p /. Tuple$TM -> List] /. List -> Tuple$TM

isPositionSpec[ _Integer] := True
isPositionSpec[ Tuple$TM[ p__]] := Apply[ And, Map[ isPositionSpec, {p}]]
isPositionSpec[ _] := False
isPositionSpec[ args___] := unexpected[ isPositionSpec, {args}]


(* ::Section:: *)
(* Mathematica programming constructs *)


(* In a "Theorema program", sets and Mathematica lists (as in Module, Do, ...) may be mixed. Also, there is "=" assignment as opposed
   to "=" as equality in standard Theorema language.
   Solution: we write a program inside "Program", and the preprocessor renames symbols differently inside Program, i.e.
   Set -> Assign$TM (instead of Equal), List -> List$TM
   When executing the programming constructs, replace List$TM by {} where interpretation as Mathematica lists is desired.
   *)
   
SetAttributes[ Module$TM, HoldAll]
Module$TM[ l_[v___], body_] /; buiActive["Module"] := Apply[ Module, Hold[ {v}, body]]

SetAttributes[ Do$TM, HoldAll]
Do$TM[ body_, l_[v___]] /; buiActive["Do"] := Do[ body, {v}]

(* We assume that all lists not treated by the above constructs should in fact be sets *)
SetAttributes[ List$TM, HoldAll]
List$TM[ l___] := makeSet[l]

cleanupComputation[]
    
End[]
EndPackage[]
