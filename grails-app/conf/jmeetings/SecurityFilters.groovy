package jmeetings

class SecurityFilters {
    def filters = {
        loginCheck(controller:'*', action:'*') {
            before = {
                if((!(controllerName == 'inscricao' && (actionName == 'create' ||actionName == 'save' ||actionName == 'confirmar')) && !session.user)
                    && controllerName != 'login'
                ){
                    redirect(controller:'login')
                }
            }

        }
    }
}