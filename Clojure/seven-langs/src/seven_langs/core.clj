(ns seven-langs.core)

;; Day 1

(defn big
	"true if st larger than n, false otherwise."
	[st n]
	(> (count st) n))

(defn collection-type
	"shorthand for list, vector, map types."
	[col]
	({
		clojure.lang.PersistentArrayMap :map
		clojure.lang.PersistentList :list
		clojure.lang.PersistentVector :vector
	} (type col)))
