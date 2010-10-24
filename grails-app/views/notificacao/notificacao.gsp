

<%@ page import="jmeetings.Evento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<g:javascript library="prototype" />
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
            <g:form action="notificar" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
			    <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="evento"><g:message code="inscricao.evento.label" default="Evento" /></label>
                                </td>
                                <td valign="top">
                                    <g:select name="evento.id" noSelection="${['null':'Selecione...']}"
									from="${jmeetings.Evento.list()}" optionKey="id" value="${evento?.id}"
									onchange="${remoteFunction(action:'buscarInscritos', update:'saida', params:'\'estadoSelecionado=\' + escape(this.value)')}"/>

                                </td>
                            </tr>

			    <tr class="prop">
					<td colspan="2"><span id="saida"/></td>
				</tr>



                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="assunto">Assunto</label>
                                </td>
                                <td valign="top">
                                    <g:textField name="assunto" />
                                </td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="conteudo">Texto</label>
                                </td>
                                <td valign="top">
                                    <g:textArea name="conteudo" />
                                </td>
                            </tr>

			    <tr class="prop">
				<td valign="top" class="name">Exemplos de variáveis</td>
                            
				<td valign="top" class="value">$ {inscricao.evento.nome}, $ {inscricao.participante.nome}</td>
                            
			    </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Enviar" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
