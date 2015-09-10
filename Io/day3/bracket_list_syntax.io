//Create a list syntax that uses brackets

squareBrackets := method(
	l := List clone;
	call message arguments foreach(arg,
		l append(arg)))

[1,2,3] println