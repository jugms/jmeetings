package jmeetings

class MailFilters {

	def jmeetingsMailService

    def filters = {
        all(controller:'*', action:'*') {
   
            after = {
				jmeetingsMailService.disconnect()
            }

        }
    }
    
}
