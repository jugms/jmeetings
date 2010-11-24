package jmeetings

class DashboardController {

	//FIXME refatorar para usar count http://www.grails.org/doc/latest/ref/Domain%20Classes/countBy.html
    def index = {
        def modelo = [:]
        def inscritos = Inscricao.findAll()
        modelo.inscritos = inscritos.size()
        modelo.confirmados = Inscricao.findAllByConfirmado(true).size()
        modelo.recebeuKit = Inscricao.findAllByRecebeuKit(true).size()

        int desistentes = 0
        inscritos.each{
            if (it.confirmado != null & it.confirmado == false)
            {
                desistentes++
            }
        }
        modelo.desistentes = desistentes
        modelo.palestras = Palestra.buscarAprovadas()
        render(view:'index', model: modelo)
    }
}
