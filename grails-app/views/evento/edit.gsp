

<%@ page import="jmeetings.Evento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
		<resource:dateChooser />
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
            <g:hasErrors bean="${eventoInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${eventoInstance?.id}" />
                <g:hiddenField name="version" value="${eventoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataEvento"><g:message code="evento.dataEvento.label" default="Data Evento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventoInstance, field: 'dataEvento', 'errors')}">
                                    <richui:dateChooser name="dataEvento" format="dd/MM/yyyy" value="${eventoInstance?.dataEvento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="inscricoes"><g:message code="evento.inscricoes.label" default="Inscricoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventoInstance, field: 'inscricoes', 'errors')}">
                                    
<ul>
<g:each in="${eventoInstance?.inscricoes?}" var="i">
    <li><g:link controller="inscricao" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="inscricao" action="create" params="['evento.id': eventoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'inscricao.label', default: 'Inscricao')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="evento.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventoInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${eventoInstance?.nome}" />
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
