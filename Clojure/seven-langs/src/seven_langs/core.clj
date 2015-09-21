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

;; Day 2

; implement unless with an else condition using macros.

(defmacro unless
	[test success failure]
	(list 'if (list 'not test) success failure))



