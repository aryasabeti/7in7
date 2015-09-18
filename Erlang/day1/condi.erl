% Write a function that uses matching to selectively print "success" or "error: message",
% given input of the form {error, Message} or success. 

-module(condi).
-export([check/1]).

check(success) -> io:format("success\n");
check({error, Message}) -> io:format("~p\n", [Message]).