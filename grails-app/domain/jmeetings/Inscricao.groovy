package jmeetings


class Inscricao {

    static belongsTo = [evento:Evento, participante:Participante]
    static hasMany = [palestras:Palestra]
    static mapping = {
        participante cascade:"save-update"
        expectativas type:"text"
        comoSoube type:"text"
    }

    Date dataInscricao = new Date()
    Boolean fezCheckin = false
    Boolean recebeuKit = false
    String jse
    String jme
    String jee
    String tempoExperiencia
    Boolean sorteado = false
    Boolean confirmado
    String expectativas
    String comoSoube
    Boolean premiado = false

	boolean inscricaoSimples(){
		//xucro! FIXME buscar o evento pela sessao ou combobox
		evento = Evento.get(1)
		fezCheckin = true
		if(this.participante.validate(['nome', 'email'])){
			save(validate: false)
		}
	}

    boolean confirmarPresenca(confirma,palestras)
    {
        this.confirmado = confirma
        if(this.confirmado){
            if (palestras == null)
            {
                throw new IllegalArgumentException('Você deve selecionar 5 palestras!')
            }
            else
            {
                palestras = Palestra.getAll( palestras.collect{ it.toLong() } )
                if(palestras.size != 5){
                    throw new IllegalArgumentException('Você deve selecionar 5 palestras!')
                }
                this.palestras = palestras
            }
        }
        save()
    }
	
    void checkin()
    {
        this.fezCheckin = true
        save()
    }
	
    void receberKit()
    {
        this.recebeuKit = true
        save()
    }

    void marcarSorteado(){
        this.sorteado = true
        save()
    }

    void marcarPremiado(){
        marcarSorteado()
        this.premiado = true
        save()
    }

    static Inscricao buscarPremiaveis(){
        def sb =  new StringBuilder()
        def random = new Random()

        for(i in 1..9){
            sb.append(random.nextInt(300).toString())
            sb.append(",");
        }
        sb.append(random.nextInt(300).toString())
        println sb.toString()
        //TODO buscar apenas inscricoes do evento ativo
        Inscricao.find("from Inscricao i where i.id in (1,"+ sb.toString() + ") and i.fezCheckin = true and i.sorteado = false and i.premiado = false")
    }

    static Inscricao buscarPorEventoECpf(evento, cpf){
        Inscricao.find("from Inscricao i where i.participante.cpf = :cpf and i.evento.nome = :evento", ["cpf":cpf, "evento":evento])
    }

    static List buscarPorNomeOuEmail(filtro){
        Inscricao.findAll("from Inscricao i where lower(i.participante.nome) like :nome or lower(i.participante.email) like :email", [nome: "%${filtro.toLowerCase()}%", email: "%${filtro.toLowerCase()}%"])
    }

    String toString(){
      "${evento.nome} - ${participante.nome}"
    }

    static constraints = {
		//participante(validator:{it.validate()})
        confirmado(nullable:true)
        comoSoube(nullable:true, maxSize:1000)
        expectativas(nullable:true, maxSize:1000)

    }
}
