import wollok.game.*
import autoPlayer.*
import EstacionDeServicio.*
import Pasajeros.*


object config {
	//Configuracion de volumen y teclas, además tiene el metodo revisarColision y guarda el nivel actual en el que esta el juego

	method configurarTeclas() {
		keyboard.up().onPressDo{autoJugador.avanzar("arriba") }
		keyboard.down().onPressDo{autoJugador.avanzar("abajo") }
		keyboard.left().onPressDo{autoJugador.avanzar("izq") }
		keyboard.right().onPressDo{autoJugador.avanzar("der") }
	
		keyboard.z().onPressDo{autoJugador.interactuarCon(autoJugador.objetoColisionante())}
		
		
	}
}

object colisiones{
	method configurar(){
		game.onCollideDo(autoJugador, { e => game.say(e, e.mensaje())})
		game.onTick(1000, "movimiento", { autoPrueba.movete() })
	}
	
}

object gameOver{
	method image()= "GameOver.png"
	method position()= game.at(4,8)
	
}
	
	
class Nivel{
	const anchoTotal = 15
	const altoTotal = 15
	
	method inicio(){
		game.clear()
		game.title("El laburante del Uber")
		game.width(anchoTotal)
		game.height(altoTotal)
		config.configurarTeclas()
		//game.boardGround("uber.png")		
	}
	
	
}

object nivel1 inherits Nivel{
	
	override method inicio(){
		super()
		game.addVisual(stats)
		const eds = new EstacionDeServicio()
		const d1 = new Destino(position=game.at(10,10))
		const p1 = new Pasajero(dineroDisponible=20,destino = d1)
		game.addVisual(eds)
		game.addVisual(p1)
		game.addVisual(d1)
		game.addVisualCharacter(autoJugador)
		game.showAttributes(autoJugador)
		game.showAttributes(p1)
		game.showAttributes(d1)
		game.addVisual(autoPrueba)
		
		colisiones.configurar()
	}
}

