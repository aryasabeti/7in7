% Write a function that uses recursion to count the number of words in a string.

% note, there's a library function for this:
% string:words("Hello old chap"). % => 3

% a personal note: not excited about this implementation. But it works.

-module(count).
-export([words/1]).

words(Phrase) -> 1 + words_recurs(string:strip(Phrase, both)).

words_recurs(Stripped)
	when length(Stripped) == 1 -> 0;

words_recurs(Stripped) ->
	[H|T] = Stripped,
	io:format("checking\n"),
	is_space(H) + words_recurs(T).

is_space(32) -> 1;
is_space(_) -> 0.