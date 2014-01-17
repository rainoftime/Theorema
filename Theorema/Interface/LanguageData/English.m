(* Mathematica package *)

With[ {lang = "English"},
(* Theorema Commander *)
	translate["Theorema Commander", lang] = "Theorema Commander";
    translate["tcSessionTabLabel", lang] = "Session";
    	translate["tcSessTabComposeTabLabel", lang] = "compose";
    		translate["Notebooks", lang] = "Notebooks";
    		translate["Environments", lang] = "Environments";
    		translate["tcSessTabEnvTabButtonDefLabel", lang] = "Definition";
    		translate["tcSessTabEnvTabButtonThmLabel", lang] = "Theorem";
    		translate["tcSessTabEnvTabButtonLmaLabel", lang] = "Lemma";
    		translate["tcSessTabEnvTabButtonPrpLabel", lang] = "Proposition";
    		translate["tcSessTabEnvTabButtonCorLabel", lang] = "Corollary";
    		translate["tcSessTabEnvTabButtonCnjLabel", lang] = "Conjecture";
    		translate["tcSessTabEnvTabButtonAlgLabel", lang] = "Algorithm";
    		translate["tcSessTabEnvTabButtonExmLabel", lang] = "Example";
    		translate["Formulae", lang] = "Formulae";
    		translate["Theorema Environment", lang] = "Theorema Environment";
    		translate["Declarations", lang] = "Declarations";
     		translate["GVARTooltip", lang] = "Global variable";   	
     		translate["GVARCONDTooltip", lang] = "Global variable with condition";   	
      		translate["GCONDTooltip", lang] = "Global condition";   	
     		translate["GABBREVTooltip", lang] = "Global abbreviation";   	
     		translate["AND1", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) and \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\)";   	
     		translate["AND2", lang] = translate["AND1", lang];   	
     		translate["AND3", lang] = "\!\(\*FormBox[FrameBox[\"e1\"], SelectionPlaceholder]\) and ... and \!\(\*FormBox[FrameBox[\"en\"], SelectionPlaceholder]\)";
     		translate["OR1", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) or \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\)";   	
     		translate["OR2", lang] = translate["OR1", lang];   
     		translate["OR3", lang] = "\!\(\*FormBox[FrameBox[\"e1\"], SelectionPlaceholder]\) or ... or \!\(\*FormBox[FrameBox[\"en\"], SelectionPlaceholder]\)";
     		translate["NOT", lang] = "not \!\(\*FormBox[FrameBox[\"form\"], SelectionPlaceholder]\)";	
     		translate["IMPL1", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) implies \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\)";   	
     		translate["IMPL2", lang] = translate["IMPL1", lang];   	
     		translate["EQUIV1", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) iff \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\)";   	
     		translate["EQUIV2", lang] = translate["EQUIV1", lang];   	
     		translate["EQUIV3", lang] = "\!\(\*FormBox[FrameBox[\"e1\"], SelectionPlaceholder]\) iff ... iff \!\(\*FormBox[FrameBox[\"en\"], SelectionPlaceholder]\)";
     		translate["EQ1", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) equals \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\)";   	
     		translate["EQ2", lang] = translate["EQ1", lang];   	
     		translate["EQUIVDEF", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) iff \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\) (by def.)";   	
     		translate["EQDEF", lang] = "\!\(\*FormBox[FrameBox[\"left\"], SelectionPlaceholder]\) = \!\(\*FormBox[FrameBox[\"right\"], SelectionPlaceholder]\) (by def.)";   	
     		translate["FORALL1", lang] = "for all \!\(\*FormBox[FrameBox[\"rg\"], Placeholder]\): \!\(\*FormBox[FrameBox[\"expr\"], SelectionPlaceholder]\)";   	
     		translate["FORALL2", lang] = "for all \!\(\*FormBox[FrameBox[\"rg\"], Placeholder]\) satisfying \!\(\*FormBox[FrameBox[\"cond\"], Placeholder]\): \!\(\*FormBox[FrameBox[\"expr\"], SelectionPlaceholder]\)";   	
     		translate["EXISTS1", lang] = "exists \!\(\*FormBox[FrameBox[\"rg\"], Placeholder]\) s.t. \!\(\*FormBox[FrameBox[\"expr\"], SelectionPlaceholder]\)";   	
     		translate["EXISTS2", lang] = "exists \!\(\*FormBox[FrameBox[\"rg\"], Placeholder]\) satisfying \!\(\*FormBox[FrameBox[\"cond\"], Placeholder]\) s.t. \!\(\*FormBox[FrameBox[\"expr\"], SelectionPlaceholder]\)";   	
     		translate["LET", lang] = "let \!\(\*FormBox[FrameBox[\"a\"], Placeholder]\) be an abbreviation for \!\(\*FormBox[FrameBox[\"x\"], Placeholder]\) in \!\(\*FormBox[FrameBox[\"expr\"], SelectionPlaceholder]\)";
     		translate["CASEDIST", lang] = "distinguish cases \!\(\*FormBox[FrameBox[\"c1\"], Placeholder]\) ... \!\(\*FormBox[FrameBox[\"cn\"], Placeholder]\)";
     		translate["SINGLEOP", lang] = "single operator";
     		translate["OVEROP", lang] = "overscripted operator";
     		translate["UNDEROVEROP", lang] = "under- and overscripted operator";
     		translate["SUBOP", lang] = "subscripted operator";
     		translate["SUPEROP", lang] = "superscripted operator";
     		translate["SUBSUPEROP", lang] = "sub- and superscripted operator";
     		translate["OVERSUBOP", lang] = "over- and subscripted operator";
     		translate["CONN2Tooltip", lang] = "left, right ... formula\n";   	
     		translate["CONN2STRONGTooltip", lang] = "left, right ... formula\nstrong binding";   	
     		translate["CONN2WEAKTooltip", lang] = "left, right ... formula\nweak binding";   	
     		translate["CONNTooltip", lang] = "e1, ..., en ... formula\nbinding of multiple formulae";
     		translate["NOTTooltip", lang] = "form ... formula\nlogical negation";
     		translate["EQUIVDEFTooltip", lang] = "left, right ... formula\npredicate definition";   	
     		translate["EQDEFTooltip", lang] = "left, right ... term\nfunction definition";   	
     		translate["QUANT1Tooltip", lang] = "rg ... ranges for the quantified variables\nexpr ... quantified expression";   	
     		translate["QUANT2Tooltip", lang] = "rg ... ranges for the quantified variables\ncond ... condition on the variables\nexpr ... quantified expression";
     		translate["LETTooltip", lang] = "a ... variable used as abbreviation\nx ... abbreviated expression\nexpr ... expression where a abbreviates x";   	
     		translate["CASEDISTTooltip", lang] = "e1, ..., en ... expressions\nc1, ..., cn ... conditions";   	
     		translate["0ANNOPTooltip", lang] = "\[SmallCircle] ... operator symbol";
     		translate["1ANNOPTooltip", lang] = "\[SmallCircle] ... operator symbol\nA ... annotation";
     		translate["2ANNOPTooltip", lang] = "\[SmallCircle] ... operator symbol\nA ... annotation\nB ... annotation";
     		translate["tcSessTabMathTabBS", lang] = "Button style";   	
     		translate["tcSessTabMathTabBSnat", lang] = "natural";   	
     		translate["tcSessTabMathTabBSform", lang] = "formal";
     		translate["Press shift to omit parentheses\nKeyboard shortcut:"] = "Press \[ShiftKey] to omit parentheses\nKeyboard shortcut:";   	
    	translate["tcSessTabInspectTabLabel", lang] = "inspect";
    		translate["tcSessTabEnvTabButtonAllFormLabel", lang] = "All Formulae";
    		translate["tcSessTabEnvTabButtonAllDeclLabel", lang] = "All Declarations";
    		translate["tcSessTabEnvTabButtonDeclLabel", lang] = "Identify global declarations";
    	translate["tcSessTabArchTabLabel", lang] = "archives";
    		translate["tcLangTabArchTabSectionCreate", lang] = "Creating Archives";
    		translate["tcLangTabArchTabButtonMakeLabel", lang] = "Notebook \[RightArrow] Archive";
    		translate["tcLangTabArchTabButtonInfoLabel", lang] = "Archive Info";
    		translate["tcLangTabArchTabButtonCloseLabel", lang] = "End";
    		translate["tcLangTabArchTabSectionLoad", lang] = "Loading Archives";
    		translate["tcLangTabArchTabNoArchSel", lang] = "No archives selected";
    		translate["tcLangTabArchTabButtonSelectLabel", lang] = "Select Archives ...";
    		translate["tcLangTabArchTabButtonLoadLabel", lang] = "Load";
    		translate["in place", lang] = "in place";
    translate["tcProveTabLabel", lang] = "Prove";
    	translate["tcProveTabGoalTabLabel", lang] = "goal";
    	translate["tcProveTabKBTabLabel", lang] = "knowledge";
    	translate["tcProveTabBuiltinTabLabel", lang] = "built-in";
    	translate["tcProveTabProverTabLabel", lang] = "prover";
    	translate["tcProveTabSubmitTabLabel", lang] = "submit";
    	translate["tcProveTabInspectTabLabel", lang] = "inspect";
    		translate["zoom in", lang] = "zoom in";
    		translate["optimal size", lang] = "optimal size";
    		translate["fit into window", lang] = "fit into window";
    		translate["zoom out", lang] = "zoom out";
    translate["tcComputeTabLabel", lang] = "Compute";
    	translate["tcComputeTabSetupTabLabel", lang] = "setup";
    	translate["tcComputeTabKBTabLabel", lang] = "knowledge";
    	translate["tcComputeTabBuiltinTabLabel", lang] = "built-in";
    translate["tcSolveTabLabel", lang] = "Solve";
    	translate["tcSolveTabKBTabLabel", lang] = "knowledge";
    	translate["tcSolveTabBuiltinTabLabel", lang] = "built-in";
    translate["tcPreferencesTabLabel", lang] = "Preferences";
	    translate["tcPrefLanguage", lang] = "Language";
	    translate["tcPrefArchiveDir", lang] = "Archive Directory";
	    translate["tcPrefAppear", lang] = "Appearance";
	    	translate["tcPrefAppearColorSchemes", lang] = "Color Schemes";
	    	translate["tcPrefAppearWelcome", lang] = "Welcome Screen";
	    	translate["tcPrefAppearSuppressWelcome", lang] = "Suppress welcome screen";
	    translate["tcPrefCache", lang] = "Cache Format";
	    translate["tcPrefCachePrivate", lang] = "Private Cache";
	    translate["tcPrefCachePublic", lang] = "Public Cache";
	translate["New", lang] = "New";
	translate["Open", lang] = "Open";
	translate["nA", lang] = "not available";
	translate["pRules", lang] = "Proof Rules";
	translate["pRulesSetup", lang] = "Proof Rules Setup";
	translate["ruleActive", lang] = "Activate/deactivate the inference rule";
	translate["rulePriority", lang] = "The priority of the rule as an integer between 1 and 100. Lower value means higher priority";
	translate["pStrat", lang] = "Proof Strategy";
	translate["sLimits", lang] = "Proof Search Limits";
	translate["sDepth", lang] = "Search Depth";
	translate["sTime", lang] = "Search Time";
    translate["noKnowl", lang] = "No knowledge available";
	translate["noGoal", lang] = "Select a whole cell (cell bracket) containing the proof goal";
	translate["noKB", lang] = "No knowledge selected";
	translate["selGoal", lang] = "Selected Proof Goal";
	translate["selectedRules",lang] = "Selected Rules";
	translate["selKB", lang] = "Selected Knowledge Base";
	translate["selBui", lang] = "Selected Built-ins";
	translate["selProver", lang] = "Selected Prover";
	translate["prove", lang] = "Prove!";
	translate["OKnext", lang] = "OK, next ...";
	translate["OK", lang] = "OK";
	translate["Filter", lang] = "Filter";
	translate["FilterRulesWindow"] = "Filter by keyword";
	translate["Keyword"] = "Keyword: ";
	translate["RestoreDefaults"] = "Restore defaults";
	translate["ShowAll"] = "Show all";
	translate["FilteredBy"] = "Filtered by: ";
	translate["noRules"] = "no rules found";
	translate["pSimp", lang] = "Proof Simplification";
	translate["elimBranches", lang] = "Eliminate failing/pending branches";
	translate["elimSteps", lang] = "Eliminate superfluous steps";
	translate["elimForm", lang] = "Eliminate unused formulae";
	translate["pInteractive", lang] = "Interactive Proving";
	translate["interactiveProofSitSel", lang] = "Select next proof situation interactively";
	translate["interactiveNewProofSitFilter", lang] = "Filter new proof situations interactively";
	translate["interactiveInstantiate", lang] = "Instantiate quantifiers interactively";
	translate["noRoot", lang] = "Cannot identify root of proof tree";
	translate["proofCellStatus", lang] = "Initial status of nested proof cells";
	translate["auto", lang] = "automatic";
	translate["open", lang] = "all open";
	translate["closed", lang] = "all closed";
	translate["abort", lang] = "Abort proof";
	translate["proved", lang] = "proved";
	translate["failed", lang] = "failed";
	translate["pending", lang] = "pending";
	translate["disproved", lang] = "disproved";
	translate["open proof situation", lang] = "Open proof situation";
	translate["unknown proof node", lang] = "Unknown proof node";
	translate["apply color scheme", lang] = "Apply color scheme";
	translate["save current settings", lang] = "Save current settings";
	translate["preferences last saved: ", lang] = "Preferences last saved: ";
	translate["instantiate later", lang] = "Instantiate later";
	translate["instVar", lang] = "Variables to be instantiated";
	translate["availConst", lang] = "Available constants";

	translate["Virtual Keyboard", lang] = "Virtual Keyboard";
	    
	translate["Operators", lang] = "Operators";
    translate["Sets", lang] = "Sets";
    translate["Tuples", lang] = "Tuples";
    translate["Arithmetic", lang] = "Arithmetic";
    translate["Logic", lang] = "Logic";
    translate["Domains", lang] = "Domains and Data Types";
    translate["Programming", lang] = "Mathematica Programming";
    translate["BuiComp", lang] = "Builtins used in computation";
    translate["KBcomp", lang] = "Knowledge used in computation";
    translate["GoalProve", lang] = "Proof goal";
    translate["BuiProve", lang] = "Builtins used in proof";
    translate["KBprove", lang] = "Knowledge used in proof";
    translate["RestoreEnv", lang] = "Restore environment";
    translate["RestoreEnvLong", lang] = "Really restore all relevant settings to the values they had when this action was performed last time?";
    translate["ResetBui", lang] = "Reset built-ins";
    translate["Proof of", lang] = "Proof of";
    translate["ShowProof", lang] = "Show proof";

    translate["noNB", lang] = "No notebook file available: ";

    translate["fileTypeArchive", lang] = "Theorema archive";
    translate["fileTypeNotebook", lang] = "Theorema notebook";

(* General *)
	translate["outsideSession", lang] = "An evaluation of this type of cell is not expected in the current type of session";
	translate["archLabelBegin", lang] = "Begin Archive";
	translate["archLabelEnd", lang] = "End Archive";
	translate["archLabelName", lang] = "name:  ";
	translate["archLabelNeeds", lang] = "needs: ";
	translate["archLabelPublic", lang] = "public: ";
	translate["archiveNameDialogField", lang] = "Choose a name for the archive:";
	translate["archiveNameDialogHint", lang] = "valid archive name should end in `";
	    
(* Theorema`Language`Session` *)
    translate["notUniqueLabel", lang] = "These labels are not unique in the notebook: ``\n\nThis is just a warning, you can continue,\nbut referencing formulae from this notebook\nmight turn out to be confusing.";
    translate["cantCreateDir", lang] = "Cannot create directory ``.";
    translate["noArchName", lang] = "No archive name available for chosen archive. Check file content.";
    translate["Global Declarations"] = "Global Declarations valid at this cell";
    translate["None"] = "None";

(* Theorema`Language`Parser` *)
    translate["tupleOfRange", lang] = "The tuple quantifier can only be used with step-ranges, not with ``.";
    translate["ambiguousRange", lang] = "The range `` does not unambiguously mark one variable.";

(* Theorema`Provers`Common` *)
    translate["more", lang] = "more \[Ellipsis]";
    translate["hide proof", lang] = "hide proof";
    translate["showProofProgress", lang] = "Show the proof progress so far";
    translate["hideProofProgress", lang] = "Hide the proof by clicking here. Do not close the proof window, since it cannot be re-opened then.";

]
