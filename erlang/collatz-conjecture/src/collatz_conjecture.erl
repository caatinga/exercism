-module(collatz_conjecture).

-export([steps/1]).

steps(N) ->
    steps(N, 0).

steps(N, _) when N < 1 ->
    error(badarg);
steps(1, S) ->
    S;
steps(N, S) ->
    case is_even(N) of
        true ->
            steps(N div 2, S + 1);
        false ->
            steps(3 * N + 1, S + 1)
    end.

is_even(N) ->
    N rem 2 == 0.
