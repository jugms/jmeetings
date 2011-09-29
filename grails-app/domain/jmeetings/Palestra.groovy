package jmeetings

class Palestra {

	static hasMany = [inscricoes:Inscricao, avaliacoes:Avaliacao]
	static belongsTo = Inscricao
	
	Evento evento
	
	Date dataSubmissao = new Date()
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
	
	String toString(){
		"${titulo}"
	}
	
	static List buscarAprovadas(){
	Palestra.findAll("from Palestra p where p.aprovada = :aprovada", ["aprovada":true])
	}
}
