:- module(production_rules, [get_recommendation/1]).

get_recommendation(Factors) :-
    nl,
    write('Available positions:'),nl,
    recommend_webDev(Factors, Ans1),
    recommend_juniorFrontendDev(Factors, Ans2),
    recommend_midFrontendDev(Factors, Ans3),
    recommend_seniorFrontentDev(Factors, Ans4),
    recommend_juniorBackednDev(Factors, Ans5),
    recommend_midBackendDev(Factors, Ans6),
    recommend_seniorBackendDev(Factors, Ans7),
    recommend_projectManager(Factors, Ans8),
    recommend_fullstackDev(Factors, Ans9),
    recommend_tester(Factors, Ans10),
    recommend_secretary(Factors, Ans11),

    (Ans1 == 1 -> write('WebDev'), nl),
    (Ans2 == 1 -> write('JuniorFrontendDev'), nl),
    (Ans3 == 1 -> write('MidFrontendDev'), nl),
    (Ans4 == 1 -> write('SeniorFrontendDev'), nl),
    (Ans5 == 1 -> write('JuniorBackendDev'), nl),
    (Ans6 == 1 -> write('MidBackendDev'), nl),
    (Ans7 == 1 -> write('SeniorBackendDev'), nl),
    (Ans8 == 1 -> write('ProjectManager'), nl),
    (Ans9 == 1 -> write('FullstackDev'), nl),
    (Ans10 == 1 -> write('Tester'), nl),
    (Ans11 == 1 -> write('Secretary'), nl)
    .


recommend_webDev([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (Pl == 1, SE == 1, VC == 1, Pro >= 0.5, Csh >= 0, Exp >= 0.4 -> Ans is 1; Ans is 0).

recommend_juniorFrontendDev([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (Pl == 1, VC == 1, Pro >= 0.3, Csh >= 0, Exp >= 0.3 -> Ans is 1; Ans is 0).

recommend_midFrontendDev([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (En == 1, Pl == 1, Eng == 1, CS == 1, SE == 1, VC == 1, Pro >= 0.5, Csh >= 0, Exp >= 0.4 -> Ans is 1; Ans is 0).

recommend_seniorFrontentDev([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (En == 1, Pl == 1, Eng == 1, CS == 1, SE == 1, VC == 1, Pro >= 0.9, Csh >= 0, Exp >= 0.5 -> Ans is 1; Ans is 0).

recommend_juniorBackednDev([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (Pl == 1, VS == 1, VC == 1, Pro >= 0.3, Csh >= 0.3, Exp >= 0.3 -> Ans is 1; Ans is 0).

recommend_midBackendDev([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (En == 1, Pl == 1, Eng == 1, CS == 1, SE == 1, VS == 1, VC == 1, Pro >= 0.5, Csh >= 0.5, Exp >= 0.4 -> Ans is 1; Ans is 0).

recommend_seniorBackendDev([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (En == 1, Pl == 1, Eng == 1, CS == 1, SE == 1, VS == 1, VC == 1, Pro >= 0.9, Csh >= 0.7, Exp >= 0.5 -> Ans is 1; Ans is 0).

recommend_projectManager([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (En == 1, Pl == 1, Eng == 1, SE == 1, VC == 1, Pro >= 0.1, Csh >= 0, Exp >= 0.85 -> Ans is 1; Ans is 0).

recommend_fullstackDev([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (En == 1, Pl == 1, Eng == 1, CS == 1, SE == 1, VS == 1, VC == 1, Pro >= 0.9, Csh >= 0.5, Exp >= 0.85 -> Ans is 1; Ans is 0).

recommend_tester([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (En == 1, Pl == 1, SE == 1, VC == 1, Pro >= 0.3, Csh >= 0, Exp >= 0.4 -> Ans is 1; Ans is 0).

recommend_secretary([En, Pl, Eng, CS, SE, VS, VC, Pro, Csh, Exp], Ans) :- 
    (En == 1, Pl == 1, Pro >= 0, Csh >= 0, Exp >= 0.4 -> Ans is 1; Ans is 0).