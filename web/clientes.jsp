<%-- 
    Document   : clientes
    Created on : 22/05/2020, 16:07:11
    Author     : Edgard Oliveira
--%>

<%@page import="model.beans.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
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
                            <li class="nav-item active">
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
                            <li class="nav-item">
                                <a href="prodservs.jsp">
                                    <i class="fas fas fa-boxes"></i>
                                    <p>Produtos e Serviços</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a data-toggle="collapse" href="#vendas">
                                    <i class="fas fa-money-check-alt"></i>
                                    <p>Vendas</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="vendas">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="identifCliente.jsp">
                                                <span class="sub-item">Identificar cliente</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="prevenda.jsp">
                                                <span class="sub-item">Pré-venda</span>
                                            </a>
                                        </li>                                        <li>
                                            <a href="vendas.jsp">
                                                <span class="sub-item">Vendas</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
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
                                    <h2 class="text-white pb-2 fw-bold">Clientes</h2>
                                    <h5 class="text-white op-7 mb-2">Gerenciamento de clientes</h5>
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
                                            <h4 class="card-title">Lista e clientes</h4>
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
                                                                Cliente</span>
                                                        </h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p class="small">Cadastre um novo cliente</p>
                                                        <form action="ClienteController?operacao=cadastrar" method="POST">                                                       
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtNome">Nome</label>
                                                                    <input type="text" class="form-control" id="txtNome" name="txtNome" maxlength="60" required placeholder="Informe o nome do cliente">
                                                                    <small id="nomeHelp" class="form-text text-muted">*campo nome obrigatório</small>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtCpf">CPF</label>
                                                                    <input type="text" class="form-control" id="txtCpf" name="txtCpf" maxlength="11" required placeholder="Informe o cpf do cliente">
                                                                    <small id="cpfHelp" class="form-text text-muted">*campo cpf obrigatório</small>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtCelular">Celular</label>
                                                                    <input type="text" class="form-control" id="txtCelular" name="txtCelular" maxlength="11" required placeholder="Informe o celular do cliente">
                                                                    <small id="celularHelp" class="form-text text-muted">*campo celular obrigatório</small>
                                                                </div>
                                                            </div>                                                            
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtPlaca">Placa</label>
                                                                    <input type="text" class="form-control" id="txtPlaca" name="txtPlaca" maxlength="7" required placeholder="Informe a placa do veículo do cliente">
                                                                    <small id="placaHelp" class="form-text text-muted">*campo placa obrigatório</small>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtMarca">Marca</label>
                                                                    <input type="text" class="form-control" id="txtMarca" name="txtMarca" maxlength="20" required placeholder="Informe a marca do veículo do cliente">
                                                                    <small id="marcaHelp" class="form-text text-muted">*campo marca obrigatório</small>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtModelo">Modelo</label>
                                                                    <input type="text" class="form-control" id="txtModelo" name="txtModelo" maxlength="30" required placeholder="Informe o modelo do veículo do cliente">
                                                                    <small id="modeloHelp" class="form-text text-muted">*campo modelo obrigatório</small>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtCor">Cor</label>
                                                                    <input type="text" class="form-control" id="txtCor" name="txtCor" maxlength="20" required placeholder="Informe a cor do veículo do cliente">
                                                                    <small id="corHelp" class="form-text text-muted">*campo cor obrigatório</small>
                                                                </div>
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
                                                        <th>Nome</th>
                                                        <th>Cpf</th>
                                                        <th>Celular</th>
                                                        <th>Placa</th>
                                                        <th>Marca</th>
                                                        <th>Modelo</th>
                                                        <th>Cor</th>
                                                        <th class="text-center" style="width: 10%">Ações</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Nome</th>
                                                        <th>Cpf</th>
                                                        <th>Celular</th>
                                                        <th>Placa</th>
                                                        <th>Marca</th>
                                                        <th>Modelo</th>
                                                        <th>Cor</th>
                                                        <th class="text-center" style="width: 10% ">Ações</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <%
                                                        ArrayList<Cliente> listaClientes = (ArrayList<Cliente>) session.getAttribute("clientes");
                                                        if (listaClientes != null) {
                                                            //faz mais nada
                                                        } else {
                                                            ClienteDAO clienteDAO = new ClienteDAO();
                                                            listaClientes = (ArrayList<Cliente>) clienteDAO.listar();
                                                        }

                                                        for (Cliente cliente : listaClientes) {
                                                    %>
                                                    <tr>
                                                        <td><%=cliente.getCliId()%></td>
                                                        <td><%=cliente.getCliNome()%></td>
                                                        <td><%=cliente.getCliCpf()%></td>
                                                        <td><%=cliente.getCliCelular()%></td>
                                                        <td><%=cliente.getCliPlaca()%></td>
                                                        <td><%=cliente.getCliMarca()%></td>
                                                        <td><%=cliente.getCliModelo()%></td>
                                                        <td><%=cliente.getCliCor()%></td>
                                                        <td>
                                                            <div class="form-button-action">
                                                                <a href="alterarCliente.jsp?id=<%=cliente.getCliId()%>" 
                                                                   data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Editar">
                                                                    <i class="fa fa-edit"></i>
                                                                </a>

                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                                <a href="ClienteController?operacao=excluir&id=<%=cliente.getCliId()%>" 
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
                    "pageLength": 10,
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
                    "pageLength": 10,
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
                content.title = 'Cliente';
                if (style == "withicon") {
                    content.icon = 'fa fa-check';
                } else {
                    content.icon = 'none';
                }
                content.url = 'funcionarios.jsp';
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
                //document.location.href = "clientes.jsp";
            });
        </script>
    </body>
</html>
