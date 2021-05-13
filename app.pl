:- module(app, [main/0]).

% :- use_module(interface).

main :-
    format("~nRecruitmen System~n"),
    format("Choose type of logging:~n").
    % print_variables([user, admin]),
    % read(anwser),
    % (
    %     anwser == user -> user_menu;
    %     anwser == admin -> admin_menu
    % ). 
    
print_variables([]) :- 
    format('~n').

print_variables([Head|Rest]) :-
    (
        Rest == [] -> format('~w',Head);
        format('~w, ',Head)
    ),
    print_variables(Rest).