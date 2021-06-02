:- module(user_interface, [user_welcome/0, user_menu/0, check_all/2]).

:- use_module(interfaces/interface).
:- use_module(variables/constants).
:- use_module(variables/factors).
:- use_module(common_functions/print_functions).
:- use_module(fuzzy/fuzzy).
:- use_module(production_rules).

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
        Anwser == 1 ->  nl, write('Questionnaire'), nl, questionnaire;
        Anwser == 2 -> write('Logging out...'), nl, nl, main_menu;
        Anwser == 3 -> write('Good Bye'), nl, true;
        write('Incorrect option, try again.'), nl, nl,
		user_menu
    ).


questionnaire :-
    check_all(Ans, Fac), nl,
    write('The end of questions.'), nl,
    write('Computing anwser...'), nl,
    get_recommendation(Fac), nl,
    fuzzy_inference(Ans, Result),
    show_result(Result),
    user_menu.

% [English, Nationality, Engineer, CsAbsolvent, SoftwareEngKnowledge, 
%     VisualStudioKnowledge, VersionControlKnowledge, ProgrammingSkill, CshKnowledge, Experience]

check_all(Answers, Factors) :-
    check_PolishNationality( AnwserPN, FactorPN), nl,
    check_SpeakingEnglish(AnwserSE, FactorSE), nl,
    check_BachelorDegree(AnwserBD, FactorBD), nl,
    check_ComputerScienceDegree(AnwserCSD, FactorCSD), nl,
    check_SEabilities(AnwserSEA, FactorSEA), nl,
    check_VSEnv(AnwserVSE, FactorVSE), nl,
    check_VCSystem(AnwserVCS, FactorVCS), nl,
    check_ProgrammingSkills(AnwserPS, FactorPS), nl,
    check_CshKnowledge(AnwserCSH, FactorCSH), nl,
    check_Experience(AnwserE, FactorE), nl,
    Answers = [AnwserSE, AnwserPN, AnwserBD, AnwserCSD, AnwserSEA, AnwserVSE, AnwserVCS, AnwserPS, AnwserCSH, AnwserE],
    Factors = [FactorSE, FactorPN, FactorBD, FactorCSD, FactorSEA, FactorVSE, FactorVCS, FactorPS, FactorCSH, FactorE].

check_PolishNationality(NewValue, Factor) :-
    write('Is the candidate of Polish nationality?'), nl,
    write('Options: '),
    polishNationality_options(Options),
    print_list(Options),
    read(Anwser),
    get_polishNationality_factor(Anwser, NewValue, Factor).

check_SpeakingEnglish(NewValue, Factor) :-
    write('Can the candidate speak English?'), nl,
    write('Options: '),
    speakingEnglish_options(Options),
    print_list(Options),
    read(Anwser),
    get_speakingEnglish_factor(Anwser, NewValue, Factor).

check_BachelorDegree(NewValue, Factor) :-
    write('Does the candidate have a bachelor\'s degree?'), nl,
    write('Options: '),
    bachelorDegree_options(Options),
    print_list(Options),
    read(Anwser),
    get_bachelorDegree_factor(Anwser, NewValue, Factor).

check_ComputerScienceDegree(NewValue, Factor) :-
    write('Does the candidate have a bachelor\'s degree in computer science?'), nl,
    write('Options: '),
    computerScienceDegree_options(Options),
    print_list(Options),
    read(Anwser),
    get_ComputerScienceDegree_factor(Anwser, NewValue, Factor).

check_SEabilities(NewValue, Factor) :-
    write('Does the candidate know the fundamentals of software engineering?'), nl,    
    write('Options: '),
    seAblities_options(Options),
    print_list(Options),
    read(Anwser),
    get_seAblities_factor(Anwser, NewValue, Factor).

check_VSEnv(NewValue, Factor) :-
    write('Is the candidate familiar with the Visual Studio environment?'), nl,
    write('Options: '),
    vsEnv_options(Options),
    print_list(Options),
    read(Anwser),
    get_vsEnv_factor(Anwser, NewValue, Factor).

check_VCSystem(NewValue, Factor)  :-
    write('Is the candidate familiar with any version control system?'), nl,
    write('Options: '),
    vcSystem_options(Options),
    print_list(Options),
    read(Anwser),
    get_vcSystem_factor(Anwser, NewValue, Factor).

check_ProgrammingSkills(NewValue, Factor)  :-
    write('Please rate the candidate\'s programming skills on the following scale.'), nl,
    write('Options: '),
    programmingSkills_options(Options),
    print_list(Options),
    read(Anwser),
    get_programmingSkills_factor(Anwser, NewValue, Factor).

check_CshKnowledge(NewValue, Factor) :-
    write('Please rate the candidate\'s knowledge of the C# language on the following scale.'), nl,
    write('Options: '),
    cshKnowledge_options(Options),
    print_list(Options),
    read(Anwser),
    get_cshKnowledge_factor(Anwser, NewValue, Factor).

check_Experience(NewValue, Factor) :-
    write('Specify experience'), nl,
    experience_options(Options),
    print_list(Options),
    read(Anwser),
    get_experience_factor(Anwser, NewValue, Factor).

show_result([]) :- 
	format('~n').

show_result([H|T]) :-
	get_results(H, Factor, Position),
	P is Factor * 100,
	format('~2f% ~w ~n', [P, Position]),
	show_result(T).

get_results(Pair, O, T) :-
	pairs_keys_values([Pair], [O], [T]).
