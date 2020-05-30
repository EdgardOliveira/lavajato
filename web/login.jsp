<%-- 
    Document   : login3
    Created on : 28/05/2020, 20:08:04
    Author     : Edgard Oliveira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LAVA JATO</title>
        <link href="assets/css/atlantis.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <div class="d-flex justify-content-center align-items-center" style="height:100px;">
            <form class="text-center border border-light p-5" action="LoginController" method="POST">
                <p class="h4 mb-4">Identifique-se!</p>
                <input type="text" id="txtUsuario" name="txtUsuario" required class="form-control mb-4" maxlength="30" required placeholder="Informe seu usuário...">
                <input type="password" id="txtSenha" name="txtSenha" required class="form-control mb-4" maxlength="30" required placeholder="Informe sua senha...">
                <button class="btn btn-info btn-block my-4" type="submit">Verificar</button>
            </form>
        </div>
    </body>
</html>
