class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/$controller/$action/$evento/$cpf"{
			constraints {
				// apply constraints here
			}
		}
		
		"/submeter-palestra/$nomeEvento"(controller: "palestra", action: "create")

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
