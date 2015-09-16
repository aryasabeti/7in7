import scala.language.implicitConversions
import scala.io.Source
import scala.collection.mutable.HashMap

class ModeratedString(str: String) extends Censor {
	import_alts("alts.txt")		// I acknowlege that this is non-design

	def polite = censor(str)
}

trait Censor {
	val alts = new HashMap[String, String]

	def censor(raw_text: String) = {
		val words = raw_text.split(" ")
		val censored = words.map { w =>

			val wl = w.toLowerCase
			if (alts.contains(wl)) alts.get(wl).get
			else w
		}
		censored.mkString(" ")
	}

	def import_alts(file_path: String) = {
		for(line <- Source.fromFile("alts.txt").getLines()) { 
			val parts = line.split(",")

			alts += parts(0).trim -> parts(1).trim
		}
	}
}

implicit def Politify(str: String) = new ModeratedString(str)

val raw_string = "Damn this shit"
val PoliteString = new ModeratedString(raw_string)

println(raw_string + " becomes " + raw_string.polite)
