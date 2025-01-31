-module(rna_transcription).

-export([to_rna/1]).

-define(Map,
        #{$G => $C,
          $C => $G,
          $T => $A,
          $A => $U}).

to_rna(S) ->
    to_rna(S, []).

to_rna([], []) ->
    [];
to_rna([], R) ->
    lists:reverse(R);
to_rna([H | T], R) ->
    to_rna(T, [maps:get(H, ?Map) | R]).
