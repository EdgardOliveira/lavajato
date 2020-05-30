<%-- 
    Document   : buscarPlaca
    Created on : 25/05/2020, 16:50:15
    Author     : Edgard Oliveira
--%>

<%@page import="model.dao.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.beans.Cliente"%>
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
                            <li class="nav-item">
                                <a href="prodservs.jsp">
                                    <i class="fas fas fa-boxes"></i>
                                    <p>Produtos e Serviços</p>
                                </a>
                            </li>
                            <li class="nav-item active">
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
                                    <h2 class="text-white pb-2 fw-bold">Pré-venda</h2>
                                    <h5 class="text-white op-7 mb-2">Iniciar o atendimento do cliente</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="page-inner mt--5">
                        <div class="row">
                            <div class="col-sm-6 col-md-2">
                                <div class="card card-stats card-round">
                                    <div class="card-body ">
                                        <div class="row">
                                            <form class="form-inline" action="BuscarPlacaController" method="POST">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="txtPlaca" name="txtPlaca" maxlength="7" placeholder="Informe a placa...">
                                                </div>
                                                <button type="submit" class="btn btn-success m-2">
                                                    <i class="fa fa-search" aria-hidden="true"></i>Procurar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-2">
                                <div class="card card-stats card-round">
                                    <div class="card-body ">
                                        <div class="row">
                                            <form class="form-inline" action="BuscarCpfController" method="POST">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="txtCpf" name="txtCpf" maxlength="11" placeholder="Informe o cpf...">
                                                </div>
                                                <button type="submit" class="btn btn-success m-2">
                                                    <i class="fa fa-search" aria-hidden="true"></i>Procurar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-8">
                                <div class="card card-stats card-round">
                                    <div class="card-body ">
                                        <div class="row">
                                            <form class="form-inline" action="PrevendaCadastrarController" method="POST">
                                                <div class="form-group">
                                                    <%
                                                        Cliente cliente = (Cliente) request.getAttribute("cliente");
                                                        if (cliente != null) {
                                                            //recuperou dados do servlet
                                                        } else {
                                                            //não recuperou dados do servlet
                                                        }
                                                    %>
                                                
                                                    <label for="txtId">Id</label>&nbsp;
                                                    <input type="text" readonly class="form-control" id="txtId" name="txtId" value="<%=cliente.getCliId()%>">&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <label for="txtModelo">Cpf</label>&nbsp;
                                                    <input type="text" readonly class="form-control" id="txtCpf" name="txtCpf" value="<%=cliente.getCliCpf()%>">&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <label for="txtModelo">Cliente</label><br>
                                                    <input type="text" readonly class="form-control" id="txtCliente" name="txtCliente" value="<%=cliente.getCliNome()%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtModelo">Placa</label>
                                                    <input type="text" readonly class="form-control" id="txtPlaca" name="txtPlaca" value="<%=cliente.getCliPlaca()%>">
                                                    <label for="txtModelo">Marca</label>
                                                    <input type="text" readonly class="form-control" id="txtMarca" name="txtMarca" value="<%=cliente.getCliMarca()%>">
                                                    <label for="txtModelo">Modelo</label>
                                                    <input type="text" readonly class="form-control" id="txtModelo" name="txtModelo" value="<%=cliente.getCliModelo()%>">
                                                    <label for="txtModelo">Cor</label>
                                                    <input type="text" readonly class="form-control" id="txtCor" name="txtCor" value="<%=cliente.getCliCor()%>">
                                                </div>
                                                <button class="btn btn-success">Iniciar Pré-venda</button>
                                        </form>
                                        </div>
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
                    "pageLength": 5,
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
                    "pageLength": 5,
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
