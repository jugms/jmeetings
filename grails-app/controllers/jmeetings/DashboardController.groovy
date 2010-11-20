package jmeetings

class DashboardController {

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
