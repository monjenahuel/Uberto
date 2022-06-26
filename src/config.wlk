import wollok.game.*
import autoPlayer.*
import EstacionDeServicio.*


object config {
	//Configuracion de volumen y teclas, además tiene el metodo revisarColision y guarda el nivel actual en el que esta el juego



	method configurarTeclas() {
	keyboard.up().onPressDo{autoJugador.avanzar("arriba") }
	keyboard.down().onPressDo{autoJugador.avanzar("abajo") }
	keyboard.left().onPressDo{autoJugador.avanzar("izq") }
	keyboard.right().onPressDo{autoJugador.avanzar("der") }
	}
	}
	
	
	


/* 
object nivel{
	const anchoTotal = 20
	const altoTotal = 10
	
	method inicio(){
		game.clear()
		game.title("El laburante del Uber")
		game.width(anchoTotal)
		game.height(altoTotal)
		game.boardGround("uber.png")

		keyboard.s().onPressDo{game.start() }
		
	}
	
	
}
*/
