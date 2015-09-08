//Add a slot called myAverage to a list that computes the average of all the numbers in a list. Bonus: raise an exception if any item in list is not a Number.

IOException := Exception clone

List myAverage := method(
	if(self select(type != "Number") size > 0, IOException raise("error: contains non-Numbers"))

	if(self size > 0,
		self sum / self size,
		0
	)
)

list(1, 2) myAverage println
list(1, 2, "a") myAverage println	//raises
