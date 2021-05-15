:- module(app, [main/0]).

:- use_module(interfaces/interface).
:- use_module(tools/common_functions).


main :-
    nl,
    write('Welcome in recruitmen system'), 
    nl,
    % list_element.
    main_menu.
