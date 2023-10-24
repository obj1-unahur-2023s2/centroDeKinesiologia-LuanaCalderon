import aparatos.*
import pacientes.*

object centro {
	const property aparatos = []
	const pacientes = #{}
	
	method coloresDeAparatos() = aparatos.map({a=>a.color()}).asSet()
	method pacientesMenoresDe8Anios() = pacientes.filter({p=>p.edad()<8})
	method cantidadPacientesQueNoPuedenHacerRutina() = pacientes.count({p=>!p.puedeHacerRutina()})
	method estaOptimo() = aparatos.all({a=>!a.necesitaMantenimiento()})
	method estaComplicado() = self.aparatosParaMantenimiento().size() >= aparatos.size() / 2
	method aparatosParaMantenimiento() = aparatos.filter({a=>a.necesitaMantenimiento()})
	method visitaTecnico() {
		self.aparatosParaMantenimiento().forEach({a=> a.recibirMantenimiento()})
	}
	
	
	method agregarPacientes(listaPacientes) {pacientes.addAll(listaPacientes)}
	method agregarAparatos(listaAparatos) {aparatos.addAll(listaAparatos)}
	method agregarUnAparato(unAparato) {aparatos.add(unAparato)}
	
}
