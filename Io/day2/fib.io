//Fibo(0) == 0
//Fib(1) == 1

Fib := Object clone

Fib nth_recursive := method(n,
	if(n == 0, 0,
		if(n == 1, 1,
			(Fib nth_recursive(n-1)) + (Fib nth_recursive(n-2))
		)
	)
)

//for(i, 0, 10, Fib nth_recursive(i) println)

Fib nth_procedural := method(n,

	fi := 0
	fj := 1

	for(i, 0, n-1,
		//swap
		fi = fi + fj
		fj = fi - fj
		fi = (fi - fj)

		fj = fi + fj
	)
	return fi
)

//for(i, 0, 10, Fib nth_procedural(i) println)
