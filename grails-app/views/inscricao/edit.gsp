

<%@ page import="jmeetings.Inscricao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'inscricao.label', default: 'Inscricao')}" />
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
            <g:hasErrors bean="${inscricaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${inscricaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${inscricaoInstance?.id}" />
                <g:hiddenField name="version" value="${inscricaoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataInscricao"><g:message code="inscricao.dataInscricao.label" default="Data Inscricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'dataInscricao', 'errors')}">
                                    <g:datePicker name="dataInscricao" precision="day" value="${inscricaoInstance?.dataInscricao}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="evento"><g:message code="inscricao.evento.label" default="Evento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'evento', 'errors')}">
                                    <g:select name="evento.id" from="${jmeetings.Evento.list()}" optionKey="id" value="${inscricaoInstance?.evento?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fezCheckin"><g:message code="inscricao.fezCheckin.label" default="Fez Checkin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'fezCheckin', 'errors')}">
                                    <g:checkBox name="fezCheckin" value="${inscricaoInstance?.fezCheckin}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="recebeuKit"><g:message code="inscricao.recebeuKit.label" default="Recebeu Kit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'recebeuKit', 'errors')}">
                                    <g:checkBox name="recebeuKit" value="${inscricaoInstance?.recebeuKit}" />
                                </td>
                            </tr>

                             <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="recebeuKit"><g:message code="inscricao.sorteado.label" default="Sorteado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'sorteado', 'errors')}">
                                    <g:checkBox name="sorteado" value="${inscricaoInstance?.sorteado}" />
                                </td>
                            </tr>

                             <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="recebeuKit"><g:message code="inscricao.premiado.label" default="Premiado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'premiado', 'errors')}">
                                    <g:checkBox name="premiado" value="${inscricaoInstance?.premiado}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="participante"><g:message code="inscricao.participante.label" default="Participante" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'participante', 'errors')}">
                                    <g:select name="participante.id" from="${jmeetings.Participante.list()}" optionKey="id" value="${inscricaoInstance?.participante?.id}"  />
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
