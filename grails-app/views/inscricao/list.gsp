
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
	<div id="message">
		<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>
	</div>
	<g:hasErrors bean="${inscricaoInstance?.participante}">
      <div class="errors">
        <g:renderErrors bean="${inscricaoInstance?.participante}" as="list" />
      </div>
    </g:hasErrors>
	<g:form action="inscricaoSimples" >
		<div class="dialog">
			<table>
				<tbody>
					<tr class="prop">
						<td valign="top" class="name">
							<label for="filtro">Nome</label>
						</td>
						<td valign="top" class="value nome">
							<g:textField name="participante.nome" value="${inscricaoInstance?.participante?.nome}"/>
						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name">
							<label for="filtro">Email</label>
						</td>
						<td valign="top" class="value email">
							<g:textField name="participante.email" value="${inscricaoInstance?.participante?.email}"/>
						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name">
							<g:submitButton name="inscricao" value="Inscrição"/>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
	</g:form>
	<hr/>
	<g:form action="buscar" >
		<div class="dialog">
			<table>
				<tbody>
					<tr class="prop">
						<td valign="top" class="name">
							<label for="filtro">Nome ou e-mail</label>
						</td>
						<td valign="top" class="value filtro">
							<g:textField name="filtro" value="${filtro}"/> &nbsp;&nbsp;<g:submitButton name="buscar" value="Buscar" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</g:form>
	

    <div class="list">
      <table>
        <thead>
          <tr>

        <g:sortableColumn property="id" title="${message(code: 'inscricao.id.label', default: 'Id')}" />

        <g:sortableColumn property="participante.nome" title="${message(code: 'inscricao.participante.nome.label', default: 'Participante')}" />

        <g:sortableColumn property="participante.email" title="${message(code: 'inscricao.participante.email.label', default: 'Email')}" />

        <g:sortableColumn property="participante.instituicao" title="${message(code: 'inscricao.participante.instituicao.label', default: 'Instituicao')}" />

        <g:sortableColumn property="participante.cidade" title="${message(code: 'inscricao.participante.cidade.label', default: 'Cidade')}" />

				<g:sortableColumn property="fezCheckin" title="${message(code: 'fezCheckin.label', default: 'Fez Checkin?')}" />
        
				<g:sortableColumn property="recebeuKit" title="${message(code: 'recebeuKit.label', default: 'Recebeu Kit?')}" />
                                <g:sortableColumn property="confirmado" title="${message(code: 'confirmado.label', default: 'Confirmado?')}" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${inscricaoInstanceList}" status="i" var="inscricaoInstance">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

            <td><g:link action="show" id="${inscricaoInstance.id}">${fieldValue(bean: inscricaoInstance, field: "id")}</g:link></td>

          <td>${fieldValue(bean: inscricaoInstance, field: "participante")}</td>

          <td>${fieldValue(bean: inscricaoInstance?.participante, field: "email")}</td>

          <td>${fieldValue(bean: inscricaoInstance?.participante, field: "instituicao")}</td>

          <td>${fieldValue(bean: inscricaoInstance?.participante, field: "cidade")}</td>

          <td> 	
						<g:if test="${inscricaoInstance.fezCheckin}">Sim</g:if>
						<g:else><g:link action="checkin" id="${inscricaoInstance.id}" params="[filtro:filtro]">Checkin</g:link></g:else>
				  </td>
				<td> 	
					<g:if test="${inscricaoInstance.recebeuKit}">Sim</g:if>
					<g:else><g:link action="receberKit" id="${inscricaoInstance.id}" params="[filtro:filtro]">Receber kit</g:link></g:else>
				  </td>
                                 <td>
					<g:if test="${inscricaoInstance.confirmado}">Sim</g:if>
                                        <g:if test="${inscricaoInstance.confirmado == null}">Não Respondeu</g:if>
                                        <g:if test="${inscricaoInstance.confirmado == false}">Não</g:if>
                                        
				  </td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate total="${inscricaoInstanceTotal}" />
    </div>

	Total de inscritos: ${Inscricao.count()}<br/>
	Total de checkins:  ${Inscricao.countByFezCheckin(true)}
  </div>
</body>
</html>
