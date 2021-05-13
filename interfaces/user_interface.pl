:- module(user_interface, [user_welcome/0, user_menu/0]).

:- use_module(interface).

user_welcome:-
    nl,
    write('Hello, User.'), 
    nl,
    user_menu.


user_menu :-
    write('Choose an option:'), nl,
    write('>   1. Use system.'), nl,
    write('>   2. Log out.'), nl,
    read(Anwser),
    (
        Anwser == 1 -> questionnaire;
        Anwser == 2 -> write('Logging out...'), nl, nl, main_menu;
        write('Incorrect option, try again.'), nl, nl,
		user_menu
    ).


questionnaire :-
    nl,
    write('Questionnaire"), 
    nl.