package jmeetings

class EventoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [eventoInstanceList: Evento.list(params), eventoInstanceTotal: Evento.count()]
    }

    def create = {
        def eventoInstance = new Evento()
        eventoInstance.properties = params
        return [eventoInstance: eventoInstance]
    }

    def save = {
        def eventoInstance = new Evento(params)
        if (eventoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'evento.label', default: 'Evento'), eventoInstance.id])}"
            redirect(action: "show", id: eventoInstance.id)
        }
        else {
            render(view: "create", model: [eventoInstance: eventoInstance])
        }
    }

    def show = {
        def eventoInstance = Evento.get(params.id)
        if (!eventoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [eventoInstance: eventoInstance]
        }
    }

    def edit = {
        def eventoInstance = Evento.get(params.id)
        if (!eventoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [eventoInstance: eventoInstance]
        }
    }

    def update = {
        def eventoInstance = Evento.get(params.id)
        if (eventoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (eventoInstance.version > version) {
                    
                    eventoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'evento.label', default: 'Evento')] as Object[], "Another user has updated this Evento while you were editing")
                    render(view: "edit", model: [eventoInstance: eventoInstance])
                    return
                }
            }
            eventoInstance.properties = params
            if (!eventoInstance.hasErrors() && eventoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'evento.label', default: 'Evento'), eventoInstance.id])}"
                redirect(action: "show", id: eventoInstance.id)
            }
            else {
                render(view: "edit", model: [eventoInstance: eventoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def eventoInstance = Evento.get(params.id)
        if (eventoInstance) {
            try {
                eventoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'evento.label', default: 'Evento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'evento.label', default: 'Evento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), params.id])}"
            redirect(action: "list")
        }
    }
}
