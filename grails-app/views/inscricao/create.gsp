<%@ page import="jmeetings.Inscricao" %>
<%@ page import="jmeetings.Participante" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'inscricao.label', default: 'Inscricao')}" />
  <title>Javaneiros 2010 - Inscrição</title>
  <resource:dateChooser />
</head>
<body>
  <div class="body">
    <h1>Inscrição</h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${inscricaoInstance}">
      <div class="errors">
        <g:renderErrors bean="${inscricaoInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:hasErrors bean="${inscricaoInstance.participante}">
      <div class="errors">
        <g:renderErrors bean="${inscricaoInstance.participante}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="save" >
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="evento"><g:message code="inscricao.evento.label" default="Evento" /></label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'evento', 'errors')}">
          <g:select name="evento.id" from="${jmeetings.Evento.list()}" optionKey="id" value="${inscricaoInstance?.evento?.id}"  />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="nome"><g:message code="participante.nome.label" default="Nome Completo*" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance?.participante, field: 'nome', 'errors')}">
          <g:textField name="participante.nome" value="${inscricaoInstance?.participante?.nome}" />
          </td>
          </tr>


          <tr class="prop">
            <td valign="top" class="name">
              <label for="dataNascimento"><g:message code="participante.nome.label" default="Data de Nascimento*" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance?.participante, field: 'dataNascimento', 'errors')}">
          <richui:dateChooser name="participante.dataNascimento" format="dd/MM/yyyy" value="${inscricaoInstance?.participante?.dataNascimento}"  />

          </td>
          </tr>


          <tr class="prop">
            <td valign="top" class="name">
              <label for="cpf"><g:message code="participante.cpf.label" default="CPF*" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance?.participante, field: 'cpf', 'errors')}">
          <g:textField name="participante.cpf" value="${inscricaoInstance?.participante?.cpf}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="senha"><g:message code="participante.senha.label" default="Senha*" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance?.participante, field: 'senha', 'errors')}">
              <input type="password" name="participante.senha" value="${inscricaoInstance?.participante?.senha}" />
            </td>
          </tr>


          <tr class="prop">
            <td valign="top" class="name">
              <label for="confirmacaoSenha"><g:message code="participante.confirmacaoSenha.label" default="Repita sua senha*" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance?.participante, field: 'senha', 'errors')}">
              <input type="password" name="confirmacaoSenha" value="${confirmacaoSenha}" />
            </td>
          </tr>



          <tr class="prop">
            <td valign="top" class="name">
              <label for="email"><g:message code="participante.email.label" default="Email*" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance?.participante, field: 'email', 'errors')}">
          <g:textField name="participante.email" value="${inscricaoInstance?.participante?.email}" />
          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="instituicao"><g:message code="participante.instituicao.label" default="Instituição" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance?.participante, field: 'instituicao', 'errors')}">
          <g:textField name="participante.instituicao" value="${inscricaoInstance?.participante?.instituicao}" />
          </td>
          </tr>


          <tr class="prop">
            <td valign="top" class="name">
              <label for="cidade"><g:message code="participante.cidade.label" default="Cidade" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance?.participante, field: 'cidade', 'errors')}">
          <g:textField name="participante.cidade" value="Campo Grande" />
          </td>
          </tr>



          <tr class="prop">
            <td valign="top" class="name">
              <label for="tempoExperiencia"><g:message code="inscricao.tempoExperiencia.label" default="Tempo de Experiência como profissional Java" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'tempoExperiencia', 'errors')}">
              <select name="tempoExperiencia" >
                <option value="nenhum">Nenhum</option>
                <option value="1 a 2">1 a 2 anos</option>
                <option value="3 a 5">3 a 5 anos</option>
                <option value="+5">mais de 5 anos</option>
              </select>
            </td>
          </tr>


          <tr class="prop">
            <td valign="top" class="name">
              <label for="jse"><g:message code="inscricao.jse.label" default="Conhecimento em JSE" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'jse', 'errors')}">
              <select name="jse" >
                <option value="basico">Básico</option>
                <option value="intermediario">Intermediário</option>
                <option value="avancado">Avançado</option>
              </select>
            </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="jme"><g:message code="inscricao.jme.label" default="Conhecimento em JME" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'jme', 'errors')}">
              <select name="jme" >
                <option value="basico">Básico</option>
                <option value="intermediario">Intermediário</option>
                <option value="avancado">Avançado</option>
              </select>
            </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="jee"><g:message code="inscricao.jee.label" default="Conhecimento em JEE" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'jee', 'errors')}">
              <select name="jee" >
                <option value="basico">Básico</option>
                <option value="intermediario">Intermediário</option>
                <option value="avancado">Avançado</option>
              </select>
            </td>
          </tr>



          <tr class="prop">
            <td valign="top" class="name">
              <label for="expectativas"><g:message code="inscricao.expectativas.label" default="Quais são suas expectativas para o evento?" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'expectativas', 'errors')}">
          <g:textArea name="expectativas" value="${inscricaoInstance?.expectativas}" />
          </td>
          </tr>







          <tr class="prop">
            <td valign="top" class="name">
              <label for="comoSoube"><g:message code="inscricao.comoSoube.label" default="Como soube do evento?" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: inscricaoInstance, field: 'comoSoube', 'errors')}">
          <g:textArea name="comoSoube" value="${inscricaoInstance?.comoSoube}" />
          </td>
          </tr>




          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button"><g:submitButton name="create" class="save" value="Realizar Inscrição" /></span>
      </div>
    </g:form>
  </div>
</body>
</html>
