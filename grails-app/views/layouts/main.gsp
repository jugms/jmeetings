<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
		<resource:reflectionImage />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="javaneirosLogo">
			<a href="http://www.javaneiros.com.br">
				<!-- se for chrome tem que deixar essa de cima -->
				<img src="${resource(dir:'images',file:'logo-javaneiros.png')}" alt="Javaneiros 2010" border="0" />
				<!--
				<richui:reflectionImage src="${createLinkTo('dir': 'images', file: 'logo-javaneiros.png')}" border="0" alt="Javaneiros 2010"/>
				-->
			</a>
		</div>
        <g:layoutBody />
    </body>
</html>