solve(Items, Capacity, Solution, Weight, Profit) :-
    subset(Items, Solution),        
    weights(Solution, Weight),       
    Weight =< Capacity,              
    profits(Solution, Profit).       

weight([Weight, _], Weight).
weights([], 0).
weights([X|Xs], Weight) :-
    weight(X, W),
    weights(Xs, Ws),
    Weight is W + Ws.

profit([_, Profit], Profit).
profits([], 0).
profits([X|Xs], Profit) :-
    profit(X, P),
    profits(Xs, Ps),
    Profit is P + Ps.

subset([], []).
subset([X|Xs], [X|Ys]) :-
    subset(Xs, Ys).
subset([_|Xs], Ys) :-
    subset(Xs, Ys).
