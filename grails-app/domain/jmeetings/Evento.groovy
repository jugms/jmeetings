package jmeetings

class Evento {

    static hasMany = [inscricoes:Inscricao]

    String nome
	Date dataEvento

    String toString(){ nome }

    static constraints = {
    }
}
