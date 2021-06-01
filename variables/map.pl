:- module(map, 
	[
        map_PN_factor/3,
        map_SE_factor/3,
        map_BD_factor/3,
        map_CSD_factor/3,
        map_SEA_factor/3,
        map_VSE_factor/3,
        map_VCS_factor/3,
        map_exp_factor/2,
        map_skill_factor/2,
        exp_factor/2,
        skill_factor/2,
        skill2_factor/2
	]).

map_PN_factor(Answer, Position, Factor) :-
	(
        Answer == no ->  no_PN(Position,Factor);
        Answer == yes ->  yes_PN(Position,Factor);
        Answer == n ->  no_PN(Position,Factor);
		Answer == y ->  yes_PN(Position,Factor)
	).

no_PN(Position, Factor) :-
    (
        (db:polishNationality(Position)) -> Factor is 0;
        Factor is 1
    ).

yes_PN(Position, Factor) :-
    (
        (db:polishNationality(Position)) -> Factor is 1;
        Factor is 0
    ).

map_SE_factor(Answer, Position, Factor) :-
	(
        Answer == no ->  no_SE(Position,Factor);
        Answer == yes ->  yes_SE(Position,Factor);
        Answer == n ->  no_SE(Position,Factor);
		Answer == y ->  yes_SE(Position,Factor)
	).

no_SE(Position, Factor) :-
    (
        (db:english(Position)) -> Factor is 0;
        Factor is 1
    ).

yes_SE(Position, Factor) :-
    (
        (db:english(Position)) -> Factor is 1;
        Factor is 0
    ).

map_BD_factor(Answer, Position, Factor) :-
	(
        Answer == no ->  no_BD(Position,Factor);
        Answer == yes ->  yes_BD(Position,Factor);
        Answer == n ->  no_BD(Position,Factor);
		Answer == y ->  yes_BD(Position,Factor)
	).

no_BD(Position, Factor) :-
    (
        (db:engineer(Position)) -> Factor is 0;
        Factor is 1
    ).

yes_BD(Position, Factor) :-
    (
        (db:engineer(Position)) -> Factor is 1;
        Factor is 0
    ).

map_CSD_factor(Answer, Position, Factor) :-
	(
        Answer == no ->  no_CSD(Position,Factor);
        Answer == yes ->  yes_CSD(Position,Factor);
        Answer == n ->  no_CSD(Position,Factor);
		Answer == y ->  yes_CSD(Position,Factor)
	).

no_CSD(Position, Factor) :-
    (
        (db:csAbsolvent(Position)) -> Factor is 0;
        Factor is 1
    ).

yes_CSD(Position, Factor) :-
    (
        (db:csAbsolvent(Position)) -> Factor is 1;
        Factor is 0
    ).

map_SEA_factor(Answer, Position, Factor) :-
	(
        Answer == no ->  no_SEA(Position,Factor);
        Answer == yes ->  yes_SEA(Position,Factor);
        Answer == n ->  no_SEA(Position,Factor);
		Answer == y ->  yes_SEA(Position,Factor)
	).

no_SEA(Position, Factor) :-
    (
        (db:softwareEngKnowledge(Position)) -> Factor is 0;
        Factor is 1
    ).

yes_SEA(Position, Factor) :-
    (
        (db:softwareEngKnowledge(Position)) -> Factor is 1;
        Factor is 0
    ).

map_VSE_factor(Answer, Position, Factor) :-
	(
        Answer == no ->  no_VSE(Position,Factor);
        Answer == yes ->  yes_VSE(Position,Factor);
        Answer == n ->  no_VSE(Position,Factor);
		Answer == y ->  yes_VSE(Position,Factor)
	).

no_VSE(Position, Factor) :-
    (
        (db:visualStudioKnowledge(Position)) -> Factor is 0;
        Factor is 1
    ).

yes_VSE(Position, Factor) :-
    (
        (db:visualStudioKnowledge(Position)) -> Factor is 1;
        Factor is 0
    ).

map_VCS_factor(Answer, Position, Factor) :-
	(
        Answer == no ->  no_VCS(Position,Factor);
        Answer == yes ->  yes_VCS(Position,Factor);
        Answer == n ->  no_VCS(Position,Factor);
		Answer == y ->  yes_VCS(Position,Factor)
	).

no_VCS(Position, Factor) :-
    (
        (db:versionControlKnowledge(Position)) -> Factor is 0;
        Factor is 1
    ).

yes_VCS(Position, Factor) :-
    (
        (db:versionControlKnowledge(Position)) -> Factor is 1;
        Factor is 0
    ).


map_exp_factor(Answer, Factor) :-
	(
        Answer == intern -> Factor is 0.3;
        Answer == i -> Factor is 0.3;
        Answer == junior -> Factor is 0.4;
        Answer == j -> Factor is 0.4;
        Answer == mid -> Factor is 0.5;
        Answer == m -> Factor is 0.5;
        Answer == senior -> Factor is 0.85;
        Answer == s -> Factor is 0.85;
        Answer == architect -> Factor is 1;
        Answer == a -> Factor is 1
	).

map_skill_factor(Answer, Factor) :-
    (
        Answer == beginner -> Factor is 0.1;
        Answer == b -> Factor is 0.1;
        Answer == elementary -> Factor is 0.3;
        Answer == e -> Factor is 0.3;
        Answer == intermediate -> Factor is 0.5;
        Answer == int -> Factor is 0.5;
        Answer == 'upper-intermediate' -> Factor is 0.7;
        Answer == upint -> Factor is 0.7;
        Answer == advanced -> Factor is 0.9;
        Answer == adv -> Factor is 0.9
    ).

skill_factor(Position, Factor) :-
    one_skill(Position, O),
    two_skill(Position, T),
    three_skill(Position, TH),
    four_skill(Position, F),
    five_skill(Position, FI),
    map_skill_factor(b, O2),
    map_skill_factor(e, T2),
    map_skill_factor(int, TH2),
    map_skill_factor(upint, F2),
    map_skill_factor(adv, FI2),
    defuzzy(
        [O, T, TH, F, FI],
        [O2,T2,TH2,F2,FI2],
        Factor
    ).

skill2_factor(Position, Factor) :-
    one_skill2(Position, O),
    two_skill2(Position, T),
    three_skill2(Position, TH),
    four_skill2(Position, F),
    five_skill2(Position, FI),
    map_skill_factor(b, O2),
    map_skill_factor(e, T2),
    map_skill_factor(int, TH2),
    map_skill_factor(upint, F2),
    map_skill_factor(adv, FI2),
    defuzzy(
        [O, T, TH, F, FI],
        [O2,T2,TH2,F2,FI2],
        Factor
    ).

exp_factor(Position, Factor) :-
    one_exp(Position, O),
    two_exp(Position, T),
    three_exp(Position, TH),
    four_exp(Position, F),
    five_exp(Position, FI),
    map_exp_factor(i, O2),
    map_exp_factor(j, T2),
    map_exp_factor(m, TH2),
    map_exp_factor(s, F2),
    map_exp_factor(a, FI2),
    defuzzy(
        [O, T, TH, F, FI],
        [O2,T2,TH2,F2,FI2],
        Factor
    ).

one_skill(Position, Factor) :-
    db:programmingSkill(Position, Value),
    (
        number(Value), Value =:=0 -> Factor is 0;
        number(Value), Value =< 10 -> Factor is Value/10 ;
        number(Value), Value =< 15 -> Factor is 1 ;
        number(Value), Value =< 22.5 -> Factor is (22.5-Value)/7.5 ;
        number(Value), Value >= 10 -> Factor is 0
    ).

two_skill(Position, Factor) :-
    db:programmingSkill(Position, Value),
    (
        number(Value), Value =< 17.5 -> Factor is 0;
        number(Value), Value =< 30 -> Factor is (Value - 17.5)/12.5 ;
        number(Value), Value =< 35 -> Factor is 1 ;
        number(Value), Value =< 45 -> Factor is (45-Value)/10 ;
        number(Value), Value > 45 -> Factor is 0
    ).

three_skill(Position, Factor) :-
    db:programmingSkill(Position, Value),
    (
        number(Value), Value =< 40 -> Factor is 0 ;
        number(Value), Value =< 50 -> Factor is (Value - 40)/10 ;
        number(Value), Value =< 60.5 -> Factor is 1 ;
        number(Value), Value =< 70 -> Factor is (70-Value)/9.5 ;
        number(Value), Value > 70 -> Factor is 0
    ).

four_skill(Position, Factor) :-
    db:programmingSkill(Position, Value),
    (
        number(Value), Value =< 67.5 -> Factor is 0 ;
        number(Value), Value =< 75 -> Factor is (Value - 67.5)/7.5 ;
        number(Value), Value =< 85.5 -> Factor is 1 ;
        number(Value), Value =< 93 -> Factor is (93-Value)/7.5 ;
        number(Value), Value > 93 -> Factor is 0
    ).

five_skill(Position, Factor) :-
    db:programmingSkill(Position, Value),
    (
        number(Value), Value =< 40 -> Factor is 0 ;
        number(Value), Value =< 50 -> Factor is (Value - 40)/10 ;
        number(Value), Value =< 60.5 -> Factor is 1 ;
        number(Value), Value =< 70 -> Factor is (70-Value)/9.5 ;
        number(Value), Value > 70 -> Factor is 0
    ).

one_skill2(Position, Factor) :-
    db:cshKnowledge(Position, Value),
    (
        number(Value), Value =:=0 -> Factor is 0 ;
        number(Value), Value =< 10 -> Factor is Value/10 ;
        number(Value), Value =< 15 -> Factor is 1 ;
        number(Value), Value =< 22.5 -> Factor is (22.5-Value)/7.5 ;
        number(Value), Value >= 10 -> Factor is 0
    ).

two_skill2(Position, Factor) :-
    db:cshKnowledge(Position, Value),
    (
        number(Value), Value =< 17.5 -> Factor is 0 ;
        number(Value), Value =< 30 -> Factor is (Value - 17.5)/12.5 ;
        number(Value), Value =< 35 -> Factor is 1 ;
        number(Value), Value =< 45 -> Factor is (45-Value)/10 ;
        number(Value), Value > 45 -> Factor is 0
    ).

three_skill2(Position, Factor) :-
    db:cshKnowledge(Position, Value),
    (
        number(Value), Value =< 40 -> Factor is 0 ;
        number(Value), Value =< 50 -> Factor is (Value - 40)/10 ;
        number(Value), Value =< 60.5 -> Factor is 1 ;
        number(Value), Value =< 70 -> Factor is (70-Value)/9.5 ;
        number(Value), Value > 70 -> Factor is 0
    ).

four_skill2(Position, Factor) :-
    db:cshKnowledge(Position, Value),
    (
        number(Value), Value =< 67.5 -> Factor is 0 ;
        number(Value), Value =< 75 -> Factor is (Value - 67.5)/7.5 ;
        number(Value), Value =< 85.5 -> Factor is 1 ;
        number(Value), Value =< 93 -> Factor is (93-Value)/7.5 ;
        number(Value), Value > 93 -> Factor is 0
    ).

five_skill2(Position, Factor) :-
    db:cshKnowledge(Position, Value),
    (
        number(Value), Value =< 40 -> Factor is 0 ;
        number(Value), Value =< 50 -> Factor is (Value - 40)/10 ;
        number(Value), Value =< 60.5 -> Factor is 1 ;
        number(Value), Value =< 70 -> Factor is (70-Value)/9.5 ;
        number(Value), Value > 70 -> Factor is 0
    ).

one_exp(Position, Factor) :-
    db:experience(Position, Value),
    (
        number(Value), Factor is 1/(1+abs(Value/5)**5)
    ).

two_exp(Position, Factor) :-
    db:experience(Position, Value),
    (
    number(Value), Factor is e**((-1/2)*((Value - 23.5)/5.5)**2)
    ).

three_exp(Position, Factor) :-
    db:experience(Position, Value),
    (
    number(Value), Factor is e**((-1/2)*((Value - 41.5)/5.5)**2)
    ).

four_exp(Position, Factor) :-
    db:experience(Position, Value),
    (
    number(Value), Factor is e**((-1/2)*((Value - 63.5)/5.5)**2)
    ).

five_exp(Position, Factor) :-
    db:experience(Position, Value),
    (
    number(Value), Factor is 1/(1+abs((Value-122.5)/30)**6)
    ).


defuzzy(Factors, FactorValues, Result) :-
    list_sum_2(Factors, FactorValues, Up),
    list_sum(Factors, Down),
    (
        Down == 0 -> Result is 0;
        Result is Up / Down
    ).

list_sum([], 0).
list_sum([H|T], Sum) :-
   sum_list(T, R),
   Sum is H + R.

list_sum_2([], [], 0).
list_sum_2([H_L|T_L], [H_R|T_R], P) :- 
    list_sum_2(T_L, T_R, R), 
    P is (H_L * H_R) + R.

