<%-- 
    Document   : vendas
    Created on : 27/05/2020, 18:33:28
    Author     : Edgard Oliveira
--%>

<%@page import="model.beans.Funcionario"%>
<%@page import="model.dao.FuncionarioDAO"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="model.beans.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.VendaDAO"%>
<%@page import="model.beans.Venda"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>LAVA JATO</title>
        <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
        <link rel="icon" href="assets/img/lavajato.ico" type="image/x-icon"/>

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
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/atlantis.min.css">

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
                                    <h2 class="text-white pb-2 fw-bold">Vendas</h2>
                                    <h5 class="text-white op-7 mb-2">Dashboard</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">
                        <div class="row mt--2">
                            <div class="col-md-6">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">Estatísticas</div>
                                        <div class="card-category">Hoje</div>
                                        <div class="d-flex flex-wrap justify-content-around pb-2 pt-4">
                                            <div class="px-2 pb-2 pb-md-0 text-center">
                                                <div id="circles-1"></div>
                                                <h6 class="fw-bold mt-3 mb-0">Clientes novos</h6>
                                            </div>
                                            <div class="px-2 pb-2 pb-md-0 text-center">
                                                <div id="circles-2"></div>
                                                <h6 class="fw-bold mt-3 mb-0">Clientes antigos</h6>
                                            </div>
                                            <div class="px-2 pb-2 pb-md-0 text-center">
                                                <div id="circles-3"></div>
                                                <h6 class="fw-bold mt-3 mb-0">Clientes atendidos</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-header">
                                            <div class="card-head-row">
                                                <div class="card-title">Vendas</div>
                                                <div class="card-tools">
                                                    <ul class="nav nav-pills nav-secondary nav-pills-no-bd nav-sm" id="pills-tab" role="tablist">
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="pills-today" data-toggle="pill" href="#pills-today" role="tab" aria-selected="true">Ontem</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link active" id="pills-week" data-toggle="pill" href="#pills-week" role="tab" aria-selected="false">Hoje</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="pills-month" data-toggle="pill" href="#pills-month" role="tab" aria-selected="false">Mês</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="d-flex">
                                                <div class="avatar avatar-online">
                                                    <span class="avatar-title rounded-circle border border-white bg-info">E</span>
                                                </div>
                                                <div class="flex-1 ml-3 pt-1">
                                                    <h6 class="text-uppercase fw-bold mb-1">Edgard Oliveira <span class="text-warning pl-3">pagando</span></h6>
                                                    <span class="text-muted">Honda</span>
                                                    <span class="text-muted">City</span>
                                                </div>
                                                <div class="float-right pt-1">
                                                    <small class="text-muted">8:40 PM</small>
                                                </div>
                                            </div>
                                            <div class="separator-dashed"></div>
                                            <div class="d-flex">
                                                <div class="avatar avatar-offline">
                                                    <span class="avatar-title rounded-circle border border-white bg-secondary">T</span>
                                                </div>
                                                <div class="flex-1 ml-3 pt-1">
                                                    <h6 class="text-uppercase fw-bold mb-1">Thiago Lins <span class="text-success pl-3">lavando</span></h6>
                                                    <span class="text-muted">Honda</span>
                                                    <span class="text-muted">Civic</span>
                                                </div>
                                                <div class="float-right pt-1">
                                                    <small class="text-muted">08:00 PM</small>
                                                </div>
                                            </div>
                                            <div class="separator-dashed"></div>
                                            <div class="d-flex">
                                                <div class="avatar avatar-away">
                                                    <span class="avatar-title rounded-circle border border-white bg-danger">M</span>
                                                </div>
                                                <div class="flex-1 ml-3 pt-1">
                                                    <h6 class="text-uppercase fw-bold mb-1">Marinho Alencar <span class="text-muted pl-3">atendido</span></h6>
                                                    <span class="text-muted">Honda</span>
                                                    <span class="text-muted">HRV</span>
                                                </div>
                                            </div>
                                            <div class="float-right pt-1">
                                                <small class="text-muted">06:00 PM</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card full-height">

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
                                            <h4 class="card-title">Lista pré-vendas e vendas</h4>
                                            <!--<button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                                                <i class="fa fa-plus"></i>
                                                Cadastrar
                                            </button>-->
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
                                                                Venda</span>
                                                        </h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p class="small">Cadastre um novo cliente</p>
                                                        <form>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <label for="txtNome">Nome</label>
                                                                    <input type="text" class="form-control" id="txtNome" placeholder="Informe o nome do cliente">
                                                                    <small id="nomeHelp" class="form-text text-muted">*campo nome obrigatório</small>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="txtCPF">CPF</label>
                                                                    <input type="text" class="form-control" id="txtCPF" placeholder="Informe o CPF do cliente">
                                                                    <small id="cpfHelp" class="form-text text-muted">*campo CPF obrigatório</small>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="txtCelular">Celular</label>
                                                                    <input type="text" class="form-control" id="txtCelular" placeholder="Informe o celular do cliente">
                                                                    <small id="celularHelp" class="form-text text-muted">*campo celular obrigatório</small>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="txtPlaca">Placa</label>
                                                                    <input type="text" class="form-control" id="txtPlaca" placeholder="Informe a placa do veículo do cliente">
                                                                    <small id="placaHelp" class="form-text text-muted">*campo placa obrigatório</small>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="txtMarca">Marca</label>
                                                                    <input type="text" class="form-control" id="txtMarca" placeholder="Informe a marca do veículo do cliente">
                                                                    <small id="marcaHelp" class="form-text text-muted">*campo marca obrigatório</small>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="txtModelo">Modelo</label>
                                                                    <input type="text" class="form-control" id="txtModelo" placeholder="Informe o modelo do veículo do cliente">
                                                                    <small id="modeloHelp" class="form-text text-muted">*campo modelo obrigatório</small>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="txtCor">Cor</label>
                                                                    <input type="text" class="form-control" id="txtCor" placeholder="Informe a cor do veículo do cliente">
                                                                    <small id="corHelp" class="form-text text-muted">*campo cor obrigatório</small>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer no-bd">
                                                        <button type="button" id="addRowButton" class="btn btn-primary">Enviar</button>
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="table-responsive">
                                            <table id="add-row" class="display table table-striped table-hover" >
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Data Entrada</th>
                                                        <th>Hora Entrada</th>
                                                        <th>Data Saída</th>
                                                        <th>Hora Saída</th>
                                                        <th>Status</th>
                                                        <th>Cliente</th>
                                                        <th>Funcionario</th>
                                                        <th>Tipo de Venda</th>
                                                        <th>Forma de Pagamento</th>
                                                        <th>Total</th>
                                                        <th style="width: 10%">Ações</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Data Entrada</th>
                                                        <th>Hora Entrada</th>
                                                        <th>Data Saída</th>
                                                        <th>Hora Saída</th>
                                                        <th>Status</th>
                                                        <th>Cliente</th>
                                                        <th>Funcionario</th>
                                                        <th>Tipo de Venda</th>
                                                        <th>Forma de Pagamento</th>
                                                        <th>Total</th>                                                        
                                                        <th style="width: 10%">Ações</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <%
                                                        ArrayList<Venda> listaVendas = (ArrayList<Venda>) request.getAttribute("vendas");
                                                        if (listaVendas != null) {
                                                            //faz mais nada
                                                        } else {
                                                            //nao veio no request... carrega as vendas
                                                            VendaDAO vendaDAO = new VendaDAO();
                                                            listaVendas = (ArrayList<Venda>) vendaDAO.listar();
                                                        }

                                                        for (Venda venda : listaVendas) {
                                                            ClienteDAO clienteDAO = new ClienteDAO();
                                                            Cliente cliente = clienteDAO.consultarId(venda.getCliente().getCliId());
                                                            FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
                                                            Funcionario funcionario = funcionarioDAO.consultarId(venda.getFuncionario().getFunId());
                                                    %>
                                                    <tr>
                                                        <th><%=venda.getVenId()%></th>
                                                        <th><%=venda.getVenDataEntrada()%></th>
                                                        <th><%=venda.getVenHoraEntrada()%></th>
                                                        <th><%=venda.getVenDataSaida()%></th>
                                                        <th><%=venda.getVenHoraSaida()%></th>
                                                        <th><%=venda.getVenStatus()%></th>
                                                        <th><%=cliente.getCliNome()%></th>
                                                        <th><%=funcionario.getFunNome()%></th>
                                                        <th><%=venda.getVenTipo()%></th>
                                                        <th><%=venda.getVenFormaPagamento()%></th>
                                                        <th><%=venda.getVenTotal()%></th>
                                                        <td>
                                                            <div class="form-button-action">
                                                                <form action="PrevendaRestaurarController" method="post">
                                                                    <input type="hidden" name="venId" value="<%=venda.getVenId()%>">
                                                                    <button type="submit" 
                                                                            class="btn btn-label btn-primary" 
                                                                            data-toggle="tooltip" title="">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>                                                            
                                                                </form>                                                            
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

        <script>
            Circles.create({
                id: 'circles-1',
                radius: 45,
                value: 60,
                maxValue: 100,
                width: 7,
                text: 5,
                colors: ['#f1f1f1', '#FF9E27'],
                duration: 400,
                wrpClass: 'circles-wrp',
                textClass: 'circles-text',
                styleWrapper: true,
                styleText: true
            })

            Circles.create({
                id: 'circles-2',
                radius: 45,
                value: 70,
                maxValue: 100,
                width: 7,
                text: 36,
                colors: ['#f1f1f1', '#2BB930'],
                duration: 400,
                wrpClass: 'circles-wrp',
                textClass: 'circles-text',
                styleWrapper: true,
                styleText: true
            })

            Circles.create({
                id: 'circles-3',
                radius: 45,
                value: 40,
                maxValue: 100,
                width: 7,
                text: 12,
                colors: ['#f1f1f1', '#F25961'],
                duration: 400,
                wrpClass: 'circles-wrp',
                textClass: 'circles-text',
                styleWrapper: true,
                styleText: true
            });
        </script>
    </body>
</html>