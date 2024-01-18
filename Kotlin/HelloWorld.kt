fun main() {
    println("Escoge un color (rojo, verde, azul): ")
    val nombreColor = readLine().toString().lowercase()
    when (nombreColor) {
        "rojo" -> println("Rojo")
        "verde" -> println("Verde")
        "azul" -> println("Azul")
        else -> println("No es rojo, verde o azul")
    }
}

// kotlinc HelloWorld.kt -include-runtime -d HelloWorld.jar
// kotlin -classpath HelloWorld.jar HelloWorldKt
