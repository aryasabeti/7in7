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

; Write a type using defrecord that implements a protocol
; Went down the rabbit hole of the Expression Problem . . .

(defprotocol DoSport
	"Do the sport!"
	(do-sport [this] "sport to do"))

(defrecord Athlete [fname lname age sport]
	DoSport
	(do-sport [this] (str (:sport this) "ing!")))

(def usain (Athlete. "Usain" "Bolt" 29 "Sprint"))
