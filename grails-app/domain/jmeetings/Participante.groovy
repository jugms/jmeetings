package jmeetings

class Participante {

    static hasMany = [inscricoes:Inscricao]

    String nome
    String email
    String senha
    String cpf
    String instituicao
    Date dataNascimento
    String cidade

    static constraints = {
        nome(length:2..50, blank:false)
        email(blank:false)
        email(unique:true,email:true)
        senha(blank:false,password:true)
        senha(maxSize:45)
        cpf(blank:false,cpf:true,unique:true)
        instituicao(length:2..100,blank:true,maxSize:50)
        cidade(maxSize:50)
    }

    String toString() { nome }

}
