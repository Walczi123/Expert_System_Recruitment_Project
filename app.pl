:- module(app, [main/0]).

:- use_module(interfaces/interface).

:- use_module(interfaces/user_interface).
:- use_module(variables/factors).
:- use_module(variables/constants).
:- use_module(common_functions/print_functions).


main :-
    nl,
    write('Welcome in recruitment system'), 
    nl,

    % experience_options(Options),
    % print_list(Options),
    % read(Factor),
    % % get_factor(Anwser, Factor), 
    % % Factor = ala,
    % % Factor is "kot",
    % number(Factor),
    % Value = 31,
    % Factor = Value,
    % write(Factor),nl.
    % check_all(ANS,FAC),
    % print_list(ANS),
    % print_list(FAC).
    main_menu.
