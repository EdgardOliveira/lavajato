<%-- 
    Document   : alterarCliente
    Created on : 27/05/2020, 16:00:24
    Author     : Edgard Oliveira
--%>

<%@page import="model.beans.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html">
        <title>LAVA JATO</title>

        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/atlantis.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <h1>Cliente</h1>
        <h3>Alteração de cadastro</h3>
        <div class="col-md-3">
            <%
                ClienteDAO clienteDAO = new ClienteDAO();
                int id = Integer.parseInt(request.getParameter("id"));
                Cliente cliente = clienteDAO.consultarId(id);
            %>
            <form action="ClienteController?operacao=atualizar&id=<%=cliente.getCliId()%>" method="POST">
                <div class="form-group">
                    <label for="txtId">Id</label>
                    <input type="text" readonly class="form-control" id="txtId" name="txtId" maxlength="5" value="<%=cliente.getCliId()%>"
                           aria-describedby="idHelp" placeholder="Informe o id do cliente">
                    <small id="idHelp" class="form-text text-muted">*o campo id é automático.</small>
                </div>
                <div class="form-group">
                    <label for="txtNome">Nome</label>
                    <input type="text" class="form-control" id="txtNome" name="txtNome"  maxlength="60" value="<%=cliente.getCliNome()%>" required placeholder="Informe o nome do cliente">
                    <small id="nomeHelp" class="form-text text-muted">*campo nome obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtCpf">CPF</label>
                    <input type="text" class="form-control" id="txtCpf" name="txtCpf" maxlength="11" value="<%=cliente.getCliCpf()%>" required placeholder="Informe o cpf do cliente">
                    <small id="cpfHelp" class="form-text text-muted">*campo cpf obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtCelular">Celular</label>
                    <input type="text" class="form-control" id="txtCelular" name="txtCelular" maxlength="11" value="<%=cliente.getCliCelular()%>"  required placeholder="Informe o celular do cliente">
                    <small id="celularHelp" class="form-text text-muted">*campo celular obrigatório</small>
                </div>                
                <div class="form-group">
                    <label for="txtPlaca">Placa</label>
                    <input type="text" class="form-control" id="txtPlaca" name="txtPlaca" maxlength="7" value="<%=cliente.getCliPlaca()%>"  required placeholder="Informe a placa do veículo do cliente">
                    <small id="placaHelp" class="form-text text-muted">*campo placa obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtMarca">Marca</label>
                    <input type="text" class="form-control" id="txtMarca" name="txtMarca" maxlength="20" value="<%=cliente.getCliMarca()%>" required placeholder="Informe a marca do veículo do cliente">
                    <small id="marcaHelp" class="form-text text-muted">*campo marca obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtModelo">Modelo</label>
                    <input type="text" class="form-control" id="txtModelo" name="txtModelo" maxlength="30" value="<%=cliente.getCliModelo()%>" required placeholder="Informe o modelo do veículo do cliente">
                    <small id="modeloHelp" class="form-text text-muted">*campo modelo obrigatório</small>
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <label for="txtCor">Cor</label>
                        <input type="text" class="form-control" id="txtCor" name="txtCor" maxlength="20" value="<%=cliente.getCliCor()%>" required placeholder="Informe a cor do veículo do cliente">
                        <small id="corHelp" class="form-text text-muted">*campo cor obrigatório</small>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <button type="submit" class="btn btn-warning">Alterar</button>
                </div>
            </form>
        </div>
    </body>
</html>
