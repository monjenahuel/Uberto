import autoPlayer.*
import wollok.game.*
import config.*

class Pasajero {
	var property destino // Destino()
	var property dineroDisponible // Int
	var property position = game.at(5,5)
	const property posicionInicial = position
	const property image = "pasajero1.png"
	var property costoDelUltimoViaje = 0
	

	
	method interactuar(auto){
		auto.subirPasajero(self)
	}
	
	method abonarViaje(auto){
		costoDelUltimoViaje = 0.max(dineroDisponible - auto.pasosDelPasajeroAlDestino())
		dineroDisponible -= costoDelUltimoViaje
		auto.recibirCobro(costoDelUltimoViaje)
		self.bajarDelAuto()
	}
	
	method personaEnDestino() = nivel1.destinos().any{ undestino => undestino.position() == self.position() }
	
	method bajarDelAuto(){
		self.personaEnDestino()
		position = destino.position()
		game.addVisual(self)
		game.schedule(2000, {game.removeVisual(self)})
		game.schedule(2000, {game.removeVisual(destino)})
	}
	
	
	
	method mensaje(){
		if (position != destino.position()) {
			return "
					¿Uber?"
	}if (costoDelUltimoViaje == 0){
		return "Dejá, la proxima llamo un remis"
	}else{
		return "$" + costoDelUltimoViaje + " dice la app, gracias"
	}
}

}

class Destino{
	var property image = "null.png"
	var property position
	const property posicionInicial = position
	
	method mostrarDestino(){
		image = "Pixel.png"
	}
	
	method mensaje(){
		return "Viaje completado"
	}
	
	method interactuar(auto){
		auto.bajarPasajero(auto.pasajeroActual())
	}
}
