package jmeetings

import groovy.text.SimpleTemplateEngine

class NotificacaoController {

    def jmeetingsMailService

    def index = {
        render(view: "notificacao")
    }

    def buscarInscritos = {
        def evento = Evento.get(params.estadoSelecionado)
        def inscritos = Inscricao.findAllByEvento(evento)
        render(view: "inscritosEventoInclude", model: [evento:evento])
        def mensagem = evento.inscricoes? "${evento.inscricoes.size()} inscritos encontrados" : "nenhum inscrito encontrado"
        render(mensagem)
    }

    def notificar = {
        def evento = Evento.get(params.evento.id)
        def inscritos = Inscricao.findAllByEvento(evento)
        println("Total de Inscritos: "+inscritos.size)
        def contador = 0
        def template = new SimpleTemplateEngine().createTemplate(params.conteudo)

        inscritos.each{
            def texto = template.make(['inscricao':it])
            if (!it.confirmado)
            {
                jmeetingsMailService.sendMail(params.assunto, texto.toString(), it.participante.email)
                println("Enviado...: "+contador)
            }
            contador++
        }
        render "${inscritos.size} notificações efetuadas com sucesso"
    }
}
