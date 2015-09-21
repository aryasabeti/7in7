(ns seven-langs.core)

;; Day 1

(defn big
	"true if st larger than n, false otherwise."
	[st n]
	(> (count st) n))

(defn collection-type
	"shorthand for list, vector, map types."
	[col]
	(cond
		(map? col) :map
		(list? col) :list
		(vector? col) :vector))
