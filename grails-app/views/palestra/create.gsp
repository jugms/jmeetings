

<%@ page import="jmeetings.Palestra" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'palestra.label', default: 'Palestra')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${palestraInstance}">
            <div class="errors">
                <g:renderErrors bean="${palestraInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
			    <fieldset>
				<legend>Seus dados</legend>

				<tr class="prop">
				    <td valign="top" class="name">
					<label for="dataSubmissao"><g:message code="palestra.dataSubmissao.label" default="Data Submissao" /></label>
				    </td>
				    <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'dataSubmissao', 'errors')}">
					<g:formatDate format="dd/MM/yyyy hh:mm:ss" date="${palestraInstance?.dataSubmissao}"/>
					
				    </td>
				</tr>


				<tr class="prop">
				    <td valign="top" class="name">
					<label for="nome">Nome:</label>
				    </td>
				    <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'nome', 'errors')}">
					<g:textField name="nome" value="${palestraInstance?.nome}" />
				    </td>
				</tr>
			    
			  
				<tr class="prop">
				    <td valign="top" class="name">
					<label for="email">e-mail</label>
				    </td>
				    <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'email', 'errors')}">
					<g:textField name="email" value="${palestraInstance?.email}" />
				    </td>
				</tr>


				<tr class="prop">
				    <td valign="top" class="name">
					<label for="celular">Celular (caso precisemos entrar em contato)</label>
				    </td>
				    <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'celular', 'errors')}">
					<g:textField name="celular" value="${palestraInstance?.celular}" />
				    </td>
				</tr>
			    
				<tr class="prop">
				    <td valign="top" class="name">
					<label for="curriculo">Curriculo resumido</label>
				    </td>
				    <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'curriculo', 'errors')}">
					<g:textArea name="curriculo" value="${palestraInstance?.curriculo}" />
				    </td>
				</tr>
                        
                        
			    </fieldset>
			    <fieldset>
				<legend>Dados da sua palestra</legend>

				<tr class="prop">
				    <td valign="top" class="name">
					<label for="titulo">Título</label>
				    </td>
				    <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'titulo', 'errors')}">
					<g:textField name="titulo" value="${palestraInstance?.titulo}" />
				    </td>
				</tr>

			    
				<tr class="prop">
				    <td valign="top" class="name">
					<label for="topicos">Topicos, descrição</label>
				    </td>
				    <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'topicos', 'errors')}">
					<g:textArea name="topicos" value="${palestraInstance?.topicos}" />
				    </td>
				</tr>


			    
				<tr class="prop">
				    <td valign="top" class="name">
					<label for="nivel">Nivel</label>
				    </td>
				    <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'nivel', 'errors')}">
					<g:radioGroup name="nivel" labels="['Iniciante', 'Intermediário', 'Avançado']" values="['iniciante', 'intermediario', 'avancado']" value="${palestraInstance?.nivel}" >
					    <p>${it.radio} ${it.label} </p>
					</g:radioGroup>
					
				    </td>
				</tr>
			    
				<tr class="prop">
				    <td valign="top" class="name">
					<label for="recursos">Do que vai prescisar?</label>
				    </td>
				    <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'recursos', 'errors')}">
					<g:textArea name="recursos" value="${palestraInstance?.recursos}" />
				    </td>
				</tr>


			  </fieldset>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
