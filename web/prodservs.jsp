<%-- 
    Document   : prodservs
    Created on : 22/05/2020, 17:01:11
    Author     : Edgard Oliveira
--%>

<%@page import="model.beans.Prodserv"%>
<%@page import="model.dao.ProdservDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>LAVA JATO</title>
        <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
        <link rel="icon" href="assets/img/lavajato.ico" type="image/x-ico"/>

        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {"families": ["Lato:300,400,700,900"]},
                custom: {"families": ["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['assets/css/fonts.min.css']},
                active: function () {
                    sessionStorage.fonts = true;
                }
            });
        </script>

        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/atlantis.min.css" rel="stylesheet" type="text/css"/>
        <!-- CSS Just for demo purpose, don't include it in your project
        <link rel="stylesheet" href="assets/css/demo.css">-->
    </head>
    <body>
        <div class="wrapper">
            <div class="main-header">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="blue">

                    <a href="index.jsp" class="logo">
                        <img src="assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
                    </a>
                    <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon">
                            <i class="icon-menu"></i>
                        </span>
                    </button>
                    <button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="icon-menu"></i>
                        </button>
                    </div>
                </div>
                <!-- End Logo Header -->

                <!-- Navbar Header -->
                <nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">

                </nav>
                <!-- End Navbar -->
            </div>

            <!-- Sidebar -->
            <div class="sidebar sidebar-style-2">
                <div class="sidebar-wrapper scrollbar scrollbar-inner">
                    <div class="sidebar-content">
                        <ul class="nav nav-primary">
                            <li class="nav-section">
                                <span class="sidebar-mini-icon">
                                    <i class="fa fa-ellipsis-h"></i>
                                </span>
                                <h4 class="text-section">Opções</h4>
                            </li>
                            <li class="nav-item">
                                <a href="index.jsp">
                                    <i class="fas fa-home"></i>
                                    <p>Início</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="clientes.jsp">
                                    <i class="fas fa-users"></i>
                                    <p>Clientes</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="funcionarios.jsp">
                                    <i class="fas fa-id-card-alt"></i>
                                    <p>Funcionários</p>
                                </a>
                            </li>
                            <li class="nav-item active">
                                <a href="prodservs.jsp">
                                    <i class="fas fas fa-boxes"></i>
                                    <p>Produtos e Serviços</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="vendas.jsp">
                                    <i class="fas fas fa-money-check-alt"></i>
                                    <p>Vendas</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End Sidebar -->

            <div class="main-panel">
                <div class="content">
                    <div class="panel-header bg-primary-gradient">
                        <div class="page-inner py-5">
                            <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                                <div>
                                    <h2 class="text-white pb-2 fw-bold">Produtos e Serviços</h2>
                                    <h5 class="text-white op-7 mb-2">Gerenciamento de produtos e serviços</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="d-flex align-items-center">
                                            <h4 class="card-title">Lista de produtos e serviços</h4>
                                            <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                                                <i class="fa fa-plus"></i>
                                                Cadastrar
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <!-- Modal -->
                                        <div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header no-bd">
                                                        <h5 class="modal-title">
                                                            <span class="fw-mediumbold">
                                                                Produtos e Serviços</span>
                                                        </h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p class="small">Cadastre um novo produto ou serviço</p>
                                                        <form action="ProdservController?operacao=cadastrar" method="POST">                                                       
                                                            <div class="form-group">
                                                                <label for="txtDescricao">Descricao</label>
                                                                <input type="text" class="form-control" id="txtDescricao" name="txtDescricao" maxlength="50" required placeholder="Informe a descrição do produto ou serviço">
                                                                <small id="nomeHelp" class="form-text text-muted">*campo nome obrigatório</small>
                                                            </div>
                                                            <div class="form-check">
                                                                <label>Tipo</label><br/>
                                                                <label class="form-radio-label">
                                                                    <input class="form-radio-input" type="radio" id="radTipo" name="radTipo" value="S"  checked="true">
                                                                    <span class="form-radio-sign">Serviço</span>
                                                                </label>
                                                                <label class="form-radio-label ml-3">
                                                                    <input class="form-radio-input" type="radio" id="radTipo" name="radTipo" value="P">
                                                                    <span class="form-radio-sign">Produto</span>
                                                                </label>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="txtPrecoCusto">Preço de Custo</label>
                                                                <input type="number" class="form-control" id="txtPrecoCusto" name="txtPrecoCusto" required placeholder="Informe o preço de custo" min="0" value="0" step="any">
                                                                <small id="precoCustoHelp" class="form-text text-muted">*campo preço de custo obrigatório</small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="txtPrecoVenda">Preço de Venda</label>
                                                                <input type="number" class="form-control" id="txtPrecoVenda" name="txtPrecoVenda" required placeholder="Informe o preço de venda" min="0" value="0" step="any">
                                                                <small id="precoVendaHelp" class="form-text text-muted">*campo preço de venda obrigatório</small>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="txtQuantEstoque">Quantidade em estoque</label>
                                                                <input type="number" class="form-control" id="txtQuantEstoque" name="txtQuantEstoque" required placeholder="Informe a quantidade em estoque">
                                                                <small id="quantidadeEstoqueHelp" class="form-text text-muted">*campo quantidade em estoque obrigatório</small>
                                                            </div>
                                                            <div class="modal-footer no-bd">
                                                                <button type="submit" id="addRowButton" class="btn btn-primary">Enviar</button>
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- fim modal add -->
                                        <div class="table-responsive">
                                            <table id="add-row" class="display table table-striped table-hover" >
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Descrição</th>
                                                        <th>Tipo</th>
                                                        <th>Preço de Custo</th>
                                                        <th>Preço de Venda</th>
                                                        <th>Quantidade em estoque</th>
                                                        <th class="text-center" style="width: 10%">Ações</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Descrição</th>
                                                        <th>Tipo</th>
                                                        <th>Preço de Custo</th>
                                                        <th>Preço de Venda</th>
                                                        <th>Quantidade em estoque</th>
                                                        <th class="text-center" style="width: 10% ">Ações</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <%
                                                        ArrayList<Prodserv> listaProdservs = (ArrayList<Prodserv>) session.getAttribute("prodservs");
                                                        if (listaProdservs != null) {
                                                            //faz mais nada
                                                        } else {
                                                            ProdservDAO prodservDAO = new ProdservDAO();
                                                            listaProdservs = (ArrayList<Prodserv>) prodservDAO.listar();
                                                        }

                                                        for (Prodserv prodserv : listaProdservs) {
                                                    %>
                                                    <tr>
                                                        <td><%=prodserv.getProId()%></td>
                                                        <td><%=prodserv.getProDescricao()%></td>
                                                        <td><%=prodserv.getProTipo()%></td>
                                                        <td><%=prodserv.getProPrecoCusto()%></td>
                                                        <td><%=prodserv.getProPrecoVenda()%></td>
                                                        <td><%=prodserv.getProQuantEstoque()%></td>
                                                        <td>
                                                            <div class="form-button-action">
                                                                <a href="alterarProdServ.jsp?id=<%=prodserv.getProId()%>" 
                                                                   data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Editar">
                                                                    <i class="fa fa-edit"></i>
                                                                </a>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                                <a href="ProdservController?operacao=excluir&id=<%=prodserv.getProId()%>"
                                                                   data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Excluir">
                                                                    <i class="fa fa-times"></i>
                                                                </a>  
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        Edgard Oliveira
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>
                </footer>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery.3.2.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- jQuery UI -->
        <script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
        <script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

        <!-- Chart JS -->
        <script src="assets/js/plugin/chart.js/chart.min.js"></script>

        <!-- jQuery Sparkline -->
        <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

        <!-- Chart Circle -->
        <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>

        <!-- Bootstrap Notify -->
        <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

        <!-- jQuery Vector Maps -->
        <script src="assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
        <script src="assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

        <!-- Sweet Alert -->
        <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

        <!-- Atlantis JS -->
        <script src="assets/js/atlantis.min.js"></script>

        <script >
            $(document).ready(function () {
                $('#basic-datatables').DataTable({
                });

                $('#multi-filter-select').DataTable({
                    "pageLength": 15,
                    initComplete: function () {
                        this.api().columns().every(function () {
                            var column = this;
                            var select = $('<select class="form-control"><option value=""></option></select>')
                                    .appendTo($(column.footer()).empty())
                                    .on('change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex(
                                                $(this).val()
                                                );

                                        column
                                                .search(val ? '^' + val + '$' : '', true, false)
                                                .draw();
                                    });

                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>')
                            });
                        });
                    }
                });

                // Add Row
                $('#add-row').DataTable({
                    "pageLength": 15,
                });

                var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Editar"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Excluir"> <i class="fa fa-times"></i> </button> </div> </td>';

                $('#addRowButton').click(function () {
                    $('#addRowModal').modal('hide');
                    $('displayNotify').click();
                });
            });

            $('#displayNotif').on('click', function () {

                var placementFrom = 'top';
                var placementAlign = 'right';
                var state = 'sucess';
                var style = 'withicon';
                var content = {};

                content.message = 'Cadastrado com sucesso';
                content.title = 'Produto ou Serviço';
                if (style == "withicon") {
                    content.icon = 'fa fa-check';
                } else {
                    content.icon = 'none';
                }
                content.url = 'prodservs.jsp';
                content.target = '_blank';

                $.notify(content, {
                    type: state,
                    placement: {
                        from: placementFrom,
                        align: placementAlign
                    },
                    time: 1000,
                    delay: 0,
                });
                //document.location.href = "prodservs.jsp";
            });
        </script>
    </body>
</html>
