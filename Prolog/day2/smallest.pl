%find the smallest integer in a list

%uses head of list as current
min(Smallest, [H|T]) :-
	currMin(Smallest, H, T).

currMin(Smallest, Current, [H|T]) :-
	H < Current,
	currMin(Smallest, H, T).

currMin(Smallest, Current, [H|T]) :-
	H >= Current,
	currMin(Smallest, Current, T).

currMin(Smallest, Current, [H]) :-
	H < Current,
	Smallest is H.

currMin(Smallest, Current, [H]) :-
	H >= Current,
	Smallest is Current.

