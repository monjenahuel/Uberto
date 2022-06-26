import autoPlayer.*
import wollok.game.*

class EstacionDeServicio {
	const property image = "nafta2.png"
	var property position = game.origin()//game.at(2,2)
	
	
	method interactuar(auto){
		self.venderCombustible(auto)
	}
	
	method venderCombustible(auto){
		if (auto.gananciasTotales() >0 ){
			auto.cargarCombustible(10)
		}
	}
	
	method mensaje(){
		if (autoJugador.gananciasTotales()>0){
			return "Presiona Z para cargar combustible"
		}else{
			return "Not enough cash, stranger"
		}
	}
	

	
}


