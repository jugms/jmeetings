
<%@ page import="jmeetings.Participante" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'participante.label', default: 'Participante')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'participante.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'participante.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'participante.nome.label', default: 'Nome')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${participanteInstanceList}" status="i" var="participanteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${participanteInstance.id}">${fieldValue(bean: participanteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: participanteInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: participanteInstance, field: "nome")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${participanteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
