/*
Write a game that will take a tic-tac-toe board with
X, O, and blank characters and detect the winner
or whether there is a tie or no winner yet.
Uses classes where appropriate.
*/

class TicTacToe(boardState: List[Int] = List()) {

	val state = boardState

	def winner = {
		// for first Scala program, use simplest possible (verbose) implementation and refactor
		var wins = 'T'

		(0 until 3).foreach { n =>
			var rowSum = state(n*3) + state(n*3+1) + state(n*3+2)
			if(rowSum == 3)
				wins = 'X'
			if(rowSum == -3)
				wins = 'O'

			var colSum = state(n) + state(n+3) + state(n+6)
			if(colSum == 3)
				wins = 'X'
			if(colSum == -3)
				wins = 'O'
		}

		val diagNW = state(0) + state(4) + state(8)
		if(diagNW == 3)
			wins = 'X'
		if(diagNW == -3)
			wins = 'O'

		val diagNE = state(2) + state(4) + state(6)
		if(diagNE == 3)
			wins = 'X'
		if(diagNE == -3)
			wins = 'O'

		wins
	}
}

val test_games = List(
	List(
		0, 0, 0,
		0, 0, 0,
		0, 0, 0),

	List(
		-1, -1, -1,
		0, 0, 0,
		0, 1, 1),

	List(
		1, 0, 0,
		1, 0, 0,
		1, 0, 0),

	List(
		-1, 0, 0,
		0, -1, 0,
		0, 0, -1),

	List(
		0, 0, 1,
		0, 0, 1,
		0, 0, 1)
)

val expected = List('T', 'O', 'X', '0', 'X')
val results = test_games.map(g => 
	new TicTacToe(g).winner)

println("Expected " + expected)
println("Got " + results)
