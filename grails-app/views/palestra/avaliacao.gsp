

<%@ page import="jmeetings.Palestra" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Avaliação de Palestras</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="http://javaneiros.com.br">Página do Evento</a></span>
        </div>
        <div class="body">
            <h1>Avaliação de palestras</h1>
            <g:if test="${flash.message}">
              <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${flash.errors}">
              <div class="errors">${flash.errors}</div>
            </g:if>
            <g:hasErrors bean="${inscricao}">
              <div class="errors">
                  <g:renderErrors bean="${inscricao}" as="list" />
              </div>
            </g:hasErrors>

			<g:if test="${(!avaliacoes) && (!flash.errors)}">
				<div class="message">Você já avaliou todas as palestras. Obrigado!</div>
			</g:if>

            <g:form method="post" >
                <g:hiddenField name="id" value="${inscricao?.id}" />
                <g:hiddenField name="total" value="${total}" />

				<g:if test="${avaliacoes}">
                <div class="dialog">
                    <table>
						<thead>
						<tr>
							<th>Palestra</th>
							<th>Avaliação (de 1 a 5)</th>
							<th>Comentário</th>
						</tr>
						</thead>
						<tbody>

							<g:each var="avaliacao" status="i" in="${avaliacoes}">
								<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
									<td>${avaliacao.palestra.titulo}</td>
										<g:hiddenField name="avaliacoes[${i}].palestra.id" value="${avaliacoes[i].palestra.id}" />
										<g:hiddenField name="avaliacoes[${i}].inscricao.id" value="${avaliacoes[i].inscricao.id}" />
										<g:hiddenField name="avaliacoes[${i}].inscricao.participante.id" value="${avaliacoes[i].inscricao.participante.id}" />
									<td class="value ${hasErrors(bean: avaliacoes[i], field: 'nota', 'errors')}"><g:textField name="avaliacoes[${i}].nota" value="${avaliacoes[i].nota}"/></td>
									<td class="value ${hasErrors(bean: avaliacoes[i], field: 'comentario', 'errors')}"><g:textField size="70" name="avaliacoes[${i}].comentario" value="${avaliacoes[i].comentario}"/></td>
								</tr>
							</g:each>
						</tbody>
					</table>
                        
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="avaliar" value="${message(code: 'default.button.avaliar.label', default: 'Avaliar')}" /></span>
                </div>

				</g:if>

            </g:form>
        </div>
    </body>
</html>
