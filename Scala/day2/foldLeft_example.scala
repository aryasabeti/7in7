// Use foldLeft to compute the total size of a list of strings.

val words = "The quick brown fox jumps over the lazy dog".split(' ')
val letterCount = (0 /: words) {(sum, word) => sum + word.length}

print(letterCount)
println(" letters")