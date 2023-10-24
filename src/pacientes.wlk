import aparatos.*

class Paciente {
	const property edad
	var   nivelDeFortaleza 
	var    nivelDeDolor 
	const rutina = []
	
	
	method nivelDeFortaleza() = nivelDeFortaleza
	method nivelDeDolor() = nivelDeDolor
	method puedeUsar(unAparato) = unAparato.puedeSerUsadoPor(self)
	
	method usarAparato(unAparato) {
		if(!self.puedeUsar(unAparato)) {
			self.error("El paciente no puede usar ese aparato")
		}
		unAparato.consecuenciaDeUsoEn(self)
		nivelDeFortaleza += unAparato.valorQueSumaFortaleza(self)
		nivelDeDolor = 0.max(nivelDeDolor - unAparato.valorQueRestaDolor(self))
	}
	
	method asignarRutina(listaDeAparatos) {rutina.addAll(listaDeAparatos)}
	
	method puedeHacerRutina() = rutina.all({a=> self.puedeUsar(a)}) 
	
	method realizarRutina() {
		if(!self.puedeHacerRutina()) {
			self.error("El paciente no puede hacer la rutina porque contiene aparatos que no puede usar")
		}
		rutina.forEach({a => self.usarAparato(a)})
	}
}
	

class PacienteResistente inherits Paciente {
	override method realizarRutina() { 
	super() 
	nivelDeFortaleza += rutina.size()
	}
	
}


class PacienteCaprichoso inherits Paciente {
	override method puedeHacerRutina() = super() && self.hayAparatoRojo()
	method hayAparatoRojo() = rutina.any({a=>a.color() == "rojo"})
	override method realizarRutina() {
		(1..2).forEach({e=> super()})
	}
}

class RapidaRecuperacion inherits Paciente {
	override method realizarRutina() {
		super()
		nivelDeDolor = 0.max(nivelDeDolor - coeficienteDeRecuperacion.valor())
	}
}

object coeficienteDeRecuperacion {
	var property valor = 3
}