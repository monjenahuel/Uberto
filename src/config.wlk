import wollok.game.*
import autoPlayer.*
import EstacionDeServicio.*
import Pasajeros.*




object config {
	//Configuracion de volumen y teclas, además tiene el metodo revisarColision y guarda el nivel actual en el que esta el juego
	
	const niveles =[menu,nivel1,nivel2,nivel3]

	method configurarTeclas() {
		keyboard.up().onPressDo{autoJugador.avanzar("arriba") }
		keyboard.down().onPressDo{autoJugador.avanzar("abajo") }
		keyboard.left().onPressDo{autoJugador.avanzar("izq") }
		keyboard.right().onPressDo{autoJugador.avanzar("der") }
	
		keyboard.z().onPressDo{autoJugador.interactuarCon(autoJugador.objetoColisionante())}
		
		keyboard.r().onPressDo{self.reiniciarJuego(autoJugador.nivelActual())}
		
		
		keyboard.s().onPressDo{self.pasarDeNivel()}
		
	}
	
	method nivelSiguiente(){
		return autoJugador.nivelActual().siguienteNivel()
	}
	
	method pasarDeNivel(){
		
		self.nivelSiguiente().inicio()
		self.nivelSiguiente().reiniciar()
		autoJugador.nivelActual(self.nivelSiguiente())
	}
	
	method reiniciarJuego(nivel) {
		nivel.reiniciar()	
	}
	
	

	
}

object colisiones{
	
	
	method configurar(){
		game.onCollideDo(autoJugador, { e => game.say(e, e.mensaje())})
		game.onTick(1000, "movimiento", { autoPrueba.movete() })
	}
	
}

object gameOver{
	method image()= "GameOver2.png"
	method position()= game.at(4,8)
	
}
	
	
class Nivel{
	const anchoTotal = 15
	const altoTotal = 15
	var property siguienteNivel
	var property pasajeros=[]
	var property destinos=[]
	
	

	
	method inicio(){
		
		game.clear()
		game.title("El laburante del Uber")
		game.width(anchoTotal)
		game.height(altoTotal)
		
		config.configurarTeclas()
		
	}
	
	method reiniciarPosiciones(){
		game.allVisuals().forEach({elemento => elemento.position(elemento.posicionInicial() ) } )
	}
	
	
	
	method reiniciar(){
		self.inicio()
		self.reiniciarPosiciones()
		autoJugador.inicializarAuto()
	}
	
	
	
	
	
}

object menu inherits Nivel(siguienteNivel = nivel1){
	
	method image() = "caja.png"
	method position() = game.center()
	
	override method inicio(){
		super()
		
		game.addVisual(self)
	}
	
	
	
}



object nivel1 inherits Nivel(siguienteNivel = nivel2){
	
	//method crearPasajero(x, y,dinero,destino){pasajeros.add(new Pasajero(dineroDisponible = dinero,position = game.at(x, y), posicionInicial =, destino = destino))}
	/* 
	method crearDestino(x, y) {
		destinos.add(new Destino(position = game.at(x, y)))
	}
	
	method elementosDelNivel() = [ pasajeros, destinos ].flatten()
	
	method cargarElementos() {
		self.elementosDelNivel().forEach{ unElemento => game.addVisual(unElemento)}
		self.elementosDelNivel().forEach{ unElemento => game.showAttributes(unElemento)}
	}
	
	method eliminarElementos() {
		self.elementosDelNivel().forEach{ unElemento => game.removeVisual(unElemento)}
		pasajeros.clear()
	}
	
	method reiniciarPosicion() {
		pasajeros.forEach({ p => p.reiniciarPosicion()})
	}
	
	method reiniciarJuego() {
	
		self.inicio()
		nivel1.reiniciarPosicion()
		game.say(autoJugador,"¡Esta vez lo hare mejor!")
		autoJugador.reiniciarPosicion()
		autoJugador.masCombustible()
	}
	
	*/
	
	
	override method inicio(){
		
		super()
			
		var eds = new EstacionDeServicio()
		var d1 = new Destino(position=game.at(7,7))
		var p1 = new Pasajero(dineroDisponible=20,destino = d1)

		
		game.addVisual(stats)
		
		//self.crearPasajero(5,6, 7,d2)
		
		//self.cargarElementos()
		game.addVisual(eds)
		game.addVisual(p1)
		game.addVisual(d1)

		game.addVisualCharacter(autoJugador)

		game.showAttributes(autoJugador)

		
		game.addVisual(autoPrueba)
		
		colisiones.configurar()	
		
		
	}
	
	
	
	/* 
	method noHayPasajeros(){
		return game.removeVisual(p1)
	}*/
	
	
	

	/* 
	//Elimina los objetos del nivel actual y ejecuta el siguiente
	method avanzarA() {
		
		if (self.noHayPasajeros()) {
			nivel2.inicio()
		}
	}*/
	
	
}



object nivel2 inherits Nivel(siguienteNivel = nivel3){

	
	override method inicio(){
		
		super()
		
			
		const esd = new EstacionDeServicio()
		const d2 = new Destino(position=game.at(8,8))
		const p2 = new Pasajero(position=game.at(2,3),dineroDisponible=50,destino = d2)
		
		game.addVisual(stats)
		
		game.addVisual(esd)
		game.addVisual(p2)
		game.addVisual(d2)
		game.addVisualCharacter(autoJugador)
		game.showAttributes(autoJugador)
		game.showAttributes(p2)
		game.showAttributes(d2)
		game.addVisual(autoPrueba)
		
		colisiones.configurar()	
		
		
		
	}
	
	

	
}

object nivel3 inherits Nivel(siguienteNivel = creditos){

	
	override method inicio(){
		
		super()
		
			
		const esd = new EstacionDeServicio()
		const d2 = new Destino(position=game.at(8,8))
		const p2 = new Pasajero(position=game.at(2,3),dineroDisponible=50,destino = d2)
		
		game.addVisual(stats)
		
		game.addVisual(esd)
		game.addVisual(p2)
		game.addVisual(d2)
		game.addVisualCharacter(autoJugador)
		game.showAttributes(autoJugador)
		game.showAttributes(p2)
		game.showAttributes(d2)
		game.addVisual(autoPrueba)
		
		colisiones.configurar()	
		

	}
	
	
}


object creditos inherits Nivel(siguienteNivel = null){
	method image() = "caja.png"
	method position() = game.center()
	
	override method inicio(){
		super()
		
		game.addVisual(self)
	}
	
	
}
