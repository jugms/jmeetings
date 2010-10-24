

<%@ page import="jmeetings.Palestra" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'palestra.label', default: 'Palestra')}" />
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
            <g:hasErrors bean="${palestraInstance}">
            <div class="errors">
                <g:renderErrors bean="${palestraInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${palestraInstance?.id}" />
                <g:hiddenField name="version" value="${palestraInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="aprovada"><g:message code="palestra.aprovada.label" default="Aprovada" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'aprovada', 'errors')}">
                                    <g:checkBox name="aprovada" value="${palestraInstance?.aprovada}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="celular"><g:message code="palestra.celular.label" default="Celular" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'celular', 'errors')}">
                                    <g:textField name="celular" value="${palestraInstance?.celular}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="curriculo"><g:message code="palestra.curriculo.label" default="Curriculo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'curriculo', 'errors')}">
                                    <g:textField name="curriculo" value="${palestraInstance?.curriculo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataSubmissao"><g:message code="palestra.dataSubmissao.label" default="Data Submissao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'dataSubmissao', 'errors')}">
                                    <g:textField name="dataSubmissao" value="${palestraInstance?.dataSubmissao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="palestra.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${palestraInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nivel"><g:message code="palestra.nivel.label" default="Nivel" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'nivel', 'errors')}">
                                    <g:textField name="nivel" value="${palestraInstance?.nivel}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="palestra.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${palestraInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="recursos"><g:message code="palestra.recursos.label" default="Recursos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'recursos', 'errors')}">
                                    <g:textField name="recursos" value="${palestraInstance?.recursos}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="titulo"><g:message code="palestra.titulo.label" default="Titulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'titulo', 'errors')}">
                                    <g:textField name="titulo" value="${palestraInstance?.titulo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="topicos"><g:message code="palestra.topicos.label" default="Topicos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: palestraInstance, field: 'topicos', 'errors')}">
                                    <g:textField name="topicos" value="${palestraInstance?.topicos}" />
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
