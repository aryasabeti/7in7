//Enhance the XML program to add spaces to show the indentation structure

Builder := Object clone
Builder depth := -2
Builder tab := "  "

Builder writeln_orig := getSlot("writeln")	
Builder	writeln := method(
		for(i, 0, depth, write(tab))
		writeln_orig(call evalArgs join))

Builder forward := method(
	self depth := self depth + 1
	self writeln("<", call message name, ">")
	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if(content type == "Sequence", self writeln(tab, content)))
	self writeln("</", call message name, ">")
	self depth := self depth - 1)

Builder ul(
	li(p("Io")),
	li("Lua"),
	li("JavaScript"))