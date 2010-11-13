

<%@ page import="jmeetings.Inscricao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Seleção de Palestras</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="http://javaneiros.com.br">Página do Evento</a></span>
        </div>
        <div class="body">
            <h1>Seleção de Palestras</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<g:if test="${flash.errors}">
            <div class="errors">${flash.errors}</div>
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
					<ul>
						<g:each var="palestra" in="${palestras}">
							<li>
								<g:checkBox name="palestras" value="${palestra.id}" />${palestra.titulo}
							</li>
						</g:each>
					</ul>
                </div>
				<g:if test="${! (flash.sucesso || flash.errors)}">
					<div class="buttons">
						<span class="button"><g:actionSubmit class="save" action="confirmar" value="Confirmar" /></span>
					</div>
				</g:if>
            </g:form>
        </div>
    </body>
</html>
