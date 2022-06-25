import wollok.game.*

object autoJugador {
	var property image = "AutoAzulDerecha.png"
	var property position = game.origin()
	var property pasosDelPasajeroAlDestino = 0
	var property pasajeroActual = null
	var property gananciasTotales = 100
	var property combustible = 5
	var property ultimaDireccion = null
	
	method avanzar(direccion){
		ultimaDireccion = direccion
		if (combustible == 0){
			game.removeVisual(self)
			game.addVisual(autoParado)
			game.addVisual(gameOver)
			autoParado.error("Uh, me quedé sin nafta")	
			
		}
		if (combustible >= 1){
			self.rotar(direccion)
			combustible = 0.max(combustible - 1)}
	}
	
	method rotar(direccion){
		if (direccion == "arriba"){
			image = "AutoAzulArriba.png"	
		}else if (direccion == "abajo"){
			image = "AutoAzulAbajo.png"
		}else if (direccion == "izq"){
			image = "AutoAzulIzquierda.png"
		}else if(direccion == "der"){
			image = "AutoAzulDerecha.png"
		}	
	}
	
	method subirPasajero(pasajero){
		pasajeroActual = pasajero
	}
	
	method recibirCobro(monto){
		gananciasTotales += monto
		
	}
	
	method cargarCombustible(litros){
		combustible += litros
		gananciasTotales -= litros
	}
	
	
}

object autoParado{
	var property image = autoJugador.image()
	const property position = self.positionAParar()
	
	
	
	method positionAParar(){
		
		if (autoJugador.ultimaDireccion() == "arriba"){
			return autoJugador.position().down(1)
		}if(autoJugador.ultimaDireccion() == "abajo"){
			return autoJugador.position().up(1)
		}if(autoJugador.ultimaDireccion() == "izq"){
			return autoJugador.position().right(1)
		}if(autoJugador.ultimaDireccion() == "der"){
			return autoJugador.position().left(1)
		}else{
			return autoJugador.position()
		}
}


}

object stats{
	method text()= 
		return "Nafta: " + autoJugador.combustible() + "    " + "Dinero: " + autoJugador.gananciasTotales()
		
	method position()= game.at(12,0)
	
}

object gameOver{
	method image()= "GameOver.png"
	method position()= game.at(4,8)
	
}
