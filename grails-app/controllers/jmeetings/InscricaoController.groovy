package jmeetings

import groovy.text.SimpleTemplateEngine

class InscricaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def jmeetingsMailService

    def buscar = {

		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.sort = 'fezCheckin'
		params.order = 'desc'		
		def lista = params.filtro ? Inscricao.buscarPorNomeOuEmail(params.filtro) : Inscricao.list(params)
			
		render(view: 'list', model: [inscricaoInstanceList:lista, inscricaoInstanceTotal:lista.size()])
    }

	def confirmar = {
		if(request.method == 'GET') {
			render(view:'selecaoPalestras', model: [inscricaoInstance: Inscricao.buscarPorEventoECpf(params.evento, params.cpf), palestras: Palestra.list()])
		}
		else{
			def inscricao = Inscricao.get(params.id)
			try{
				
				def ids = []
				params.palestras.each{
					ids << Integer.valueOf(it)
				}
				if(inscricao.confirmarPresenca(Palestra.getAll(ids)))
				{
					flash.message = "sucesso"
					render(view: 'selecaoPalestras')
				}
			}
			catch(IllegalArgumentException e){
				flash.message = e.message
				render(view:'selecaoPalestras', model: [palestras: Palestra.list(), inscricaoInstance: inscricao])
			}

			
		}
	}

    def checkin = {
		def inscricao = Inscricao.get(params.id)
		inscricao.fezCheckin = true
		inscricao.save()
		redirect(action:'list')
    }

		def receberKit = {
			def inscricao = Inscricao.get(params.id)
			inscricao.recebeuKit = true
			inscricao.save()
			redirect(action:'list')
    }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.offset) params.offset = 0
        if (!params.sort) params.sort = "id"
        if (!params.order) params.order = "asc"

        def inscricoes = Inscricao.withCriteria {
            maxResults(params.max?.toInteger())
            firstResult(params.offset?.toInteger())
            if (params.sort.startsWith('participante.')) {
                def atributo = params.sort.replaceAll('participante.','')
                participante {
                    order(atributo, params.order)
                }
            } else {
                order(params.sort, params.order)
            }
        }
        [inscricaoInstanceList:inscricoes, inscricaoInstanceTotal:Inscricao.count()]
    }

    def create = {
        def inscricaoInstance = new Inscricao()
        inscricaoInstance.properties = params
        return [inscricaoInstance: inscricaoInstance]
    }

    def save = {
		
        def inscricaoInstance = new Inscricao(params)
        //aqui eu limpo o cpf para deixar só os números
        inscricaoInstance.participante.cpf = inscricaoInstance.participante.cpf?.trim().replaceAll('\\.', '').replaceAll('\\-', '')
		
        if ( inscricaoInstance.validate() & inscricaoInstance.participante.validate() &
            inscricaoInstance.participante.senha == params.confirmacaoSenha) {
            inscricaoInstance.participante.senha = inscricaoInstance.participante.senha.encodeAsSHA1()
            inscricaoInstance.save(flush: true)
			
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), inscricaoInstance.id])}"
							
            def texto = "Olá ${inscricaoInstance.participante.nome}, sua inscrição no ${inscricaoInstance.evento.nome} foi realizada com sucesso! Acesse o link abaixo para confirmar sua inscrição e obter sua camiseta.\nhttp://www.javaneiros.com.br/2010/noticia/inscricoes-pagamento"
            try{
                jmeetingsMailService.sendMail("Inscrição no ${inscricaoInstance.evento.nome}", texto, inscricaoInstance.participante.email)
            }
            catch (Exception ex){}
            render(view: "confirmacaoInscricao", model: [inscricaoInstance:inscricaoInstance])
        }
        else {
            if(inscricaoInstance.participante.senha != params.confirmacaoSenha){
                inscricaoInstance.participante?.errors?.rejectValue("senha","participante.senhas.diferentes")
            }
            render(view: "create", model: [inscricaoInstance: inscricaoInstance])
        }
    }

    def show = {
        def inscricaoInstance = Inscricao.get(params.id)
        if (!inscricaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [inscricaoInstance: inscricaoInstance]
        }
    }

    def edit = {
        def inscricaoInstance = Inscricao.get(params.id)
        if (!inscricaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [inscricaoInstance: inscricaoInstance]
        }
    }

    def update = {
        def inscricaoInstance = Inscricao.get(params.id)
        if (inscricaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (inscricaoInstance.version > version) {
                    inscricaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'inscricao.label', default: 'Inscricao')] as Object[], "Another user has updated this Inscricao while you were editing")
                    render(view: "edit", model: [inscricaoInstance: inscricaoInstance])
                    return
                }
            }
            inscricaoInstance.properties = params
            if (!inscricaoInstance.hasErrors() && inscricaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), inscricaoInstance.id])}"
                redirect(action: "show", id: inscricaoInstance.id)
            }
            else {
                render(view: "edit", model: [inscricaoInstance: inscricaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def inscricaoInstance = Inscricao.get(params.id)
        if (inscricaoInstance) {
            try {
                inscricaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'inscricao.label', default: 'Inscricao'), params.id])}"
            redirect(action: "list")
        }
    }
}
