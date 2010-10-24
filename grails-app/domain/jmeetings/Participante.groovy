package jmeetings

class Participante {

    static hasMany = [inscricoes:Inscricao]

    String nome
    String email
     String senha
     String cpf
     String instituicao
     Date dataNascimento
// 	String uf
	String cidade

    static constraints = {
		
        nome(length:2..50, blank:false)
        email(unique:true,email:true)
        senha(blank:false,password:true)
        cpf(blank:false,unique:true)
        instituicao(length:2..100,blank:true)
		
    }

    String toString() { nome }

}
