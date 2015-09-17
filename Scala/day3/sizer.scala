// Take the sizer application and add a message to count the number of links on the page

import scala.io._
import scala.actors._
import Actor._

object PageLoader {
	def getPageSize(url : String) = Source.fromURL(url).mkString.length

	def getPageURLCount(url : String) = {
		val urlPattern = "http://[\\w\\d-./]*".r
		(urlPattern findAllIn Source.fromURL(url).mkString).size
	}
}

val urls = List(
	"http://www.amazon.com/",
	"https://www.twitter.com/",
	"http://www.google.com/",
	"http://www.cnn.com/")

def timeMethod(method: () => Unit) = {
	val start = System.nanoTime
	method()
	val end = System.nanoTime
	println("Method took " + (end - start)/1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
	for(url <- urls) {
		println("Size for " + url + ": " + PageLoader.getPageSize(url))
	}
}

def getPageSizeConcurrently() = {
	val caller = self

	for(url <- urls) {
		actor { caller ! (url, PageLoader.getPageSize(url)) }
	}

	for(i <- 1 to urls.size) {
		receive {
			case (url, size) =>
			println("Size for " + url + ": " + size)
		}
	}
}

def getPageURLCountConcurrently() = {
	val caller = self

	for(url <- urls) {
		actor { caller ! (url, PageLoader.getPageURLCount(url)) }
	}

	for(i <- 1 to urls.size) {
		receive {
			case (url, count) =>
			println("URLs in " + url + ": " + count)
		}
	}
}

println("Sequential run:")
timeMethod { getPageSizeSequentially }
println("Concurrent run")
timeMethod { getPageSizeConcurrently }
println("Concurrent URL count: ")
timeMethod { getPageURLCountConcurrently }
