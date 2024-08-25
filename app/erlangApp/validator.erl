-module(validator).
-export([is_valid/1]).

is_valid(Siren) ->
	is_valid(Siren, string:length(Siren) == 9 ).

is_valid(Siren, false) -> 
	io:format("Error: The provided SIREN \"~s\" is not valid because its length is not 9 digits.~n", [Siren]),
	"0";

is_valid(Siren, true) ->
	is_valid(Siren, true, luhn_string_siren_sum(lists:reverse(Siren), 0)).

is_valid(Siren, true, false) ->
	io:format("Error: The provided SIREN \"~s\" is not valid according to the Luhn algorithm.~n", [Siren]),
	"0";

is_valid(Siren, true, true) ->
	Siren.
	
char_to_integer(Char) ->
	Char - $0.


luhn_string_siren_sum("", Sum) ->
	Sum rem 10 == 0;
	
luhn_string_siren_sum([LastDigit | RestSiren], Sum) ->
	LastDigitInteger = char_to_integer(LastDigit),
	IsEven = string:length(RestSiren) rem 2 /= 0,
	LuhnDigitValue = luhn_string_digit_sum({LastDigitInteger, IsEven }),
	luhn_string_siren_sum(RestSiren, Sum + LuhnDigitValue).


luhn_string_digit_sum({StringDigit, true}) ->
	Double = (StringDigit * 2),
	((Double div 10 ) + (Double rem 10));
luhn_string_digit_sum({StringDigit, false}) ->
	StringDigit.
