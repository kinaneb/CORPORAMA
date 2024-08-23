-module(app).
-export([readlines/1]).
-import(maps, [get/3, put/3]).
-import(io, [format/2]).

analyze(SiernsList) ->
	analyze(SiernsList, _OccurrencesMap=#{}, _UniqueCounter=0, _OtherCounter=0).
	

analyze([], _OccurrencesMap, UniqueCounter, OtherCounter) ->
	{UniqueCounter, OtherCounter};

analyze([Siren | SiernsList], OccurrencesMap, UniqueCounter, OtherCounter) ->
	Counter = get(Siren, OccurrencesMap, 0),
	{UpdatedOccurrencesMap, UpdatedUniqueCounter, UpdatedOtherCounter} = update_occurences(Siren, Counter, OccurrencesMap, UniqueCounter, OtherCounter),
	analyze(SiernsList, UpdatedOccurrencesMap, UpdatedUniqueCounter, UpdatedOtherCounter).

update_occurences(Siren, 0, OccurrencesMap, UniqueCounter, OtherCounter) ->
	{put(Siren, 1, OccurrencesMap), UniqueCounter + 1, OtherCounter};

update_occurences(Siren, 1, OccurrencesMap, UniqueCounter, OtherCounter) ->
        {put(Siren, 2, OccurrencesMap), UniqueCounter - 1, OtherCounter + 1};

update_occurences(Siren, N, OccurrencesMap, UniqueCounter, OtherCounter) ->
        {put(Siren, N + 1, OccurrencesMap), UniqueCounter, OtherCounter}.

display_results({UniqueCounter, OtherCounter}) ->
	format("There are (~p) unique SIRENs that present once~n", [UniqueCounter]),
	format("and (~p) SIRENs that are present at least twice", [OtherCounter]).	

readlines(FileName) ->
	{ok, Data} = file:read_file(FileName),
	{UniqueCounter, OtherCounter} = analyze(binary:split(Data, [<<"\n">>], [global])),
	display_results({UniqueCounter, OtherCounter}).
