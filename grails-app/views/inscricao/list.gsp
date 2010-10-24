
<%@ page import="jmeetings.Inscricao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'inscricao.label', default: 'Inscricao')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'inscricao.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="dataInscricao" title="${message(code: 'inscricao.dataInscricao.label', default: 'Data Inscricao')}" />
                        
                            <th><g:message code="inscricao.evento.label" default="Evento" /></th>
                        
                            <g:sortableColumn property="fezCheckin" title="${message(code: 'inscricao.fezCheckin.label', default: 'Fez Checkin')}" />
                        
                            <th><g:message code="inscricao.participante.label" default="Participante" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inscricaoInstanceList}" status="i" var="inscricaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${inscricaoInstance.id}">${fieldValue(bean: inscricaoInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${inscricaoInstance.dataInscricao}" format="dd/MM/yyyy"/></td>
                        
                            <td>${fieldValue(bean: inscricaoInstance, field: "evento")}</td>
                        
                            <td><g:formatBoolean boolean="${inscricaoInstance.fezCheckin}" /></td>
                        
                            <td>${fieldValue(bean: inscricaoInstance, field: "participante")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${inscricaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
