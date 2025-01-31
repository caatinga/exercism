-module(acronym).

-export([abbreviate/1]).

abbreviate(Phrase) ->
    abbr(Phrase, [], pick).

%% First In, First Out
abbr([], Acc, _) ->
    string:to_upper(
        lists:reverse(Acc));
abbr([C | Rest], Acc, Choice) ->
    case is_special(C) of
        true ->
            abbr(Rest, Acc, pick);
        false ->
            case Choice of
                pick ->
                    abbr(Rest, [C | Acc], skip);
                skip ->
                    abbr(Rest, Acc, skip)
            end
    end.

is_special(C) ->
    lists:member(C, " -,_").
