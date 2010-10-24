package jmeetings

class LoginController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        render(view: "login")
    }

	def logar = {

		if(params.login == "admin" && params.senha == "hadouken"){
			flash.message = "Bem vindo admin"
			session.user = "admin"
			redirect(uri: "/")
		}
		else{
			flash.message = "Falha na autenticação"
			render(view: "login")
		}
	}

	def logout = {
		session.user = null
		flash.message = "logout efetuado com sucesso"
		redirect(uri: "/")
	}

} 
