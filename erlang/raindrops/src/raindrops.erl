-module(raindrops).

-export([convert/1]).

-define(MAP,
        #{3 => "Pling",
          5 => "Plang",
          7 => "Plong"}).

convert(Number) ->
    convert(Number, [], [3, 5, 7]).

convert(N, [], []) ->
    integer_to_list(N);
convert(_, S, []) ->
    lists:concat(
        lists:reverse(S));
convert(N, S, [H | Next]) ->
    case N rem H of
        0 ->
            convert(N, [maps:get(H, ?MAP) | S], Next);
        _ ->
            convert(N, S, Next)
    end.
