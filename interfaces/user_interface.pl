:- module(user_interface, [user_welcome/0, user_menu/0]).

:- use_module(interfaces/interface).

user_welcome:-
    nl,
    write('Hello, User.'), 
    nl,
    user_menu.


user_menu :-
    nl,
    write('Choose an option:'), nl,
    write('>   1. Use system.'), nl,
    write('>   2. Log out.'), nl,
    write('>   3. Exit'), nl, nl,
    read(Anwser),
    (
        Anwser == 1 -> questionnaire;
        Anwser == 2 -> write('Logging out...'), nl, nl, main_menu;
        Anwser == 3 -> write('Good Bye'), nl, true;
        write('Incorrect option, try again.'), nl, nl,
		user_menu
    ).


questionnaire :-
    nl,
    write('Questionnaire'), 
    nl,
    check_PolishNationality,
    check_SpeakingEnglish,
    check_BachelorDegree,
    check_SEabilities,
    check_VSEnv,
    check_VCSystem,
    check_ProgrammingSkills,
    check_CshKnowledge,
    check_Experience,  
    write('The end of questions.'), nl,
    write('Computing anwser...'), nl,
    user_menu.

check_PolishNationality :-
    write('check polish nationality'), nl.

check_SpeakingEnglish :-
    write('check speaking english'), nl.

check_BachelorDegree :-
    write('check bachelor degree'), nl.

check_SEabilities :-
    write('check SE abilities'), nl.

check_VSEnv  :-
    write('check VS Env'), nl.

check_VCSystem  :-
    write('check VC system'), nl.

check_ProgrammingSkills  :-
    write('check programming skills'), nl.

check_CshKnowledge  :-
    write('check c# knowledge'), nl.

check_Experience  :-
    write('check experience'), nl.
