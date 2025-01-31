-module(reverse_string).

-export([reverse/1]).

reverse(String) ->
    reverse(String, []).

reverse([], Acc) ->
    Acc;
reverse([H | T], Acc) ->
    reverse(T, [H | Acc]).
