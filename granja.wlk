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
		propiedad.plantar(cultivo, self.position())
	}
	
	method regar(cultivo) {
		propiedad.regar(cultivo, self.position())
	}
}

object mercado {
	const property position = game.at(5, 5)
	const property image = "mercado.png"
}

object granja {
	const property cultivos = #{}
	
	method plantar(cultivo, position) {
		self.validarPlantar(cultivo, position)
		//cultivo.position(position)
		cultivos.add(cultivo)
		game.addVisual(cultivo)
	}
	
	method validarPlantar(cultivo, position) {
		if (not self.puedePlantar(cultivo, position)) self.error(
				"No se puede plantar"
			)
	}
	
	method puedePlantar(cultivo, position) = not cultivos.contains(cultivo)
	
	//no valido si ya hay un cultivo porque ahora queremos poner mas cultivos
	method regar(cultivo, position) {
		self.validarRegar(cultivo, position)
		cultivo.regar()
	}
	
	method validarRegar(cultivo, position) {
		if (not self.puedeRegar(cultivo, position)) self.error("no puede regar")
	}
	
	//falta
	method puedeRegar(cultivo, position) {
		return
	}
	
	method cosechar(cultivo) {
		self.validarCosechar(cultivo)
		cultivo.cosechar()
		cultivos.remove(cultivo)
	}
	
	method validarCosechar(cultivo) {
		if (not self.puedeCosechar(cultivo)) self.error("no puede cosechar")
	}
	
	method puedeCosechar(cultivo) {
		return
	}
}

class Trigo {
	
}

class Tomaco {
	
}

class Maiz {
	
}