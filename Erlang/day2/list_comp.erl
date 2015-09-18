
-module(list_comp).
-export([extract_values/2]).
-export([total_prices/1]).

% Write a function that accepts a list (example below) and a keyword, and returns the associated value for the keyword.
% This implementation actually returns ALL values for the keyword.
% L = [{erlang, "a functional language"}, {ruby, "an OO language"}, {scala, "a hybrid language"}, {prolog, "a declarative language"}].

extract_values(List, Keyword) -> 
	[Desc || {K, Desc} <- List, K == Keyword].

% Given a shopping list resembling
% [{pencil, 2, 3.50}, {pen, 3, 3.25}]
% write a list comprehension that yields
% [{pencil,7.0},{pen,9.75}]
total_prices(ShoppingList) ->
	[{Item, Quantity * Price} || {Item, Quantity, Price} <- ShoppingList].
