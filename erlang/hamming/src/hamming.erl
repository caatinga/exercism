-module(hamming).

-export([distance/2]).

distance(S, D) when length(S) =/= length(D) ->
    {error, badarg};
distance(S, D) ->
    lists:foldl(fun({C1, C2}, Acc) ->
                   case C1 == C2 of
                       false -> Acc + 1;
                       true -> Acc
                   end
                end,
                0,
                lists:zip(S, D)).
