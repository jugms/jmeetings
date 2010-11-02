package jmeetings

class LoginController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        render(view: "login")
    }

    def logar = {
        if(params.email && params.senha){
            def user = Participante.autenticar(params.email,params.senha);
            if (user == null)
            {
                flash.message = "Falha na autenticação: email e/ou senha inválido"
                render(view: "login")
            }
            else{
                flash.message = "Bem vindo" + user.nome
                session.user = user.nome
                redirect(uri: "/")
            }
        }
        else{
            flash.message = "Informe Email e Senha"
            render(view: "login")
        }
    }

    def logout = {
        session.user = null
        flash.message = "logout efetuado com sucesso"
        redirect(uri: "/")
    }

} 
