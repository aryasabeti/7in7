//Enhance the XML program to add spaces to show the indentation structure

/////To complete the exercise I will adapt the  example from the book:

OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
	r := Map clone
	call message arguments foreach(arg,
		r doMessage(arg))
	r)

Map atPutNumber := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
		call evalArgAt(1)))

/////end

//Extend Map with helper for easy XML-formatted attributes
Map asXMLAttributes := method(
	self keys map(key, " \"#{key}\"=\"#{self at(key)}\"" interpolate) join
)

Builder := Object clone
Builder depth := -2
Builder tab := "  "

Builder writeln_orig := getSlot("writeln")	
Builder	writeln := method(
		for(i, 0, depth, write(tab))
		writeln_orig(call evalArgs join))

Builder forward := method(
	self depth := self depth + 1

	if(call message arguments at(0) name == "curlyBrackets",
		attributes := doMessage(call message arguments removeFirst),
		attributes := Map clone)

	self writeln("<", call message name, attributes asXMLAttributes, ">")

	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if(content type == "Sequence", self writeln(tab, content)))
	self writeln("</", call message name, ">")
	self depth := self depth - 1)

//Due to a bug in Io, must evaluate our test code as a string.
//It seems that the OperatorTable can't be modified and the new operator used in the same file unless we do this. 

doString("""
Builder ul(
	li(p({"chapter_complete":"true", "font_face":"bold"}, "Io")),
	li(p({"chapter_complete":"false"}, "Haskell")),
	li(p({"chapter_complete":"nil"}, "JavaScript")))
""")