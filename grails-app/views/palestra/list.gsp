
<%@ page import="jmeetings.Palestra" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'palestra.label', default: 'Palestra')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'palestra.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="aprovada" title="${message(code: 'palestra.aprovada.label', default: 'Aprovada')}" />
                        
                            <g:sortableColumn property="titulo" title="${message(code: 'palestra.titulo.label', default: 'Titulo')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'palestra.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="dataSubmissao" title="${message(code: 'palestra.dataSubmissao.label', default: 'Data Submissao')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'palestra.email.label', default: 'Email')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${palestraInstanceList}" status="i" var="palestraInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${palestraInstance.id}">${fieldValue(bean: palestraInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatBoolean boolean="${palestraInstance.aprovada}" /></td>
                        
                            <td>${fieldValue(bean: palestraInstance, field: "titulo")}</td>
                        
                            <td>${fieldValue(bean: palestraInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: palestraInstance, field: "dataSubmissao")}</td>
                        
                            <td>${fieldValue(bean: palestraInstance, field: "email")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${palestraInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
