package jmeetings

class Palestra {

	static hasMany = [inscricoes:Inscricao]
	static belongsTo = Inscricao
	
    String dataSubmissao
    //dados do palestrante
    String nome
    String email
    String celular
    String curriculo
    
    //dados da palestra
    String titulo
    String topicos
    String nivel
    String recursos

    Boolean aprovada = false

    static constraints = {
    }
}
