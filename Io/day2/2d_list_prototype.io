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

Matrix transpose := method(m,
	t_matrix := Matrix clone
	foreach(i, at(i), 
		t_matrix append(map(row, row at(i)))
	)
)

Matrix writeFile := method(fileName,
	f := File with(fileName)
	f remove
	f openForAppending
	foreach(row, 
		f write(row join(","))
		f write("\n")
	)
	f close
)

Matrix readFile := method(fileName,
	f := File with(fileName)
	f openForReading
	loop(
		line := f readLine
		if(line,
			append(line split(",")),
			return
		)
	)
)

m := Matrix clone
m dim(3,3)

m set(0,0,5)
m set(0,2,3)
m set(1,2,7)

"Matrix m:" println
m println
"" println

"Matrix m transpose:" println
m transpose println
"" println

"Writing matrix m to file." println
m writeFile("mymatrix")
"" println

"Matrix m from file:" println
n := Matrix clone
n readFile("mymatrix")
n println
