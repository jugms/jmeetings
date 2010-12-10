<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Inscrição submetida com sucesso</title>
  </head>
  <body>
    <div class="nav">
      <br/>
      <span class="menuButton"><a class="home" href="http://javaneiros.com.br">Página do Evento</a></span>
      <br/>
    </div>
    <div class="body">
      <h1>
        <br/>
        <br/>

		<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>

		Olá <strong>${inscricao.participante.nome}</strong>, recebemos sua avaliação das palestras.<br/>
		Obrigado por ajudar a realizarmos um Javaneiros 2011 ainda melhor.

        <br/>
      </h1>
    </div>

  </body>
</html>
