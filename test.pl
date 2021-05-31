skills([Value,Name], Factor) :-
    (
        Name == poc ->
        (
        number(Value), Value =:=0 -> Factor is 0, write(Factor);
        number(Value), Value =< 10 -> Factor is Value/10, write(Factor);
        number(Value), Value =< 15 -> Factor is 1, write(Factor);
        number(Value), Value =< 22.5 -> Factor is (22.5-Value)/7.5, write(Factor);
        number(Value), Value >= 10 -> Factor is 0, write(Factor)
        );
        Name == pod ->
        (
        number(Value), Value =< 17.5 -> Factor is 0, write(Factor);
        number(Value), Value =< 30 -> Factor is (Value - 17.5)/12.5, write(Factor);
        number(Value), Value =< 35 -> Factor is 1, write(Factor);
        number(Value), Value =< 45 -> Factor is (45-Value)/10, write(Factor);
        number(Value), Value > 45 -> Factor is 0, write(Factor)
        );
        Name == sre ->
        (
        number(Value), Value =< 40 -> Factor is 0, write(Factor);
        number(Value), Value =< 50 -> Factor is (Value - 40)/10, write(Factor);
        number(Value), Value =< 60.5 -> Factor is 1, write(Factor);
        number(Value), Value =< 70 -> Factor is (70-Value)/9.5, write(Factor);
        number(Value), Value > 70 -> Factor is 0, write(Factor)
        );
        Name == srz ->
        (
        number(Value), Value =< 67.5 -> Factor is 0, write(Factor);
        number(Value), Value =< 75 -> Factor is (Value - 67.5)/7.5, write(Factor);
        number(Value), Value =< 85.5 -> Factor is 1, write(Factor);
        number(Value), Value =< 93 -> Factor is (93-Value)/7.5, write(Factor);
        number(Value), Value > 93 -> Factor is 0, write(Factor)
        );
        Name == zaa ->
        (
        number(Value), Value =< 40 -> Factor is 0, write(Factor);
        number(Value), Value =< 50 -> Factor is (Value - 40)/10, write(Factor);
        number(Value), Value =< 60.5 -> Factor is 1, write(Factor);
        number(Value), Value =< 70 -> Factor is (70-Value)/9.5, write(Factor);
        number(Value), Value > 70 -> Factor is 0, write(Factor)
        )
    ).


experience([Value,Name], Factor) :-
    (
        Name == sta ->
        (
        number(Value), Factor is 1/(1+abs(Value/5)**5), write(Factor)
        );
        Name == jun ->
        (
            number(Value), Factor is e**((-1/2)*((Value - 23.5)/5.5)**2), write(Factor)
        );
        Name == mid ->
        (
            number(Value), Factor is e**((-1/2)*((Value - 41.5)/5.5)**2), write(Factor)
        );
        Name == sen ->
        (
            number(Value), Factor is e**((-1/2)*((Value - 63.5)/5.5)**2), write(Factor)
        );
        Name == arc ->
        (
            number(Value), Factor is 1/(1+abs((Value-122.5)/30)**6), write(Factor)
        )
    ).

defuzzification([], Result) :-
    number(Value),
    Result is Value/2,
    write(Result).

defuzzification([H|T], Result) :-
    number(Value),
    Result is Value/2,
    write(Result).

do_test(Val) :-
    skills([Val, poc], Factor),
    write('Skills '),
    write(Factor),
    write(Val),
    nl,
    experience([Val, jun], Factor2),
    write('Experience '),
    nl,
    write(Factor2),
    defuzzification([Val, Val+3, Val+4], Result),
    write('Center '),
    write(Result).


% skills([Value,Name]) :-
%     (
        
%     ).

% skills_P(Value, Factor) :-
%     (
%         number(Value), Value =:=0 -> Factor is 0, write(Factor);
%         number(Value), Value =< 10 -> Factor is Value/10, write(Factor);
%         number(Value), Value =< 15 -> Factor is 1, write(Factor);
%         number(Value), Value =< 22.5 -> Factor is (22.5-Value)/7.5, write(Factor);
%         number(Value), Value >= 10 -> Factor is 0, write(Factor)
%     ).

get_cshKnowledge_factor2(Value, NewValue, Factor) :-
    (
        Value == beginner -> Factor is 0.1, NewValue = 'beginner';
        Value == b -> Factor is 0.1, NewValue = 'beginner';
        Value == elementary -> Factor is 0.3, NewValue = 'elementary';
        Value == e -> Factor is 0.3, NewValue = 'elementary';
        Value == intermediate -> Factor is 0.5, NewValue = 'intermediate';
        Value == int -> Factor is 0.5, NewValue = 'intermediate';
        Value == upper-intermediate -> Factor is 0.7, NewValue = 'upper-intermediate';
        Value == upint -> Factor is 0.7, NewValue = 'upper-intermediate'; 
        Value == advanced -> Factor is 0.9, NewValue = 'advanced';
        Value == adv -> Factor is 0.9, NewValue = 'advanced'
    ).

get_experience_factor2(Value, NewValue, Factor) :-
    (
        number(Value), Value < 1 -> Factor is 0.3, NewValue = Value;
        number(Value), Value >= 1, Value < 3 -> Factor is 0.4, NewValue = Value;
        number(Value), Value >= 3, Value < 7 -> Factor is 0.5, NewValue = Value;
        number(Value), Value >= 7, Value < 12 -> Factor is 0.85, NewValue = Value;
        number(Value), Value > 12 -> Factor is 1, NewValue = Value

    ).


% test :-
%     write('Test: '),
%     read(Value),
%     test2(Value, New),
%     format('Return ~n ~w ~w',[Value, New]).

% test2(Value, New) :-
%     New is Value + e,
%     write(New).