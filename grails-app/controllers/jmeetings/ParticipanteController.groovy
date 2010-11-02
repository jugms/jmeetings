package jmeetings

class ParticipanteController {

    def scaffold = true

    def save = {
        def participanteInstance = new Participante(params)
        participanteInstance.senha = participanteInstance.senha.encodeAsSHA1()
        if (participanteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'participante.label', default: 'Participante'), participanteInstance.id])}"
            redirect(action: "show", id: participanteInstance.id)
        }
        else {
            render(view: "create", model: [participanteInstance: participanteInstance])
        }
    }

}
