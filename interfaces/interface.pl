:- module(interface, [main_menu/0, confirm/2]).

:- use_module(interfaces/user_interface).
:- use_module(interfaces/admin_interface).

main_menu :-
	nl,
	write('Choose an option:'), nl,
    write('>   1. Log in as user'), nl,
    write('>   2. Log in as admin'), nl,
    write('>   3. Exit'), nl, nl,
    read(Anwser),
    (
        Anwser == 1 -> user_welcome;
        Anwser == 2 -> admin_welcome;
        Anwser == 3 -> write('Good Bye'), nl, true;
		nl, write('Incorrect option, try again.'), nl, nl,
		main_menu
    ).

% print_variables([]) :- 
% 	format('~n').

% print_variables([Head|Rest]) :-
% 	(
% 		Rest == [] -> format('~w',Head);
% 		format('~w, ',Head)
% 	),
% 	print_variables(Rest).


confirm(Text, Backfunction):-
    write(Text), nl,
	write('yes or no'), nl,
	read(Anwser),
	(
		Anwser == yes -> true;
		Anwser == y -> true;
	    nl, write('Operation cancelled.'), nl, 
		call(Backfunction)
	).
