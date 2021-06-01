
:- module(factors, [
    get_yesno_factor/3, 
    get_polishNationality_factor/3,
    get_speakingEnglish_factor/3,
    get_bachelorDegree_factor/3,
    get_ComputerScienceDegree_factor/3,
    get_seAblities_factor/3,
    get_vsEnv_factor/3,
    get_vcSystem_factor/3,
    get_programmingSkills_factor/3,
    get_cshKnowledge_factor/3,
    get_experience_factor/3
    ]).

% factors 
get_yesno_factor(Value, NewValue, Factor) :-
    (
        Value == no -> Factor is 0, NewValue = 'no';
        Value == n -> Factor is 0, NewValue = 'no';
        Value == yes -> Factor is 1, NewValue =  'yes';
        Value == y -> Factor is 1, NewValue = 'yes';
        nl, write('Write yes (y) or no (n)'), nl,
        read(V),
        get_yesno_factor(V, NewValue, Factor)
    ).

get_polishNationality_factor(Value, NewValue, Factor) :-
    get_yesno_factor(Value, NewValue, F),
    Factor = F.

get_speakingEnglish_factor(Value, NewValue, Factor) :-
    get_yesno_factor(Value, NewValue, F),
    Factor = F.

get_bachelorDegree_factor(Value, NewValue, Factor) :-
    get_yesno_factor(Value, NewValue, F),
    Factor = F.

get_ComputerScienceDegree_factor(Value, NewValue, Factor) :-
    get_yesno_factor(Value, NewValue, F),
    Factor = F.

get_seAblities_factor(Value, NewValue, Factor) :-
    get_yesno_factor(Value, NewValue, F),
    Factor = F.

get_vsEnv_factor(Value, NewValue, Factor) :-
    get_yesno_factor(Value, NewValue, Factor).

get_vcSystem_factor(Value, NewValue, Factor) :-
    get_yesno_factor(Value, NewValue, Factor).

get_programmingSkills_factor(Value, NewValue, Factor) :-
    (
        Value == beginner -> Factor is 0.1, NewValue = 'beginner';
        Value == b -> Factor is 0.1, NewValue = 'beginner';
        Value == elementary -> Factor is 0.3, NewValue = 'elementary';
        Value == e -> Factor is 0.3, NewValue = 'elementary';
        Value == intermediate -> Factor is 0.5, NewValue = 'intermediate';
        Value == int -> Factor is 0.5, NewValue = 'intermediate';
        Value == upper-intermediate -> Factor is 0.7, NewValue = 'upper-intermediate';
        Value == upint -> Factor is 0.7, NewValue = 'upper-intermediate'; 
        Value == advanced -> Factor is 0.9, NewValue = 'advanced';
        Value == adv -> Factor is 0.9, NewValue = 'advanced';
        nl, write('Write beginner(b) or elementary(e) or intermediate(int) or upper-intermediate(upint) or advanced(adv)'), nl,
        read(V),
        get_programmingSkills_factor(V, NewValue, Factor)
    ).

get_cshKnowledge_factor(Value, NewValue, Factor) :-
    (
        Value == beginner -> Factor is 0.1, NewValue = 'beginner';
        Value == b -> Factor is 0.1, NewValue = 'beginner';
        Value == elementary -> Factor is 0.3, NewValue = 'elementary';
        Value == e -> Factor is 0.3, NewValue = 'elementary';
        Value == intermediate -> Factor is 0.5, NewValue = 'intermediate';
        Value == int -> Factor is 0.5, NewValue = 'intermediate';
        Value == upper-intermediate -> Factor is 0.7, NewValue = 'upper-intermediate';
        Value == upint -> Factor is 0.7, NewValue = 'upper-intermediate'; 
        Value == advanced -> Factor is 0.9, NewValue = 'advanced';
        Value == adv -> Factor is 0.9, NewValue = 'advanced';
        nl, write('Write beginner(b) or elementary(e) or intermediate(int) or upper-intermediate(upint) or advanced(adv)'), nl,
        read(V),
        get_cshKnowledge_factor(V, NewValue, Factor)
    ).

get_experience_factor(Value, NewValue, Factor) :-
    (
        Value == intern -> Factor is 0.3, NewValue = 'intern';
        Value == i -> Factor is 0.3, NewValue = 'intern';
        Value == junior -> Factor is 0.4, NewValue = 'junior';
        Value == j -> Factor is 0.4, NewValue = 'junior';
        Value == mid -> Factor is 0.5, NewValue = 'mid';
        Value == m -> Factor is 0.5, NewValue = 'mid';
        Value == senior -> Factor is 0.85, NewValue = 'senior';
        Value == s -> Factor is 0.85, NewValue = 'senior'; 
        Value == architect -> Factor is 1, NewValue = 'architect';
        Value == a -> Factor is 1, NewValue = 'architect';
        nl, write('Specify experience'), nl,
        read(V),
        get_experience_factor(V, NewValue, Factor)
    ).
