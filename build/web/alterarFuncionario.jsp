<%-- 
    Document   : alterarFuncionario
    Created on : 27/05/2020, 16:28:09
    Author     : Edgard Oliveira
--%>

<%@page import="model.beans.Funcionario"%>
<%@page import="model.dao.FuncionarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LAVA JATO</title>

        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/atlantis.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <h1>Funcionário</h1>
        <h3>Alteração de cadastro</h3>
        <div class="col-md-3">
            <%
                FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
                int id = Integer.parseInt(request.getParameter("id"));
                Funcionario funcionario = funcionarioDAO.consultarId(id);
            %>
            <form action="FuncionarioController?operacao=atualizar&id=<%=funcionario.getFunId()%>" method="POST">
                <div class="form-group">
                    <label for="txtId">Id</label>
                    <input type="text" readonly class="form-control" id="txtId" maxlength="5" name="txtId" required value="<%=funcionario.getFunId()%>"
                           aria-describedby="idHelp" placeholder="Informe o id do funcionário">
                    <small id="idHelp" class="form-text text-muted">*o campo id é automático.</small>
                </div>
                <div class="form-group">
                    <label for="txtNome">Nome</label>
                    <input type="text" class="form-control" id="txtNome" name="txtNome" maxlength="60" required value="<%=funcionario.getFunNome()%>" placeholder="Informe o nome do funcionário">
                    <small id="nomeHelp" class="form-text text-muted">*campo nome obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtUsuario">Usuário</label>
                    <input type="text" class="form-control" id="txtUsuario" name="txtUsuario" maxlength="30" required value="<%=funcionario.getFunUsuario()%>" placeholder="Informe o usuário do funcionário">
                    <small id="usuarioHelp" class="form-text text-muted">*campo usuario obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtSenha">Senha</label>
                    <input type="password" class="form-control" id="txtSenha" name="txtSenha" maxlength="30" required value="<%=funcionario.getFunSenha()%>"  placeholder="Informe a senha do funcionário">
                    <small id="celularHelp" class="form-text text-muted">*campo celular obrigatório</small>
                </div>                
                <br>
                <div class="form-group">
                    <button type="submit" class="btn btn-warning">Alterar</button>
                </div>
            </form>
        </div>
    </body>
</html>
