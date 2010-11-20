package jmeetings

class DashboardController {

    def index = {
        def modelo = [:]
        modelo.inscritos = Inscricao.count()
        modelo.confirmados = Inscricao.findAllByConfirmado(true).size()
        modelo.recebeuKit = Inscricao.findAllByRecebeuKit(true).size()
        render(view:'index', model: modelo)
    }
}
