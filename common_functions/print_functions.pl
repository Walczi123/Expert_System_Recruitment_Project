:- module(print_functions, [print_list/1]).

print_list([]) :- 
    format('~n').

print_list([Head|Rest]) :-
    (
        Rest == [] -> format('~w', Head);
        format('~w, ', Head)
    ),
    print_list(Rest).