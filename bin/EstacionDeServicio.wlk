import autoPlayer.*
import wollok.game.*

class EstacionDeServicio {
	const property image = "caja.png"
	var property position = game.at(2,2)
	
	
	method venderCombustible(){
		if (autoJugador.gananciasTotales() >0 ){
			autoJugador.cargarCombustible(10)
		}
	}
	
	method mensaje(){
		if (autoJugador.gananciasTotales()>0){
			return "Presiona C para cargar combustible"
		}else{
			return "Not enough cash, stranger"
		}
	}
	

	
}


