:- module(admin_interface, [admin_welcome/0]).

:- use_module(interfaces/interface).

admin_welcome :-
    nl,
    write('Hello, Admin.'), 
    nl,
    admin_menu.


admin_menu :-
    nl,
    write('Choose an option:'), nl,
    write('>   1. Create new position.'), nl,
    write('>   2. Update position.'), nl,
    write('>   3. Delete position.'), nl,
    write('>   4. Log out.'), nl,
    write('>   5. Exit'), nl, nl,
    read(Anwser),
    (
        Anwser == 1 -> create_menu;
        Anwser == 2 -> update_menu;
        Anwser == 3 -> delete_menu;
        Anwser == 4 -> write('Logging out...'), nl, nl, main_menu;
        Anwser == 5 -> write('Good Bye'), nl, true;
        write('Incorrect option, try again.'), nl, nl,
		admin_menu
    ).

create_menu :-
    nl,
    write('Creating new position...'), 
    nl,
    % read_position(PositionName),
    % read_answers(Answers),
    confirm('Are you sure you want to create new position?','admin_menu'),
    % create_position(PositionName, Answers),
    write('Position succesfuly created.'), nl,
    admin_menu.

update_menu :-
    nl,
    write('Updating position...'), 
    nl,
    % read_position(PositionName),
    % read_answers(Answers),
    confirm('Are you sure you want to update position?','admin_menu'),
    % update_position(PositionName, Answers),
    write('Position succesfuly updated.'), nl,
    admin_menu.

delete_menu :-
    nl,
    write('Deleting position...'), 
    nl,
    % read_position(PositionName),
    % read_answers(Answers),
    confirm('Are you sure you want to delete the position?','admin_menu'),
    % delete_position(PositionName, Answers),
    write('Position succesfuly deleted.'), nl,
    admin_menu.
