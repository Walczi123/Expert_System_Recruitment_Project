:- module(interface, [print_variables/1, confirm/1, main_menu/0]).

:- use_module(user_interface).
:- use_module(admin_interface).

main_menu :-
	write('Choose an option:'), nl,
    write('>   1. Log in as user'), nl,
    write('>   2. Log in as admin'), nl,
    write('>   3. Exit'), nl, nl,
    read(Anwser),
    (
        Anwser == 1 -> user_welcome;
        Anwser == 2 -> admin_welcome;
        Anwser == 3 -> write('Good Bye'), nl;
		write('Incorrect option, try again.'), nl, nl,
		main_menu.
    ).

print_variables([]) :- 
	format('~n').

print_variables([Head|Rest]) :-
	(
		Rest == [] -> format('~w',Head);
		format('~w, ',Head)
	),
	print_variables(Rest).

confirm(question) :-
    format(question),
    read_boolean(Anwser),
	(
		Anwser == yes -> true;
	    format('~nOperation cancelled.~n'), false
	).
