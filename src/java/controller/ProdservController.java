package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Funcionario;
import model.beans.Prodserv;
import model.dao.ProdservDAO;

/**
 *
 * @author Edgard Oliveira
 */
@WebServlet(name = "Prodserv", urlPatterns = {"/ProdservController"})
public class ProdservController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERIR_OU_EDITAR = "/prodserv.jsp";
    private static String LISTAR = "/prodservs.jsp";
    private ProdservDAO prodservDAO;
    private static String encaminhar = "";

    public ProdservController() {
        super();
        prodservDAO = new ProdservDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "cadastrar":
                inserirProdserv(request, response);
                break;
            case "listar":
                listarProdservs(request, response);
                break;
            case "atualizar":
                atualizarProdserv(request, response);
                break;
            case "excluir":
                excluirProdserv(request, response);
                break;
            default:
                listarProdservs(request, response);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(encaminhar);
        view.forward(request, response);
    }

    private void inserirProdserv(HttpServletRequest request, HttpServletResponse response) {
        
        String descricao = request.getParameter("txtDescricao");
        String tipo = request.getParameter("radTipo");
        double precoCusto = Double.parseDouble(request.getParameter("txtPrecoCusto"));
        double precoVenda = Double.parseDouble(request.getParameter("txtPrecoVenda"));
        int quantEstoque = Integer.parseInt(request.getParameter("txtQuantEstoque"));

        Prodserv prodserv = new Prodserv(descricao, tipo, precoCusto, precoVenda, quantEstoque);

        prodservDAO.salvar(prodserv);

        encaminhar = LISTAR;
    }

    private void listarProdservs(HttpServletRequest request, HttpServletResponse response) {
        
        request.setAttribute("prodservs", prodservDAO.listar());
        
        encaminhar = LISTAR;
    }

    private void atualizarProdserv(HttpServletRequest request, HttpServletResponse response) {
        
        int id = Integer.parseInt(request.getParameter("txtId"));
        String descricao = request.getParameter("txtDescricao");
        String tipo = request.getParameter("radTipo");
        double precoCusto = Double.parseDouble(request.getParameter("txtPrecoCusto"));
        double precoVenda = Double.parseDouble(request.getParameter("txtPrecoVenda"));
        int quantEstoque = Integer.parseInt(request.getParameter("txtQuantEstoque"));

        Prodserv prodserv = new Prodserv(descricao, tipo, precoCusto, precoVenda, quantEstoque);
        prodserv.setProId(id);

        prodservDAO.alterar(prodserv);
        
        encaminhar = LISTAR;

        request.setAttribute("prodservs", prodservDAO.listar());

    }

    private void excluirProdserv(HttpServletRequest request, HttpServletResponse response) {
        
        int id = Integer.parseInt(request.getParameter("id"));

        Prodserv prodserv = prodservDAO.consultarId(id);

        prodservDAO.excluir(prodserv);

        encaminhar = LISTAR;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
