

<%@ page import="jmeetings.Participante" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'participante.label', default: 'Participante')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${participanteInstance}">
            <div class="errors">
                <g:renderErrors bean="${participanteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${participanteInstance?.id}" />
                <g:hiddenField name="version" value="${participanteInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="participante.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: participanteInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${participanteInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="inscricoes"><g:message code="participante.inscricoes.label" default="Inscricoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: participanteInstance, field: 'inscricoes', 'errors')}">
                                    
<ul>
<g:each in="${participanteInstance?.inscricoes?}" var="i">
    <li><g:link controller="inscricao" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="inscricao" action="create" params="['participante.id': participanteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'inscricao.label', default: 'Inscricao')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="participante.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: participanteInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${participanteInstance?.nome}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
