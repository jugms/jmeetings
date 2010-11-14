<%@ page import="jmeetings.Inscricao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Confirmação e Seleção de Palestras</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="http://javaneiros.com.br">Página do Evento</a></span>
        </div>
        <div class="body">
            <h1>Confirmação e votação de palestras</h1>
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
                <g:if test="${! (flash.sucesso || flash.errors)}">
                  <div class="dialog">
                      <br/><br/>
                      <h3>Você vai ao Javaneiros?</h3><br/>
                      Sim <g:radio name="confirma" value="true" checked="true"/>
                      Não <g:radio name="confirma" value="false"/>
                      <br/><br/>
                      <h3>PESQUISA de intenção</h3><br/>
                        Nos ajude a montar a grade do ${inscricaoInstance?.evento?.nome}!
                        Escolha apenas 5 palestras.
                      <br/><br/>
                        <ul>
                            <g:each var="palestra" in="${palestras}">
                                  <g:checkBox name="palestras" value="${palestra.id}" />${palestra.titulo}<br/>
                            </g:each>
                        </ul>
                  </div>
                  <div class="buttons">
                          <span class="button"><g:actionSubmit class="save" action="confirmar" value="Confirmar" /></span>
                  </div>
                </g:if>
            </g:form>
        </div>
    </body>
</html>
