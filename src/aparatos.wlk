import pacientes.*

class Aparatos {
	const property color = "blanco"
	method puedeSerUsadoPor(unPaciente) = true
	method consecuenciaDeUsoEn(unPaciente)
	method valorQueSumaFortaleza(unPaciente) = 0
	method valorQueRestaDolor(unPaciente) = 0
	method necesitaMantenimiento() = false
	method recibirMantenimiento() {}
}

class Magneto inherits Aparatos {
	var imantacion = 800
	
	override method valorQueRestaDolor(unPaciente) = unPaciente.nivelDeDolor() * 0.1
	override method consecuenciaDeUsoEn(unPaciente) {}
	override method necesitaMantenimiento() = imantacion < 100
	override method recibirMantenimiento() {imantacion = 800.min(imantacion+500)}
	

	
}

class Bicicleta inherits Aparatos {
	var cantTornillos = 0
	var cantAceite = 0
	override method puedeSerUsadoPor(unPaciente) = unPaciente.edad() > 8
	override method valorQueSumaFortaleza(unPaciente) = 3
	override method valorQueRestaDolor(unPaciente) = 4
	override method consecuenciaDeUsoEn(unPaciente) { 
		if(unPaciente.nivelDeDolor()>30) {
			cantTornillos++
		}
		if(unPaciente.edad().between(30,50)) {
			cantAceite++
	}	
}

    override method necesitaMantenimiento() = cantTornillos >= 10 || cantAceite >= 5
	override method recibirMantenimiento() {
		cantTornillos = 0
		cantAceite = 0
	}


}
class MiniTramp inherits Aparatos {
	override method puedeSerUsadoPor(unPaciente) = unPaciente.nivelDeDolor() < 20
	override method valorQueSumaFortaleza(unPaciente)  = unPaciente.edad() * 0.1
	override method consecuenciaDeUsoEn(unPaciente) { }

	
}