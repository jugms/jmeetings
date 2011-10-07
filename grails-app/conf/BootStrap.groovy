import jmeetings.*

class BootStrap {

    def grailsApplication 
	
    def init = { servletContext ->
		configurarSaveComGruposDeValidacao()

		//criando usuario admin

		def email = 'admin@jmeetings.com.br'
		def senha = "admin"

		if(!Participante.autenticar(email, senha)){

			new Participante(email: email, 
					senha: senha.encodeAsSHA1(), 
					administrador: true,
					cidade: 'Campo Grande',
					nome: 'Administrador',
					cpf: '266.862.435-58', //gerado
					dataNascimento: new Date(),
					instituicao: 'ADM'
					).save()

		}
		
		if(Evento.count() == 0){
			new Evento(nome: "Javaneiros2011", email: "coordenacao@jugms.com.br").save()
		}


    }
    def destroy = {
    }


	//TODO extrair daqui um plugin
    def configurarSaveComGruposDeValidacao = {
		grailsApplication.domainClasses.each { domainClass ->
			domainClass.metaClass.save = {String[] grupos ->
				def obj = delegate
				def campos = []
				grupos.each{
					campos += obj.constraintGroups[it]
				}
				if(obj.validate(campos)){
					obj.save(validate: false)
				}
				else {
					false
				}
			}
		}
    }
}
