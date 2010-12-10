package jmeetings

class Avaliacao {

	static belongsTo = [palestra:Palestra, inscricao:Inscricao]
	
	Integer nota
	String comentario
	
    static constraints = {
		nota(range:1..5, nullable:false)
    }

    String toString(){
      "${inscricao?.participante?.nome} - ${palestra?.titulo}: ${nota}, ${comentario}"
    }
}
