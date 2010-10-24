
<%@ page import="jmeetings.Palestra" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'palestra.label', default: 'Palestra')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: palestraInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.aprovada.label" default="Aprovada" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${palestraInstance?.aprovada}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.celular.label" default="Celular" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: palestraInstance, field: "celular")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.curriculo.label" default="Curriculo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: palestraInstance, field: "curriculo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.dataSubmissao.label" default="Data Submissao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: palestraInstance, field: "dataSubmissao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: palestraInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.nivel.label" default="Nivel" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: palestraInstance, field: "nivel")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.nome.label" default="Nome" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: palestraInstance, field: "nome")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.recursos.label" default="Recursos" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: palestraInstance, field: "recursos")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.titulo.label" default="Titulo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: palestraInstance, field: "titulo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="palestra.topicos.label" default="Topicos" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: palestraInstance, field: "topicos")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${palestraInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
