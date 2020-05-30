/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Venda;
import model.dao.VendaDAO;

/**
 *
 * @author Edgard Oliveira
 */
@WebServlet(name = "Venda", urlPatterns = {"/VendaController"})
public class VendaController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERIR_OU_EDITAR = "/venda.jsp";
    private static String LISTAR = "/vendas.jsp";
    private VendaDAO vendaDAO;
    private static String encaminhar = "";

    public VendaController() {
        super();
        vendaDAO = new VendaDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "cadastrar":
                inserirVenda(request, response);
                break;
            case "listar":
                listarVendas(request, response);
                break;
            case "atualizar":
                atualizarVenda(request, response);
                break;
            case "excluir":
                excluirVenda(request, response);
                break;
            default:
                listarVendas(request, response);
        }

        RequestDispatcher view = request.getRequestDispatcher(encaminhar);
        view.forward(request, response);
    }

    private Date converterData(String data) throws ParseException {

        SimpleDateFormat formatar = new SimpleDateFormat("dd/MM/yyyy");

        Date dataConvertida = formatar.parse(data);

        return dataConvertida;
    }

    private Time converterHora(String hora) throws ParseException {

        SimpleDateFormat formatador = new SimpleDateFormat("HH:mm");
        Date data = formatador.parse(hora);
        Time horaConvertida = new Time(data.getTime());

        return horaConvertida;
    }

    private void inserirVenda(HttpServletRequest request, HttpServletResponse response) {
        try {
            Date dataEntrada = converterData(request.getParameter("txtDataEntrada"));
           Time horaEntrada = converterHora(request.getParameter("txtHoraEntrada"));
            Date dataSaida = converterData(request.getParameter("txtDataSaida"));
            Time horaSaida = converterHora(request.getParameter("txtHoraSaida"));        
        } catch (ParseException ex) {
            Logger.getLogger(VendaController.class.getName()).log(Level.SEVERE, null, ex);
        }


        Venda venda = new Venda();

        vendaDAO.salvar(venda);

        encaminhar = LISTAR;
    }

    private void listarVendas(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("vendas", vendaDAO.listar());

        encaminhar = LISTAR;
    }

    private void atualizarVenda(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("venId"));
        double total = Double.parseDouble(request.getParameter("venTotal"));
        String status = request.getParameter("venStatus");

        Venda venda = vendaDAO.consultarId(id);
        venda.setVenTotal(total);
        venda.setVenStatus(status);


        vendaDAO.alterar(venda);
        
        request.setAttribute("venda", venda);

        encaminhar = LISTAR;//INSERIR_OU_EDITAR;

    }

    private void excluirVenda(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));

        Venda venda = vendaDAO.consultarId(id);

        vendaDAO.excluir(venda);

        encaminhar = LISTAR;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
