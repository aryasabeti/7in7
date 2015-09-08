//Write a prototype for a two-dimensional list. 
//dim(x,y) should allocate y lists that are x elements long.
//implement set(x, y, value) and get(x, y)

Matrix := List clone

Matrix dim := method(x, y,
	for(rows, 1, y, self append(list))	
	self map(for(cols, 1, x, append(0)))
)

Matrix set := method(x, y, value,
	self at(y) atPut(x, value)
)

Matrix get := method(x, y,
	self at(y) at(x)
)

m := Matrix dim(3,3)
m set(0,1,5)
m get(0,1) println
