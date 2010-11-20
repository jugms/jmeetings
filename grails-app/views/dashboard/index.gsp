<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Dashboard</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="http://javaneiros.com.br">Página do Evento</a></span>
        </div>
        <div class="body">
            <h1>Dashboard</h1>
            <g:form method="post" >
                  <div class="dialog">
                      <br/>TOTAL de Inscritos............: ${inscritos}
                      <br/>TOTAL de Confirmados......: ${confirmados}
                      <br/>TOTAL de Desistentes........: ${desistentes}
                      <br/>

                      <br/>TOTAL de Pagaram Kit(camiseta).......: ${recebeuKit}
                      <br/>
                      <br/>
                      Votação das palestras
                      <ul>
                            <g:each var="palestra" in="${palestras}">
                                 ${palestra.inscricoes.size()} - ${palestra.titulo} - ${palestra.nome}<br/>
                            </g:each>
                      </ul>
                  </div>
            </g:form>
        </div>
    </body>
</html>
