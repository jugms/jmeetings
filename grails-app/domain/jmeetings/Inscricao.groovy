package jmeetings

class Inscricao {

    static belongsTo = [evento:Evento, participante:Participante]
    static mapping = {
        participante cascade:"save-update"
        expectativas type:"text"
        comoSoube type:"text"
    }

    Date dataInscricao = new Date()
    Boolean fezCheckin = false
    String jse
    String jme
    String jee
    String tempoExperiencia
    Boolean sorteado = false
    Boolean confirmado = false
    String expectativas
    String comoSoube

    String toString(){
      "${evento.nome} - ${participante.nome}"
    }

    static constraints = {
        comoSoube(nullable:true, maxSize:1000)
        expectativas(nullable:true, maxSize:1000)

    }
}
