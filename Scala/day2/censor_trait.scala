import scala.language.implicitConversions

val alts = Map("shit" -> "crap", "damn" -> "darn")

class ModeratedString(str: String) extends Censor {
	def polite = censor(str)
}

trait Censor {
	def censor(raw_text: String) = {
		val words = raw_text.split(" ")
		val censored = words.map { w =>

			val wl = w.toLowerCase
			if (alts.contains(wl)) alts.get(wl).get
			else w
		}
		censored.mkString(" ")
	}
}

implicit def Politify(str: String) = new ModeratedString(str)

val raw_string = "Damn this shit"
val PoliteString = new ModeratedString(raw_string)

println(raw_string + " becomes " + raw_string.polite)
