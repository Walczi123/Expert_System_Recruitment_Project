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
        map_skill_factor/2
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
        Answer == upper-intermediate -> Factor is 0.7;
        Answer == upint -> Factor is 0.7;
        Answer == advanced -> Factor is 0.9;
        Answer == adv -> Factor is 0.9
    ).

% skill_factor(Position, Factor) :-
%     one_skill(Hotel, SmallFactor),
%     medium_hotel_size(Hotel, MediumFactor),
%     big_hotel_size(Hotel, BigFactor),
%     map_hotel_size_to_factor(small, SmallMappedFactor),
%     map_hotel_size_to_factor(medium, MediumMappedFactor),
%     map_hotel_size_to_factor(big, BigMappedFactor),
%     sharpen(
%         [SmallFactor, MediumFactor, BigFactor],
%         [SmallMappedFactor, MediumMappedFactor, BigMappedFactor],
%         Factor
%     ).



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
    Product is (H_L * H_R) + R.

