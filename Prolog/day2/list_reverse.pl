%Reverse a list.

rev([], []).

rev([FwdH|FwdT], Reverse) :-
	rev(FwdT,RevT), append(RevT,[FwdH],Reverse).