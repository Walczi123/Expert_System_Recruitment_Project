:- module(app, [main/0]).

:- use_module(interfaces/interface).
:- use_module(interfaces/tmp).


main :-
    nl,
    write('Welcome in recruitmen system'), 
    nl,
    main_menu.
