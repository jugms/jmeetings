<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Login</title>
    </head>
    <body>
        <div class="body">
            <h1>Login</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="logar" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="login">login</label>
                                </td>
                                <td valign="top">
                                    <g:textField name="login"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="senha">senha</label>
                                </td>
                                <td valign="top">
                                    <g:passwordField name="senha"/>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="logar" value="Logar" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
