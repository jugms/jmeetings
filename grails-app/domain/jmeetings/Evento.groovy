package jmeetings

class Evento {

    static hasMany = [inscricoes:Inscricao]

    String nome
    Date data = new Date()
    String email

    String toString(){ nome }

    static constraints = {
        nome(unique:true,length:2..50, blank:false)
        data(nullable:true,blank:false)
        email(unique:true,email:true)
    }
}
