-module(app).
-export([readlines/1]).
-import(validator, [is_valid/1]).

analyze(SiernsList) ->
	analyze(SiernsList, _OccurrencesMap=#{}, _UniqueCounter=0, _OtherCounter=0).
	

analyze([], _OccurrencesMap, UniqueCounter, OtherCounter) ->
	{UniqueCounter, OtherCounter};

analyze([Siren | SiernsList], OccurrencesMap, UniqueCounter, OtherCounter) ->
	ValidatedSiren = is_valid(binary:bin_to_list(Siren)),
	Counter = maps:get(ValidatedSiren, OccurrencesMap, 0),
	{UpdatedOccurrencesMap, UpdatedUniqueCounter, UpdatedOtherCounter} = update_occurences(ValidatedSiren, Counter, OccurrencesMap, UniqueCounter, OtherCounter),
	analyze(SiernsList, UpdatedOccurrencesMap, UpdatedUniqueCounter, UpdatedOtherCounter).

update_occurences("0", 0, OccurrencesMap, UniqueCounter, OtherCounter) ->
	{OccurrencesMap, UniqueCounter, OtherCounter};

update_occurences(Siren, 0, OccurrencesMap, UniqueCounter, OtherCounter) ->
	{maps:put(Siren, 1, OccurrencesMap), UniqueCounter + 1, OtherCounter};

update_occurences(Siren, 1, OccurrencesMap, UniqueCounter, OtherCounter) ->
        {maps:put(Siren, 2, OccurrencesMap), UniqueCounter - 1, OtherCounter + 1};

update_occurences(Siren, N, OccurrencesMap, UniqueCounter, OtherCounter) ->
        {maps:put(Siren, N + 1, OccurrencesMap), UniqueCounter, OtherCounter}.

display_results({UniqueCounter, OtherCounter}) ->
	io:format("There are (~p) unique SIRENs that present once~n", [UniqueCounter]),
	io:format("and (~p) SIRENs that are present at least twice~n", [OtherCounter]).	

readlines(FileName) ->
	{Status, Data} = file:read_file(FileName),
	analyze_data({Status, Data}).

analyze_data({ok, Data}) ->
	{UniqueCounter, OtherCounter} = analyze(binary:split(Data, [<<"\n">>], [global])),
	display_results({UniqueCounter, OtherCounter});
analyze_data({error, Reason}) ->
	io:format("Read file faild. Reason: (~p) ~n", [Reason]).
