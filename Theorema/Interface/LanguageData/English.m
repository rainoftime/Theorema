(* Theorema 
    Copyright (C) 2010 The Theorema Group

    This file is part of Theorema 2.0
    
    Theorema 2.0 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Theorema 2.0 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*)

With[ {lang = "English"},
    translate[ "0ANNOPTooltip", lang] = "\[SmallCircle] \[Ellipsis] operator symbol";
    translate[ "1ANNOPTooltip", lang] = "\[SmallCircle] \[Ellipsis] operator symbol\nA \[Ellipsis] annotation";
    translate[ "2ANNOPTooltip", lang] = "\[SmallCircle] \[Ellipsis] operator symbol\nA \[Ellipsis] annotation\nB \[Ellipsis] annotation";

	translate[ "abort", lang] = "Abort proof";
    translate[ "ambiguousRange", lang] = "The range `` does not unambiguously mark one variable.";
    translate[ "AND2", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) and \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\)";   	
    translate[ "AND3", lang] = "\!\(\*FormBox[FrameBox[\"e1\"], SelectionPlaceholder]\) and \[Ellipsis] and \!\(\*FormBox[FrameBox[\"en\"], SelectionPlaceholder]\)";
	translate[ "apply color scheme", lang] = "Apply color scheme";
	translate[ "archiveNameDialogField", lang] = "Choose a name for the archive:";
	translate[ "archiveNameDialogHint", lang] = "valid archive name should end in `";
	translate[ "archLabelBegin", lang] = "Begin Archive";
	translate[ "archLabelEnd", lang] = "End Archive";
	translate[ "archLabelName", lang] = "name:  ";
	translate[ "archLabelNeeds", lang] = "needs: ";
	translate[ "archLabelPublic", lang] = "public: ";
    translate[ "Arithmetic", lang] = "Arithmetic";
	translate[ "auto", lang] = "automatic";
	translate[ "availConst", lang] = "Available constants";

    translate[ "BuiComp", lang] = "Builtins used in computation";
    translate[ "BuiProve", lang] = "Builtins used in proof";

    translate[ "cantCreateDir", lang] = "Cannot create directory ``";
    translate[ "CASEDIST", lang] = "distinguish cases \!\(\*FormBox[FrameBox[\"c1\"], Placeholder]\) \[Ellipsis] \!\(\*FormBox[FrameBox[\"cn\"], Placeholder]\)";
    translate[ "CASEDISTTooltip", lang] = "e1, \[Ellipsis], en \[Ellipsis] expressions\nc1, \[Ellipsis], cn \[Ellipsis] conditions";   	
	translate[ "closed", lang] = "all closed";
    translate[ "Computation", lang] = "Computation";
    translate[ "CONN2Tooltip", lang] = "left, right \[Ellipsis] formula";   	
    translate[ "CONNTooltip", lang] = "e1, \[Ellipsis], en \[Ellipsis] formula";

    translate[ "Declarations", lang] = "Globals";
	translate[ "disproved", lang] = "disproved";
    translate[ "Domains", lang] = "Domains and Data Types";

	translate[ "elimBranches", lang] = "Eliminate failing/pending branches";
	translate[ "elimForm", lang] = "Eliminate unused formulae";
	translate[ "elimSteps", lang] = "Eliminate superfluous steps";
    translate[ "Environments", lang] = "Environments";
    translate[ "EQ", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) equals \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\)";   	
    translate[ "EQDEF", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) = \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\) (by def.)";   	
    translate[ "EQDEFTooltip", lang] = "left, right \[Ellipsis] term\nfunction definition";   	
    translate[ "EQUIV2", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) iff \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\)";   	
    translate[ "EQUIV3", lang] = "\!\(\*FormBox[FrameBox[\"e1\"], SelectionPlaceholder]\) iff \[Ellipsis] iff \!\(\*FormBox[FrameBox[\"en\"], SelectionPlaceholder]\)";
    translate[ "EQUIVDEF", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) iff \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\) (by def.)";   	
    translate[ "EQUIVDEFTooltip", lang] = "left, right \[Ellipsis] formula\npredicate definition";   	
    translate[ "EXISTS1", lang] = "exists \!\(\*FormBox[FrameBox[\"rg\"], Placeholder]\) s.t. \!\(\*FormBox[FrameBox[\"expr\"], SelectionPlaceholder]\)";   	
    translate[ "EXISTS2", lang] = "exists \!\(\*FormBox[FrameBox[\"rg\"], Placeholder]\) satisfying \!\(\*FormBox[FrameBox[\"cond\"], Placeholder]\) s.t. \!\(\*FormBox[FrameBox[\"expr\"], SelectionPlaceholder]\)";   	

	translate[ "failed", lang] = "failed";
    translate[ "fileTypeArchive", lang] = "Theorema archive";
    translate[ "fileTypeNotebook", lang] = "Theorema notebook";
	translate[ "FilteredBy", lang] = "Filtered by";
	translate[ "FilterKBWindow", lang] = "Filter by keyword";
	translate[ "Filter", lang] = "Filter";
	translate[ "FilterRulesWindow", lang] = "Filter by keyword";
    translate[ "fit into window", lang] = "fit into window";
    translate[ "FORALL1", lang] = "for all \!\(\*FormBox[FrameBox[\"rg\"], Placeholder]\): \!\(\*FormBox[FrameBox[\"expr\"], SelectionPlaceholder]\)";   	
    translate[ "FORALL2", lang] = "for all \!\(\*FormBox[FrameBox[\"rg\"], Placeholder]\) satisfying \!\(\*FormBox[FrameBox[\"cond\"], Placeholder]\): \!\(\*FormBox[FrameBox[\"expr\"], SelectionPlaceholder]\)";   	
    translate[ "Formulae", lang] = "Formulas";

    translate[ "GABBREVTooltip", lang] = "Global abbreviation";   	
    translate[ "GCONDTooltip", lang] = "Global condition";   	
    translate[ "Global Declarations"] = "Globals valid at this cell";
    translate[ "GoalProve", lang] = "Proof goal";
	translate[ "group/ungroup", lang] = "Group / Ungroup";
    translate[ "GVARCONDTooltip", lang] = "Global universally quantified variable with condition";   	
    translate[ "GVARTooltip", lang] = "Global universally quantified variable";   	

    translate[ "hide proof", lang] = "hide proof";
    translate[ "hideProofProgress", lang] = "Hide the proof by clicking here. Do not close the proof window, since it cannot be re-opened then.";

    translate[ "IMPL2", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) implies \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\)";   	
    translate[ "in place", lang] = "in place";
	translate[ "instantiate later", lang] = "Instantiate later";
	translate[ "instVar", lang] = "Variables to be instantiated";
	translate[ "interactiveInstantiate", lang] = "Instantiate quantifiers interactively";
	translate[ "interactiveNewProofSitFilter", lang] = "Filter new proof situations interactively";
	translate[ "interactiveProofSitSel", lang] = "Select next proof situation interactively";

    translate[ "KBcomp", lang] = "Knowledge used in computation";
    translate[ "KBprove", lang] = "Knowledge used in proof";
	translate[ "Keyword", lang] = "Keyword";

    translate[ "LET", lang] = "let \!\(\*FormBox[FrameBox[\"a\"], Placeholder]\) be an abbreviation for \!\(\*FormBox[FrameBox[\"x\"], Placeholder]\) in \!\(\*FormBox[FrameBox[\"expr\"], SelectionPlaceholder]\)";
    translate[ "LETTooltip", lang] = "a \[Ellipsis] variable used as abbreviation\nx \[Ellipsis] abbreviated expression\nexpr \[Ellipsis] expression where a abbreviates x";   	
    translate[ "Logic", lang] = "Logic";

    translate[ "more", lang] = "more \[Ellipsis]";

	translate[ "nA", lang] = "not available";
	translate[ "New", lang] = "New";
    translate[ "noArchName", lang] = "No archive name available for chosen archive. Check file content";
	translate[ "noGoal", lang] = "Select a whole cell (cell bracket) containing the proof goal";
	translate[ "noKB", lang] = "No knowledge selected";
    translate[ "noKnowl", lang] = "No knowledge available";
    translate[ "noNB", lang] = "No notebook file available";
	translate[ "noRoot", lang] = "Cannot identify root of proof tree";
	translate[ "noRules", lang] = "no rules found";
    translate[ "Notebooks", lang] = "Notebooks";
	translate[ "notEval", lang] = "Formula currently not evaluated. Click to eval.";
    translate[ "NOT", lang] = "not \!\(\*FormBox[FrameBox[\"form\"], SelectionPlaceholder]\)";	
    translate[ "NOTTooltip", lang] = "form \[Ellipsis] formula\nlogical negation";
    translate[ "notUniqueLabel", lang] = "These labels are not unique in the notebook: ``\n\nThis is just a warning, you can continue,\nbut referencing formulae from this notebook\nmight turn out to be confusing.";

	translate[ "OK", lang] = "OK";
	translate[ "OKnext", lang] = "OK, next \[Ellipsis]";
	translate[ "open", lang] = "all open";
	translate[ "Open", lang] = "Open";
	translate[ "open proof situation", lang] = "Open proof situation";
	translate[ "Operators", lang] = "Operators";
    translate[ "optimal size", lang] = "optimal size";
    translate[ "OR2", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) or \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\)";   	
    translate[ "OR3", lang] = "\!\(\*FormBox[FrameBox[\"e1\"], SelectionPlaceholder]\) or \[Ellipsis] or \!\(\*FormBox[FrameBox[\"en\"], SelectionPlaceholder]\)";
    translate[ "OVEROP", lang] = "overscripted operator";
    translate[ "OVERSUBOP", lang] = "over- and subscripted operator";

	translate[ "pending", lang] = "pending";
	translate[ "pInteractive", lang] = "Interactive Proving";
	translate[ "preferences last saved", lang] = "Preferences last saved";
    translate[ "Programming", lang] = "Mathematica Programming";
	translate[ "proofCellStatus", lang] = "Proof Cells";
	translate[ "proofFindTime", lang] = "Time spent for finding the proof";
    translate[ "Proof", lang] = "Proof";
    translate[ "Proof of", lang] = "Proof of";
	translate[ "proofOutput", lang] = "Proof Output";
	translate[ "proofSimpTime", lang] = "Time spent for simplifying the proof";
	translate[ "proved", lang] = "proved";
	translate[ "prove", lang] = "Prove!";
	translate[ "pRules", lang] = "Proof Rules";
	translate[ "pRulesSetup", lang] = "Proof Rules Setup";
	translate[ "pSimp", lang] = "Proof Simplification";
	translate[ "pStrat", lang] = "Proof Strategy";

    translate[ "QUANT1Tooltip", lang] = "rg \[Ellipsis] ranges for the quantified variables\nexpr \[Ellipsis] quantified expression";   	
    translate[ "QUANT2Tooltip", lang] = "rg \[Ellipsis] ranges for the quantified variables\ncond \[Ellipsis] condition on the variables\nexpr \[Ellipsis] quantified expression";

	translate[ "replaceExistProof", lang] = "Replace existing proof";
    translate[ "ResetBui", lang] = "Reset built-ins";
	translate[ "RestoreDefaults", lang] = "Restore defaults";
    translate[ "RestoreSettings", lang] = "Restore settings";
    translate[ "RestoreSettingsLong", lang] = "Really restore all relevant settings to the values they had when this action was performed last time?";
	translate[ "ruleActive", lang] = "Activate/deactivate the inference rule";
	translate[ "rulePriority", lang] = "The priority of the rule as an integer between 1 and 100. Lower value means higher priority";

	translate[ "save current settings", lang] = "Save current settings";
	translate[ "sDepth", lang] = "Search Depth";
	translate[ "selBui", lang] = "Selected Built-ins";
	translate[ "selectedRules",lang] = "Selected Rules";
	translate[ "selGoal", lang] = "Selected Proof Goal";
	translate[ "selKB", lang] = "Selected Knowledge Base";
	translate[ "selProver", lang] = "Selected Prover";
    translate[ "Sets", lang] = "Sets";
	translate[ "ShowAll", lang] = "Show all";
    translate[ "ShowComputation", lang] = "Show computation";
    translate[ "ShowProof", lang] = "Show proof";
    translate[ "showProofProgress", lang] = "Show the proof progress so far";
    translate[ "SINGLEOP", lang] = "single operator";
	translate[ "sLimits", lang] = "Proof Search Limits";
	translate[ "statistics", lang] = "statistics";
	translate[ "sTime", lang] = "Search Time";
    translate[ "SUBOP", lang] = "subscripted operator";
    translate[ "SUBSUPEROP", lang] = "sub- and superscripted operator";
    translate[ "SUPEROP", lang] = "superscripted operator";

    translate[ "tcComputeTabBuiltinTabLabel", lang] = "built-in";
    translate[ "tcComputeTabKBTabLabel", lang] = "knowledge";
    translate[ "tcComputeTabLabel", lang] = "Compute";
    translate[ "tcComputeTabSetupTabLabel", lang] = "setup";
    translate[ "tcLangTabArchTabButtonCloseLabel", lang] = "End";
    translate[ "tcLangTabArchTabButtonInfoLabel", lang] = "Archive Info";
    translate[ "tcLangTabArchTabButtonLoadLabel", lang] = "Load";
    translate[ "tcLangTabArchTabButtonMakeLabel", lang] = "Notebook \[RightArrow] Archive";
    translate[ "tcLangTabArchTabButtonSelectLabel", lang] = "Select Archives \[Ellipsis]";
    translate[ "tcLangTabArchTabNoArchSel", lang] = "No archives selected";
    translate[ "tcLangTabArchTabSectionCreate", lang] = "Creating Archives";
    translate[ "tcLangTabArchTabSectionLoad", lang] = "Loading Archives";
	translate[ "tcPrefAppearColorSchemes", lang] = "Color Schemes";
	translate[ "tcPrefAppear", lang] = "Appearance";
	translate[ "tcPrefAppearSuppressWelcome", lang] = "Suppress welcome screen";
	translate[ "tcPrefAppearWelcome", lang] = "Welcome Screen";
	translate[ "tcPrefArchiveDir", lang] = "Archive Directory";
    translate[ "tcPreferencesTabLabel", lang] = "Preferences";
	translate[ "tcPrefLanguage", lang] = "Language";
    translate[ "tcProveTabBuiltinTabLabel", lang] = "built-in";
    translate[ "tcProveTabGoalTabLabel", lang] = "goal";
    translate[ "tcProveTabInspectTabLabel", lang] = "inspect";
    translate[ "tcProveTabKBTabLabel", lang] = "knowledge";
    translate[ "tcProveTabLabel", lang] = "Prove";
    translate[ "tcProveTabProverTabLabel", lang] = "prover";
    translate[ "tcProveTabSubmitTabLabel", lang] = "submit";
    translate[ "tcSessionTabLabel", lang] = "Session";
    translate[ "tcSessTabArchTabLabel", lang] = "archives";
    translate[ "tcSessTabComposeTabLabel", lang] = "compose";
    translate[ "tcSessTabEnvTabButtonAlgLabel", lang] = "Algorithm";
    translate[ "tcSessTabEnvTabButtonAllDeclLabel", lang] = "All Globals";
    translate[ "tcSessTabEnvTabButtonAllFormLabel", lang] = "All Formulae";
    translate[ "tcSessTabEnvTabButtonCorLabel", lang] = "Corollary";
    translate[ "tcSessTabEnvTabButtonDeclLabel", lang] = "Identify globals";
    translate[ "tcSessTabEnvTabButtonDefLabel", lang] = "Definition";
    translate[ "tcSessTabEnvTabButtonExmLabel", lang] = "Example";
    translate[ "tcSessTabEnvTabButtonLmaLabel", lang] = "Lemma";
    translate[ "tcSessTabEnvTabButtonPrpLabel", lang] = "Proposition";
    translate[ "tcSessTabEnvTabButtonThmLabel", lang] = "Theorem";
    translate[ "tcSessTabInspectTabLabel", lang] = "inspect";
    translate[ "tcSessTabMathTabBSform", lang] = "formal";
    translate[ "tcSessTabMathTabBS", lang] = "Button style";   	
    translate[ "tcSessTabMathTabBSnat", lang] = "natural";   	
    translate[ "tcSolveTabBuiltinTabLabel", lang] = "built-in";
    translate[ "tcSolveTabKBTabLabel", lang] = "knowledge";
    translate[ "tcSolveTabLabel", lang] = "Solve";
	translate[ "Theorema Commander", lang] = "Theorema Commander";
    translate[ "Theorema Environment", lang] = "Theorema Environment";
	translate[ "tooltipButtonGroupUngroup", lang] = "Group selected expression. Press \[ShiftKey] to ungroup selection.";
    translate[ "tooltipButtonNoParen", lang] = "\nKeyboard shortcut";   	
    translate[ "tooltipButtonParen", lang] = "\nPress \[ShiftKey] to omit parentheses\nKeyboard shortcut";   	
    translate[ "Trace", lang] = "Trace Computation";
    translate[ "traceUserDef", lang] = "Trace user-definitions";
    translate[ "tupleOfRange", lang] = "The tuple quantifier can only be used with step-ranges, not with ``.";
    translate[ "Tuples", lang] = "Tuples";

    translate[ "UNDEROVEROP", lang] = "under- and overscripted operator";
	translate[ "unknown proof node", lang] = "Unknown proof node";

	translate[ "Virtual Keyboard", lang] = "Virtual Keyboard";

    translate[ "zoom in", lang] = "zoom in";
    translate[ "zoom out", lang] = "zoom out";
    		
    translate[ "?", lang] = "?";
	translate[ "[]", lang] = "Square bracketted expression";
	translate[ "[[]]", lang] = "Double square bracketted expression";
	translate[ "<>", lang] = "Angle bracketted expression";
	translate[ "<<>>", lang] = "Double angle bracketted expression";
	translate[ "{}", lang] = "Braced expression";
	translate[ "{{}}", lang] = "Double braced expression";
	translate[ "()", lang] = "Parenthesized expression";
	translate[ "(())", lang] = "Double parenthesized expression";

]
