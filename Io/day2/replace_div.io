//How would you change / to return 0 if the denominator is 0?

//getSlot returns the value of the block in the named slot.
//many other languages pass pointers to methods instead

Number division := Number getSlot("/")

Number / := method(num, den, 
	if(den == 0, 0, Number getSlot("division"))
)

"1/0: " print
1 / 0 println