package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Itemvenda;
import model.beans.Prodserv;
import model.beans.Venda;
import model.dao.ItemVendaDAO;
import model.dao.ProdservDAO;
import model.dao.VendaDAO;

/**
 *
 * @author neove
 */
@WebServlet(name = "ItemVendaController", urlPatterns = {"/ItemVendaController"})
public class ItemVendaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ItemVendaController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ItemVendaController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int venId = Integer.parseInt(request.getParameter("venId"));
        int proId = Integer.parseInt(request.getParameter("proId"));
        int qtde = 1; //fixo em 1 unidade do produto selecionado

        VendaDAO vendaDAO = new VendaDAO();
        Venda venda = vendaDAO.consultarId(venId);

        ProdservDAO prodservDAO = new ProdservDAO();
        Prodserv prodserv = prodservDAO.consultarId(proId);

        double subtotal = calcularSubtotal(qtde, prodserv.getProPrecoVenda());

        Itemvenda itemVenda = new Itemvenda(prodserv, venda, qtde, subtotal);
        ItemVendaDAO itemVendaDAO = new ItemVendaDAO();

        itemVendaDAO.salvar(itemVenda);

        //envia o objeto venda como atributo na requisição
        request.setAttribute("venda", venda);

        //encaminha para a página de pré-venda
        request.getRequestDispatcher("prevenda.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private double calcularSubtotal(int qtde, double proPrecoVenda) {
        return qtde * proPrecoVenda;
    }
}
