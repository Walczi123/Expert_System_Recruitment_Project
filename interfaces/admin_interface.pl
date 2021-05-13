:- module(admin_interface, [admin_welcome/0]).

:- use_module(interface).

admin_welcome:-
    nl,
    write('Hello, Admin.'), 
    nl,
    admin_menu.


admin_menu :-
    write('Choose an option:'), nl,
    write('>   1. Create new candidate.'), nl,
    write('>   2. Update candidate.'), nl,
    write('>   3. Delete candidate.'), nl,
    write('>   4. Log out.'), nl,
    read(Anwser),
    (
        Anwser == 1 -> create_menu;
        Anwser == 2 -> update_menu;
        Anwser == 3 -> delete_menu;
        Anwser == 4 -> write('Logging out...'), nl, nl, main_menu;
        write('Incorrect option, try again.'), nl, nl,
		admin_menu
    ).

create_menu :-
    nl,
    write('Creating new candidate..."), 
    nl.

update_menu :-
    nl,
    write('Updating candidate..."), 
    nl.

delete_menu :-
    nl,
    write('Creating new candidate..."), 
    nl.
