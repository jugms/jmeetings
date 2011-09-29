package jmeetings

import groovy.text.SimpleTemplateEngine

class PalestraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

	def avaliar = {
		if(request.method == 'GET') {
			def inscricao = Inscricao.buscarPorEventoECpf(params.evento, params.cpf)

			if(!inscricao){
				flash.errors = "Inscri√ß√£o n√£o encontrada!"
				render(view:'avaliacao')
			}
			else
			{
				def palestras = Palestra.buscarAprovadas() - inscricao.avaliacoes.collect{it.palestra}
				def avaliacoes = []
				palestras.each{
					avaliacoes += new Avaliacao(inscricao: inscricao, palestra: it)
				}

				render(view:'avaliacao', model: [inscricao: inscricao, avaliacoes: avaliacoes, total: avaliacoes.size()])
			}

			
		}
		else if(request.method == 'POST') {


			def inscricao = Inscricao.get(params.id)

			for(i in 0..(params.total.toInteger() -1)){
				//o problema √© que aqui a inscricao inserida √© nova, e nao gerenciado. a√≠ na hora de salvar d√° pau
				def avaliacao = new Avaliacao(params."avaliacoes[${i}]")
				if(avaliacao.nota || avaliacao.comentario?.trim()){
					inscricao.avaliacoes += avaliacao
				}
			}
			
			if(inscricao.save()){
				flash.message = "Avalia√ß√£o realizada com sucesso!"
				render(view:'avaliacaoSucesso', model: [inscricao: inscricao])
			}
			else{
				
				render(view: 'avaliacao', model: [inscricao: inscricao, avaliacoes: (inscricao.avaliacoes as List), total: inscricao.avaliacoes.size()])
			}

		}



	}

    def notificarAprovados = {

		def palestrasAprovadas = Palestra.findAllByAprovada(true)

		def text = '''Boa tarde ${p.nome},
			em nome do JUGMS venho comunicar que sua palestra '${p.titulo}' foi aprovada.
			Em breve estarei enviando o layout dos slides que ser√° usado por todos os palestrantes. O intuito √© al√©m de proporcionar uma identidade visual para as palestras do evento, divulgar nossos apoiadores e patrocinadores, pois sem eles o evento n√£o seria poss√≠vel.
			Solicito ainda que assim que tiver algum material pronto me envie para que a coordena√ß√£o possa analisar e assim podermos ajudar em alguma coisa.
			Essa semana a grade preliminar do evento j√° estar√° dispon√≠vel no site www.javaneiros.com.br >> Palestras.
			Obrigado e bom trabalho na prepara√ß√£o da palestra. Estou √† disposi√ß√£o para responder quaisquer d√∫vidas.'''


		def template = new SimpleTemplateEngine().createTemplate(text)


		palestrasAprovadas.each{

			def corpoEmail =  template.make(['p':it])
			def destinatario = it.email

			println "========================================="
			println "TO: " + destinatario
			println corpoEmail

			println "========================================="



			sendMail{
			from 	"gscordeiro@gmail.com"
			to 	"dantiele@gmail.com"
			bcc	"gscordeiro@gmail.com"
			subject 	"Sua palestra para o Javaneiros2010 foi aprovada!"
			body 	corpoEmail
			}


		}

		render "${palestrasAprovadas.size} notifica√ß√µes enviadas"

    }


    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
	params.sort = 'aprovada'
	params.order = 'desc'
        [palestraInstanceList: Palestra.list(params), palestraInstanceTotal: Palestra.count()]
    }

    def create = {
        def palestraInstance = new Palestra(params)
        if(params.nomeEvento){ //veio pelo link de submissão de palestra
        	palestraInstance.evento = Evento.findByNomeIlike(params.nomeEvento)
        }
        return [palestraInstance: palestraInstance]
    }

    def save = {
        def palestraInstance = new Palestra(params)
        if (palestraInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'palestra.label', default: 'Palestra'), palestraInstance.id])}"
            redirect(action: "show", id: palestraInstance.id)
        }
        else {
            render(view: "create", model: [palestraInstance: palestraInstance])
        }
    }

    def show = {
        def palestraInstance = Palestra.get(params.id)
        if (!palestraInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'palestra.label', default: 'Palestra'), params.id])}"
            redirect(action: "list")
        }
        else {
            [palestraInstance: palestraInstance]
        }
    }

    def edit = {
        def palestraInstance = Palestra.get(params.id)
        if (!palestraInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'palestra.label', default: 'Palestra'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [palestraInstance: palestraInstance]
        }
    }

    def update = {
        def palestraInstance = Palestra.get(params.id)
        if (palestraInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (palestraInstance.version > version) {
                    
                    palestraInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'palestra.label', default: 'Palestra')] as Object[], "Another user has updated this Palestra while you were editing")
                    render(view: "edit", model: [palestraInstance: palestraInstance])
                    return
                }
            }
            palestraInstance.properties = params
            if (!palestraInstance.hasErrors() && palestraInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'palestra.label', default: 'Palestra'), palestraInstance.id])}"
                redirect(action: "show", id: palestraInstance.id)
            }
            else {
                render(view: "edit", model: [palestraInstance: palestraInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'palestra.label', default: 'Palestra'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def palestraInstance = Palestra.get(params.id)
        if (palestraInstance) {
            try {
                palestraInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'palestra.label', default: 'Palestra'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'palestra.label', default: 'Palestra'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'palestra.label', default: 'Palestra'), params.id])}"
            redirect(action: "list")
        }
    }
}
