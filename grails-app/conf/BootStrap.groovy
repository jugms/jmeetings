class BootStrap {

	def grailsApplication 
	
    def init = { servletContext ->
		configurarSaveComGruposDeValidacao()
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
