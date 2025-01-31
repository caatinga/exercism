-module(bob).

-export([response/1]).

response(String) ->
    S = string:trim(String, trailing),
    case S of
        [] ->
            "Fine. Be that way!";
        _ ->
            response(endswith_question_mark(S), is_upper(S))
    end.

response(true, true) ->
    "Calm down, I know what I'm doing!";
response(true, _) ->
    "Sure.";
response(_, true) ->
    "Whoa, chill out!";
response(_, _) ->
    "Whatever.".

is_upper(S) ->
    string:uppercase(S) =:= S andalso not (string:lowercase(S) =:= S).

endswith_question_mark(S) ->
    $? =:= lists:last(S).
