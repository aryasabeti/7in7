module Main where

-- Write a list reversal function
  rev :: [a] -> [a]
  rev [] = []
  rev l = rev (tail l) ++ [head l]

-- Form all unique pairs of colors as a list of tuples
  colors = ["black", "white", "blue", "yellow", "red"]
  pairs colors = [(c1, c2) | c1 <- colors, c2 <- colors, c1 /= c2, c1 < c2]

-- list comprehension to form multiplication table as list of 3-tuples
  multTable :: Integer -> [(Integer, Integer, Integer)]
  multTable max = [(n, m, prod) | n <- [1..max], m <- [1..max], prod <- [n*m], n <= m]

-- solve the map coloring problem

-- how many ways can you find to write `allEven`?