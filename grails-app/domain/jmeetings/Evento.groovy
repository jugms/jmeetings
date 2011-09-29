package jmeetings

class Evento {

    static hasMany = [inscricoes:Inscricao, palestras:Palestra]
    static mappedBy = [palestras: 'evento']

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
