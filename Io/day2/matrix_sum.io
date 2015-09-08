//Write a program to add all numbers in a 2 dimensional array

n := list(
	list(1, 2),
	list(3, 4)
)

m := list(
	list(1, 2, 3),
	list(4, 5, 6),
	list(7, 8, 9)
)

matrix_sum := method(matrix, 
	matrix map(sum) sum
)

matrix_sum(n) println
matrix_sum(m) println