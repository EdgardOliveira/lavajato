<%-- 
    Document   : alterarProdServ
    Created on : 27/05/2020, 16:57:32
    Author     : Edgard Oliveira
--%>

<%@page import="model.beans.Prodserv"%>
<%@page import="model.dao.ProdservDAO"%>
<%@page import="model.beans.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LAVA JATO</title>

        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/atlantis.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <h1>Produtos e Serviços</h1>
        <h3>Alteração de cadastro</h3>
        <div class="col-md-3">
            <%
                ProdservDAO prodservDAO = new ProdservDAO();
                int id = Integer.parseInt(request.getParameter("id"));
                Prodserv prodserv = prodservDAO.consultarId(id);
            %>
            <form action="ProdservController?operacao=atualizar&id=<%=prodserv.getProId()%>" method="POST">
                <div class="form-group">
                    <label for="txtId">Id</label>
                    <input type="text" readonly class="form-control" id="txtId" name="txtId" maxlength="5" value="<%=prodserv.getProId()%>"
                           aria-describedby="idHelp" placeholder="Informe o id do produto/serviço">
                    <small id="idHelp" class="form-text text-muted">*o campo id é automático.</small>
                </div>
                <div class="form-group">
                    <label for="txtDescricao">Descricao</label>
                    <input type="text" class="form-control" id="txtDescricao" name="txtDescricao" required maxlength="50" value="<%=prodserv.getProDescricao()%>" placeholder="Informe a descrição do produto ou serviço">
                    <small id="nomeHelp" class="form-text text-muted">*campo nome obrigatório</small>
                </div>
                <div class="form-check">
                    <label>Tipo</label><br/>
                    <label class="form-radio-label">
                        <input class="form-radio-input" type="radio" id="radTipo" name="radTipo" required value="S"  checked="true">
                        <span class="form-radio-sign">Serviço</span>
                    </label>
                    <label class="form-radio-label ml-3">
                        <input class="form-radio-input" type="radio" id="radTipo" name="radTipo" required value="P">
                        <span class="form-radio-sign">Produto</span>
                    </label>
                </div>
                <div class="form-group">
                    <label for="txtPrecoCusto">Preço de Custo</label>
                    <input type="number" class="form-control" id="txtPrecoCusto" name="txtPrecoCusto" required value="<%=prodserv.getProPrecoCusto()%>" placeholder="Informe o preço de custo" min="0" value="0" step="any">
                    <small id="precoCustoHelp" class="form-text text-muted">*campo preço de custo obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtPrecoVenda">Preço de Venda</label>
                    <input type="number" class="form-control" id="txtPrecoVenda" name="txtPrecoVenda" required value="<%=prodserv.getProPrecoVenda()%>" placeholder="Informe o preço de venda" min="0" value="0" step="any">
                    <small id="precoVendaHelp" class="form-text text-muted">*campo preço de venda obrigatório</small>
                </div>
                <div class="form-group">
                    <label for="txtQuantEstoque">Quantidade em estoque</label>
                    <input type="number" class="form-control" id="txtQuantEstoque" name="txtQuantEstoque" required value="<%=prodserv.getProQuantEstoque()%>" placeholder="Informe a quantidade em estoque">
                    <small id="quantidadeEstoqueHelp" class="form-text text-muted">*campo quantidade em estoque obrigatório</small>
                </div>
                <br>
                <div class="form-group">
                    <button type="submit" class="btn btn-warning">Alterar</button>
                </div>
            </form>
        </div>
    </body>
</html>