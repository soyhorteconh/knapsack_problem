solve(Items, Capacity, BestSolution, BestWeight, BestProfit) :-
    % Find all valid subsets along with their weights and profits
    findall(
        (PossibleSolutions, Weight, Profit),        
        (subset(Items, PossibleSolutions), % Items = all possible solutions, PossibleSolutions = solution to return         
         weights(PossibleSolutions, Weight),        
         Weight =< Capacity,               
         profits(PossibleSolutions, Profit)),     
        ValidSolutions),              % Collection of all valid solutions
    % Find the solution with the maximum profit
    max_profit_solution(ValidSolutions, (BestSolution, BestWeight, BestProfit)).

% Determine solution with the best profit
max_profit_solution([(PossibleSolutions, Weight, Profit)], (PossibleSolutions, Weight, Profit)).
max_profit_solution([(S1, W1, P1)|Rest], (BestSolution, BestWeight, BestProfit)) :-
    max_profit_solution(Rest, (S2, W2, P2)),   
    (P1 > P2 ->                                 % Check for the best profit
        BestSolution = S1, BestWeight = W1, BestProfit = P1
    ;   BestSolution = S2, BestWeight = W2, BestProfit = P2).

% calculate total weight
weight([Weight, _], Weight).
weights([], 0).
weights([X|Xs], Weight) :-
    weight(X, W),
    weights(Xs, Ws),
    Weight is W + Ws.

% calculate total profit
profit([_, Profit], Profit).
profits([], 0).
profits([X|Xs], Profit) :-
    profit(X, P),
    profits(Xs, Ps),
    Profit is P + Ps.

% create all possible combinations
subset([], []).
subset([X|Xs], [X|Ys]) :-
    subset(Xs, Ys).
subset([_|Xs], Ys) :-
    subset(Xs, Ys).
