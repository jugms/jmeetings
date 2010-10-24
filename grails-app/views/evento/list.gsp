
<%@ page import="jmeetings.Evento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<resource:dateChooser />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'evento.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="dataEvento" title="${message(code: 'evento.dataEvento.label', default: 'Data Evento')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'evento.nome.label', default: 'Nome')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eventoInstanceList}" status="i" var="eventoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${eventoInstance.id}">${fieldValue(bean: eventoInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${eventoInstance.dataEvento}" format="dd/MM/yyyy" /></td>
                        
                            <td>${fieldValue(bean: eventoInstance, field: "nome")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${eventoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
