%Sort the elements of a list
%Writing own version of sort predicate for numeric values
['smallest'].

delete_one(_, [], []).
delete_one(Term, [Term|Tail], Tail).
delete_one(Term, [Head|Tail], [Head|Result]) :-
	delete_one(Term, Tail, Result).

int_sort([], []).
int_sort(List, Result) :- 
	min(Min, List),
	delete_one(Min, List, Rest),
	int_sort(Rest, Sorted),
	append([Min], Sorted, Result).
