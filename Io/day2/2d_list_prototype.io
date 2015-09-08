//Write a prototype for a two-dimensional list. 
//dim(x,y) should allocate y lists that are x elements long.
//implement set(x, y, value) and get(x, y)

Matrix := List clone

Matrix dim := method(x, y,
	for(rows, 1, y, append(list))
	map(for(cols, 1, x, append(0)))
)

Matrix set := method(x, y, value,
	at(y) atPut(x, value)
)

Matrix get := method(x, y,
	at(y) at(x)
)

m := Matrix clone
m dim(3,3)

m set(0,0,5)
m set(0,2,3)
m set(1,2,7)

m println
