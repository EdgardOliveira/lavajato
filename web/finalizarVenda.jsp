<%-- 
    Document   : finalizarVenda
    Created on : 28/05/2020, 21:58:55
    Author     : Edgard Oliveira
--%>

<%@page import="java.util.List"%>
<%@page import="model.beans.Prodserv"%>
<%@page import="model.dao.ProdservDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.ItemVendaDAO"%>
<%@page import="model.beans.Itemvenda"%>
<%@page import="model.beans.Cliente"%>
<%@page import="model.dao.ClienteDAO"%>
<%@page import="model.dao.VendaDAO"%>
<%@page import="model.beans.Venda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                    <h5 class="text-white op-7 mb-2">Finalizar venda</h5>
                                </div>
                                <div class="ml-md-auto py-2 py-md-0">
                                    <a href="#" class="btn btn-secondary btn-round">
                                        <span class="btn-label">
                                            <i class="fa fa-print"></i>
                                        </span>
                                        Imprimir
                                    </a>
                                </div>  
                            </div>
                        </div>
                    </div>
                    <div class="page-inner mt--5">                                                
                        <div class="row mt--2">
                            <div class="col-md-3">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <%
                                            int venId = Integer.parseInt(request.getParameter("venId"));

                                            //int venId = 70;
                                            VendaDAO vendaDAO = new VendaDAO();
                                            Venda venda = vendaDAO.consultarId(venId);
                                        %>
                                        <div class="card-title">Venda</div>
                                        <div class="card-category">Identificador: <%=venda.getVenId()%></div>                                        
                                        <div class="card-category">Data de Entrada: <%=venda.getVenDataEntrada()%></div>
                                        <div class="card-category">Hora de Entrada: <%=venda.getVenHoraEntrada()%></div>
                                        <div class="card-category">Hora de Saída: <%=venda.getVenHoraSaida()%></div>
                                        <div class="d-flex flex-wrap justify-content-around pb-2 pt-4">
                                        </div>
                                    </div>
                                </div>
                            </div>    
                            <div class="col-md-6">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <%
                                            int cliId = venda.getCliente().getCliId();
                                            ClienteDAO clienteDAO = new ClienteDAO();
                                            Cliente cliente = clienteDAO.consultarId(cliId);
                                        %>
                                        <div class="card-title">Cliente</div>
                                        <div class="card-category">Identificador: <%=cliente.getCliId()%></div>                                        
                                        <div class="card-category">Nome: <%=cliente.getCliNome()%></div>
                                        <div class="card-category">Cpf: <%=cliente.getCliCpf()%></div>
                                        <div class="card-category">Veículo: <%=cliente.getCliMarca()%> <%=cliente.getCliModelo()%> <%=cliente.getCliCor()%></div>
                                        <div class="d-flex flex-wrap justify-content-around pb-2 pt-4">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card full-height">
                                    <div class="card-body">
                                        <div class="card-title">Pagamento</div>
                                        <div class="row py-3">
                                            <div class="col-md-4 d-flex flex-column justify-content-around">
                                                <div>
                                                    <h6 class="fw-bold text-uppercase text-danger op-8">Total</h6>
                                                    <h3 class="fw-bold">R$ <%=venda.getVenTotal()%></h3>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div id="chart-container">
                                                    <canvas id="totalIncomeChart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-head-row">
                                            <div class="card-title">Produtos e Serviços</div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="add-row" class="display table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Descrição</th>
                                                        <th>Preço</th>
                                                        <th>Quantidade</th>
                                                        <th>Subtotal</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Descrição</th>
                                                        <th>Preço</th>
                                                        <th>Quantidade</th>
                                                        <th>Subtotal</th>                                                    
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <%
                                                        ArrayList<Itemvenda> listaItens = (ArrayList<Itemvenda>) request.getAttribute("listaItens");
                                                        if (listaItens != null) {
                                                            //faz mais nada
                                                        } else {
                                                            //Venda vendarecup = (Venda) request.getAttribute("venda");
                                                            ItemVendaDAO itemVendaDAO = new ItemVendaDAO();
                                                            listaItens = (ArrayList<Itemvenda>) itemVendaDAO.consultarVenId(venId);
                                                        }

                                                        double total = 0;

                                                        for (Itemvenda itemVenda : listaItens) {

                                                            total += itemVenda.getItvSubtotal();

                                                            ProdservDAO prodservDAO = new ProdservDAO();
                                                            Prodserv prodserv = prodservDAO.consultarId(itemVenda.getProdserv().getProId());
                                                    %>
                                                    <tr>
                                                        <td><%=prodserv.getProId()%></td>
                                                        <td><%=prodserv.getProDescricao()%></td>
                                                        <td><%=prodserv.getProPrecoVenda()%></td>
                                                        <td>1</td>
                                                        <td><%=itemVenda.getItvSubtotal()%></td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="chart-container" style="min-height: 375px">
                                            <canvas id="statisticsChart"></canvas>
                                        </div>
                                        <div id="myChartLegend"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <div class="card-title">Forma de Pagamento</div>
                                    </div>
                                    <div class="card-body pb-0">
                                        <div class="mb-4 mt-2">
                                            <div class="form-check">
                                                <label>Forma de Pagamento</label><br/>
                                                <form action="VendaFinalizarController" method="POST">
                                                    <label class="form-radio-label">
                                                        <input class="form-radio-input" type="radio" 
                                                               id="radFormaPagamento" name="radFormaPagamento" 
                                                               value="Dinheiro"  checked="true">
                                                        <span class="form-radio-sign">Dinheiro</span>
                                                    </label>
                                                    <label class="form-radio-label">
                                                        <input class="form-radio-input" type="radio" 
                                                               id="radFormaPagamento" name="radFormaPagamento" 
                                                               value="Debito"  checked="true">
                                                        <span class="form-radio-sign">Cartão de Débito</span>
                                                    </label>
                                                    <label class="form-radio-label">
                                                        <input class="form-radio-input" type="radio" 
                                                               id="radFormaPagamento" name="radFormaPagamento" 
                                                               value="Credito"  checked="true">
                                                        <span class="form-radio-sign">Cartão de Crédito</span>
                                                    </label>
                                                    <input type="hidden" name="venId" value="<%=venId%>">
                                                    <input type="hidden" name="venTotal" value="<%=venda.getVenTotal()%>">
                                                    <div class="separator-dashed"></div>                                                    
                                                    <h3>Ações</h3>
                                                    <button type="submit" 
                                                            class="btn btn-label btn-white" 
                                                            data-toggle="tooltip" title="">
                                                        <i class="fa fa-check"></i>
                                                    </button>                                                            

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
