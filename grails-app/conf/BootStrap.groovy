import jmeetings.*

class BootStrap {

    def grailsApplication 
	
    def init = { servletContext ->
		configurarSaveComGruposDeValidacao()

		/*criando usuario admin
		environments {
		    development {
			new Participante(email: 'admin@jmeetings.com.br', 
					 senha: "admin".encodeAsSHA1(), 
					 administrador: true,
					 cidade: 'Campo Grande',
					 nome: 'Administrador',
					 cpf: '266.862.435-58', //gerado
					 dataNascimento: new Date(),
					 instituicao: 'ADM'
					 ).save(validate: false)
		    }
		}*/

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
