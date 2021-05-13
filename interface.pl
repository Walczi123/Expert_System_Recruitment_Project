% :- module(interface, [print_variables/1]).

% print_variables([]) :- 
% 	format('~n').

% print_variables([Head|Rest]) :-
% 	(
% 		Rest == [] -> format('~w',Head);
% 		format('~w, ',Head)
% 	),
% 	print_variables(Rest).