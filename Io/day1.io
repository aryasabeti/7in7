

"Facts about Io (check this source for examples):" println
""println

"Objects are always (except perhaps the Object type?) cloned, never instantiated." println
Vehicle := Object clone

"Objects are a collection of slots." println
Vehicle description := "Something to take you places"
Vehicle slotNames

"Slots contain objects and respond to messages." println
Vehicle description

"By convention, uppercase names are types." println
Car := Vehicle clone
Car type

"Lowercase names will take the type of their Uppercase clone." println
ferrari := Car clone
ferrari type

"Methods are simple to create."
method("This is a method that sends the message 'println' to this arg" println)

"Methods are objects and can be assigned to a slot."
Car drive := method("Vrrooommm" println)

"Sending a message to that slot invokes the method."
"If the object doesn't have that slot, it sends the message to its prototype." println
ferrari drive

"The contents of any slot can be retrieved."
ferrari getSlot("drive")

"Object prototypes are simple to get."
Object proto
ferrari proto

""println

"Io has collections." println
toDos := list("hide my car", "find Flux Capacitor")
toDos size

"The list collection type is flexible." println
toDos append("eat breakfast")
toDos pop
toDos prepend("eat breakfast sooner")
toDos at(0)

"The list collection also has mathematical conveniences." println
list(1, 2, 3, 4) average
list(1, 2, 3, 4) sum

"Maps are another kind of collection." println
elvis := Map clone
elvis atPut("home", "Graceland")
elvis atPut("genre", "Rock and Roll")

elvis keys
elvis at("home")

"Maps can be converted easily to objects or lists." println
elvis asObject
elvis asList

"0 is true." println
0 or true

"true, false, nil are singletons." println 
true clone
nil clone

"The Singleton pattern is easily accomplished in Io." println
Highlander := Object clone
Highlander clone := Highlander

alfred := Highlander clone
bob := Highlander clone
(alfred == bob) //there can only be 1 Highlander

quickie := Car clone
speedy := Car clone
(quickie == speedy) //there can be many cars

"You can change nearly any core language structure." println
//with great power. . .
//Object clone := "Now that you've overridden the clone slot to be on Object to be this string instead of the clone method, you cannot make any more objects. The only solution is to kill the process"