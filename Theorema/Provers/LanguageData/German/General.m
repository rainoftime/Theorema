
With[ {lang = "German"},

proofStepText[ "Initial", lang, goal_, kb_] := {textCell[ "Wir beweisen:"], 
         goalCell[ goal], 
         textCell[ "unter den Annahmen:"], 
         assumptionListCells[ kb, ",", "."]
         };
         
proofStepText[ "Proof Situation", lang, goal_, ___] := {textCell[ "Um", referenceCell[ goal], "zu beweisen, m\[UDoubleDot]ssen wir ..."]};

proofStepText[ step_, lang, goal_, ___] := {textCell[ StringForm[ "Es steht kein erkl\[ADoubleDot]render Text zum Schritt '``' zur Verf\[UDoubleDot]gung. Implementieren Sie einen entsprechenden Zweig in der Funktion '``'.", step, "proofStepText"]]};

] (* With *)
