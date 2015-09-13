/* Write a game that will take a tic-tac-toe board with
X, O, and blank characters and detect the winner
or whether there is a tie or no winner yet.
Uses classes where appropriate.
*/

class TicTacToe(boardState: (
	Char, Char, Char,
	Char, Char, Char,
	Char, Char, Char)) {

	val state = boardState

	print("board state: ")
	println(state)
}

val b = new TicTacToe(('O','X', 'O', 'X', 'O', 'X', 'O', 'X', 'O'))
