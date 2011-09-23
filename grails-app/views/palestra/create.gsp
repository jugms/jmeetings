
<%@ page import="jmeetings.Palestra" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main2">
		<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Palestra')}" />
		<title>Submeter Palestra</title>
	</head>
	<body>
		<a href="#create-pessoa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-palestra" class="content scaffold-create" role="main">
			<h1>Submeter Palestra</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${pessoaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${pessoaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<%-- <fieldset class="form"> --%>
                        
				      <fieldset>
					  <legend>Seus dados</legend>

					  <div class="fieldcontain ${hasErrors(bean: palestraInstance, field: 'dataSubmissao', 'error')} required">
						  <label for="dataSubmissao">
							  Data
						  </label>
						  <g:formatDate format="dd/MM/yyyy hh:mm:ss" date="${palestraInstance?.dataSubmissao}"/>
					  </div>


					  <div class="fieldcontain ${hasErrors(bean: palestraInstance, field: 'nome', 'error')} required">
						  <label for="nome">
							  Nome<span class="required-indicator">*</span>
						  </label>
						  <g:textField name="nome" value="${palestraInstance?.nome}" />
					  </div>

				    
					  <div class="fieldcontain ${hasErrors(bean: palestraInstance, field: 'email', 'error')} required">
						  <label for="email">
							  E-mail<span class="required-indicator">*</span>
						  </label>
						  <g:textField name="email" value="${palestraInstance?.email}" />
					  </div>

					  <div class="fieldcontain ${hasErrors(bean: palestraInstance, field: 'celular', 'error')} required">
						  <label for="celular">
							  Celular (caso precisemos entrar em contato)<span class="required-indicator">*</span>
						  </label>
						  <g:textField name="calular" value="${palestraInstance?.celular}" />
					  </div>

					  <div class="fieldcontain ${hasErrors(bean: palestraInstance, field: 'curriculo', 'error')} required">
						  <label for="curriculo">
							  Curriculo resumido<span class="required-indicator">*</span>
						  </label>
						  <g:textArea name="curriculo" value="${palestraInstance?.curriculo}" />
					  </div>
	
				  
				  
				      </fieldset>
				      <fieldset>
					  <legend>Dados da sua palestra</legend>


					  <div class="fieldcontain ${hasErrors(bean: palestraInstance, field: 'titulo', 'error')} required">
						  <label for="titulo">
							  Título<span class="required-indicator">*</span>
						  </label>
						  <g:textField name="titulo" value="${palestraInstance?.titulo}" />
					  </div>

					  <div class="fieldcontain ${hasErrors(bean: palestraInstance, field: 'topicos', 'error')} required">
						  <label for="topicos">
							  Topicos, descrição<span class="required-indicator">*</span>
						  </label>
						  <g:textArea name="topicos" value="${palestraInstance?.topicos}" />
					  </div>

					  <div class="fieldcontain ${hasErrors(bean: palestraInstance, field: 'nivel', 'error')} required">
						  <label for="nivel">
							  Nível<span class="required-indicator">*</span>
						  </label>
						  <g:radioGroup name="nivel" labels="['Iniciante', 'Intermediário', 'Avançado']" values="['iniciante', 'intermediario', 'avancado']" value="${palestraInstance?.nivel}" >
						      ${it.radio} ${it.label}
						  </g:radioGroup>
					  </div>
				      
					  <div class="fieldcontain ${hasErrors(bean: palestraInstance, field: 'recursos', 'error')} required">
						  <label for="recursos">
							  Do que vai prescisar?<span class="required-indicator">*</span>
						  </label>
						  <g:textArea name="recursos" value="${palestraInstance?.recursos}" />
					  </div>
				      

				    </fieldset>
                        
			     <%-- </fieldset> --%>
			      <fieldset class="buttons">
				      <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			      </fieldset>
			</g:form>
		</div>
	</body>
</html>