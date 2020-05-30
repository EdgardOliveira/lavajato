<%-- 
    Document   : prevenda
    Created on : 24/05/2020, 00:44:43
    Author     : Edgard Oliveira
--%>

<%@page import="model.dao.ClienteDAO"%>
<%@page import="model.beans.Cliente"%>
<%@page import="model.dao.VendaDAO"%>
<%@page import="model.dao.ItemVendaDAO"%>
<%@page import="model.beans.Itemvenda"%>
<%@page import="model.beans.Venda"%>
<%@page import="model.dao.ProdservDAO"%>
<%@page import="model.beans.Prodserv"%>
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
                                    <h2 class="text-white pb-2 fw-bold">Pré-vendas</h2>
                                    <h5 class="text-white op-7 mb-2">Gerenciamento de pré-vendas e vendas</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt--2">
                        <div class="col-md-3">
                            <div class="card full-height">
                                <div class="card-body">
                                    <%
                                        Venda venda = (Venda) request.getAttribute("venda");

                                        int venId = venda.getVenId();

                                        if (venda != null) {
                                            //recuperou dados do servlet

                                        } else {
                                            //não recuperou dados do servlet
                                        }
                                        ClienteDAO clienteDAO = new ClienteDAO();
                                        Cliente cliente = clienteDAO.consultarId(venda.getCliente().getCliId());

                                    %>
                                    <div class="card-title">Pré-venda</div>
                                    <div class="card-category">Identificador da pré-venda: <%=venda.getVenId()%></div>                                        
                                    <div class="card-category">Data de Entrada: <%=venda.getVenDataEntrada()%></div>
                                    <div class="card-category">Hora de Entrada: <%=venda.getVenHoraEntrada()%></div>
                                    <div class="card-category">Identificador do cliente: <%=cliente.getCliId()%></div>
                                    <div class="card-category">Cliente: <%=cliente.getCliNome()%></div>
                                    <div class="card-category">Veículo: <%=cliente.getCliMarca()%> <%=cliente.getCliModelo()%> <%=cliente.getCliCor()%></div>

                                    <div class="d-flex flex-wrap justify-content-around pb-2 pt-4">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card full-height">
                                <div class="card-body">
                                    <div class="card-title">Acompanhamento</div>
                                    <div class="form-check">
                                        <label>Status</label><br/>
                                        <form action="PrevendaAtualizarStatusController" method="POST">
                                            <label class="form-radio-label">
                                                <input class="form-radio-input" type="radio" 
                                                       id="radVenStatus" name="radVenStatus" 
                                                       value="Entrando"  checked="true">
                                                <span class="form-radio-sign">Entrando</span>
                                            </label>
                                            <label class="form-radio-label">
                                                <input class="form-radio-input" type="radio" 
                                                       id="radVenStatus" name="radVenStatus" 
                                                       value="Em fila para lavar">
                                                <span class="form-radio-sign">Em fila para lavar</span>
                                            </label>
                                            <label class="form-radio-label">
                                                <input class="form-radio-input" type="radio" 
                                                       id="radVenStatus" name="radVenStatus" 
                                                       value="Lavando">
                                                <span class="form-radio-sign">Lavando</span>
                                            </label>
                                            <label class="form-radio-label">
                                                <input class="form-radio-input" type="radio" 
                                                       id="radVenStatus" name="radVenStatus" 
                                                       value="Lavando por baixo">
                                                <span class="form-radio-sign">Lavando por baixo</span>
                                            </label>
                                            <label class="form-radio-label">
                                                <input class="form-radio-input" type="radio" 
                                                       id="radVenStatus" name="radVenStatus" 
                                                       value="Aspirando">
                                                <span class="form-radio-sign">Aspirando</span>
                                            </label>
                                            <label class="form-radio-label">
                                                <input class="form-radio-input" type="radio" 
                                                       id="radVenStatus" name="radVenStatus" 
                                                       value="Encerando">
                                                <span class="form-radio-sign">Encerando</span>
                                            </label>
                                            <label class="form-radio-label">
                                                <input class="form-radio-input" type="radio" 
                                                       id="radVenStatus" name="radVenStatus" 
                                                       value="Pronto">
                                                <span class="form-radio-sign">Pronto</span>
                                            </label>
                                            <input type="hidden" name="venId" value="<%=venId%>">
                                            <input type="hidden" name="venTotal" value="<%=venda.getVenTotal()%>">
                                            <button type="submit" 
                                                    class="btn btn-label btn-primary" 
                                                    data-toggle="tooltip" title="">
                                                <i class="fa fa-check"></i>
                                            </button>                                                            
                                        </form> 
                                    </div>
                                    <div class="d-flex flex-wrap justify-content-around pb-2 pt-4">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <!-- Tabela responsiva -->
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-head-row">
                                        <div class="card-title">Lista de Serviços e Produtos</div>
                                        <div class="card-tools">
                                            <a href="#" class="btn btn-info btn-border btn-round btn-sm mr-2">
                                                <span class="btn-label">
                                                    <i class="fa fa-pencil"></i>
                                                </span>
                                                Exportar
                                            </a>
                                            <a href="#" class="btn btn-info btn-border btn-round btn-sm">
                                                <span class="btn-label">
                                                    <i class="fa fa-print"></i>
                                                </span>
                                                Imprimir
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table id="add-row" class="display table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Descrição</th>
                                                <th>Preço</th>
                                                <th class="text-center" style="width: 10%">Ações</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Id</th>
                                                <th>Descrição</th>
                                                <th>Preço</th>
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

                                                Venda vendarec = (Venda) request.getAttribute("venda");

                                                for (Prodserv prodserv : listaProdservs) {
                                            %>
                                            <tr>
                                                <td><%=prodserv.getProId()%></td>
                                                <td><%=prodserv.getProDescricao()%></td>
                                                <td><%=prodserv.getProPrecoVenda()%></td>
                                                <td>
                                                    <div class="form-button-action">
                                                        <form action="ItemVendaController" method="post">
                                                            <input type="hidden" name="proId" value="<%=prodserv.getProId()%>">
                                                            <input type="hidden" name="venId" value="<%=venda.getVenId()%>">
                                                            <button type="submit" 
                                                                    class="btn btn-label btn-primary" 
                                                                    data-toggle="tooltip" title="">
                                                                <i class="fa fa-cart-plus"></i>
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
                        <!-- fim da tabela responsiva -->
                        <!-- Carrinho de compras -->
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">Carrinho de compras</div>
                                    <!--<i class="fa fa-cart-plus"></i>-->
                                </div>
                                <div class="card-body pb-0">
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
                                    <div class="d-flex">
                                        <div class="flex-1 pt-1 ml-2">
                                            <h6 class="fw-bold mb-1"><%=prodserv.getProDescricao()%></h6>
                                            <small class="text-muted"><%=prodserv.getProDescricao()%></small>
                                        </div>
                                        <div class="d-flex ml-auto align-items-center">
                                            <h3 class="text-info fw-bold">+R$ <%=itemVenda.getItvSubtotal()%></h3>                                            
                                        </div>
                                    </div>
                                    <div class="separator-dashed"></div>
                                    <%}%>
                                    <div class="d-flex">
                                        <div class="flex-1 pt-1 ml-2">
                                            <h3 class="text-info fw-bold" align="right">TOTAL R$ <%=total%></h3> 
                                        </div>
                                    </div>
                                    <div class="separator-dashed"></div>
                                    <div class="d-flex">
                                        <h4>Opções</h4>&nbsp;&nbsp;&nbsp;                                        
                                      
                                        <div class="form-button-action">
                                            <form action="VendaAtualizarController" method="post">
                                                <input type="hidden" name="venId" value="<%=venda.getVenId()%>">
                                                <input type="hidden" name="venStatus" value="<%=venda.getVenStatus()%>">
                                                <input type="hidden" name="venTotal" value="<%=total%>">
                                                <button type="submit" 
                                                        class="btn btn-label btn-dark" 
                                                        data-toggle="tooltip" title="">
                                                    <i class="fa fa-check-circle"></i>
                                                </button>                                                            
                                            </form> 
                                        </div>&nbsp;&nbsp;&nbsp;                                                 
                                        <div class="form-button-action">
                                            <form action="VendaConferirController" method="post">
                                                <input type="hidden" name="venId" value="<%=venda.getVenId()%>">
                                                <button type="submit" 
                                                        class="btn btn-label btn-primary" 
                                                        data-toggle="tooltip" title="">
                                                    <i class="fa fa-hand-holding-usd"></i>
                                                </button>                                                            
                                            </form> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- fim do carrinho de compras -->
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
            })
                </script>
                </body>
                </html>