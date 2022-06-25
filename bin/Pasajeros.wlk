import autoPlayer.*
import wollok.game.*

class Pasajero {
	var property destino //Position
	var property dineroDisponible // Int
	const position 
	
	method abonarViaje(auto){
		const costoDelViaje = 0.max(dineroDisponible - auto.pasosDelPasajeroAlDestino())
		dineroDisponible -= costoDelViaje
		auto.recibirCobro(costoDelViaje)
	}
	
}
