package jmeetings

class Inscricao {

    static belongsTo = [evento:Evento, participante:Participante]
    static mapping = {
		participante cascade:"save-update"
    }

    Date dataInscricao = new Date()
    Boolean fezCheckin = false
    String comoSoube
	String jse
	String jme
	String jee
	String tempoExperiencia
	Boolean sorteado = false
	Boolean confirmado = false
	String expectativas

    String toString(){
      "${evento.nome} - ${participante.nome}"
    }

    static constraints = {
         comoSoube(nullable:true)
         expectativas(nullable:true)
    }
}
