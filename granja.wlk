import wollok.game.*

object femenino {
	method prefijo() = "f"
	
	method otro() = masculino
}

object masculino {
	method prefijo() = "m"
	
	method otro() = femenino
}

object personaje {
	var property genero = femenino
	var property position = game.center()
	const propiedad = granja
	
	method image() = ((genero.prefijo() + "-player-") + self.estado()) + ".png"
	
	method estado() = if (self.estaSobreAlgo()) "abajo" else "normal"
	
	method estaSobreAlgo() = not game.colliders(self).isEmpty()
	
	method cambiarGenero() {
		genero = genero.otro()
	}
	
	method plantar(cultivo) {
		self.validarPlantar(cultivo)
		propiedad.cultivos().add(cultivo)
		game.addVisual(cultivo)
	}
	
	method validarPlantar(cultivo) {
		if (not self.puedePlantar(cultivo)) self.error("No se puede plantar")
	}
	
	method puedePlantar(cultivo) = (not propiedad.cultivos().contains(
		cultivo
	)) && (not cultivo.overlaps(self.position()))
	
	//esto creo que esta mal, deberia preguntar si no hya ninguno solamente en la poercela actual, ya que si hay clases pueeden reperise )
	//REGAR------------------------------------------------------
	//no valido si ya hay un cultivo porque ahora queremos poner mas cultivos
	method regar(cultivo) {
		self.validarRegar(cultivo)
		cultivo.regar()
	}
	
	method validarRegar(cultivo) {
		if (not self.puedeRegar(cultivo)) self.error("no puede regar")
	}
	
	//falta
	method puedeRegar(cultivo) {
		return //aca verifico si el cultivo esta en la posicion del personaje
	}
	
	//COSECHAR------------------------------------------------------
	method cosechar(cultivo) {
		self.validarCosechar(cultivo)
		cultivo.cosechar()
		propiedad.cultivos().remove(cultivo)
	}
	
	method validarCosechar(cultivo) {
		if (not self.puedeCosechar(cultivo)) self.error("no puede cosechar")
	}
	
	method puedeCosechar(cultivo) {
		return
	}
}

object mercado {
	const property position = game.at(5, 5)
	const property image = "mercado.png"
}

object granja {
	const property cultivos = #{}
}

class Trigo {
	var evolucion = 0
	
	method image() = ("trigo_" + evolucion) + ".png"
	
	method regar() {
		if (evolucion < 3) {
			evolucion += 1
		} else {
			evolucion = 0
		}
	}
}

class Tomaco {
	method image() = "tomaco.png"
	
	method regar() {
		
		//tengo que moverla a la superior o a abajo de todo si ya esta en la superior
	}
}

class Maiz {
	var estado = "bebe"
	
	method image() = ("maiz_" + estado) + ".png"
	
	method regar() {
		if (estado == "bebe") {
			estado = "adulta"
		} else {
			estado = "bebe"
		}
	}
}