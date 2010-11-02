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
    Boolean administrador

    static constraints = {
        nome(length:2..50, blank:false)
        email(blank:false)
        email(unique:true,email:true)
        senha(blank:false,password:true)
        senha(maxSize:45)
        cpf(blank:false,unique:true,maxSize:20)
        instituicao(length:2..100,blank:true,maxSize:50)
        cidade(maxSize:50)
    }

    static Participante autenticar(String email, String senha)
    {
        Participante participante = Participante.find("from Participante as p where p.email=:email and p.senha=:senha and p.administrador =:administrador",
            [email:email,senha:senha.encodeAsSHA1(),administrador:true])
        return participante
    }

    String toString() { nome }

}
