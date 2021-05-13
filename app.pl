:- module(app, [main/0]).

:- use_module(interface).
:- use_module(user_interface).
:- use_module(admin_interface).

main :-
    nl,
    write('Welcome in recruitmen System'), 
    nl,
    main_menu.
