Fib := Object clone

Fib nth := method(n,
	if(n == 0, 1,
		if(n == 1, 1,
			(Fib nth(n-1)) + (Fib nth(n-2))
		)
	)
)

for(i, 0, 10, Fib nth(i) println)

