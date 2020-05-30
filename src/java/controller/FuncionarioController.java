package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Funcionario;
import model.dao.FuncionarioDAO;

/**
 *
 * @author Edgard Oliveira
 */
@WebServlet(name = "Funcionario", urlPatterns = {"/FuncionarioController"})
public class FuncionarioController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERIR_OU_EDITAR = "/funcionario.jsp";
    private static String LISTAR = "/funcionarios.jsp";
    private FuncionarioDAO funcionarioDAO;
    private static String encaminhar = "";

    public FuncionarioController() {
        super();
        funcionarioDAO = new FuncionarioDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "cadastrar":
                inserirFuncionario(request, response);
                break;
            case "listar":
                listarFuncionarios(request, response);
                break;
            case "atualizar":
                atualizarFuncionario(request, response);
                break;
            case "excluir":
                excluirFuncionario(request, response);
                break;
            default:
                listarFuncionarios(request, response);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(encaminhar);
        view.forward(request, response);
    }

    private void inserirFuncionario(HttpServletRequest request, HttpServletResponse response) {
        
        String nome = request.getParameter("txtNome");
        String usuario = request.getParameter("txtUsuario");
        String senha = request.getParameter("txtSenha");

        Funcionario funcionario = new Funcionario(nome, usuario, senha);

        funcionarioDAO.salvar(funcionario);

        encaminhar = LISTAR;
    }

    private void listarFuncionarios(HttpServletRequest request, HttpServletResponse response) {
        
        request.setAttribute("funcionarios", funcionarioDAO.listar());
        
        encaminhar = LISTAR;
    }

    private void atualizarFuncionario(HttpServletRequest request, HttpServletResponse response) {
        
         
        int id = Integer.parseInt(request.getParameter("txtId"));
        String nome = request.getParameter("txtNome");
        String usuario = request.getParameter("txtUsuario");
        String senha = request.getParameter("txtSenha");

        Funcionario funcionario = new Funcionario(nome, usuario, senha);
        funcionario.setFunId(id);
        
        funcionarioDAO.alterar(funcionario);
        
        encaminhar = LISTAR;

        request.setAttribute("funcionarios", funcionarioDAO.listar());
        
    }

    private void excluirFuncionario(HttpServletRequest request, HttpServletResponse response) {
        
        int id = Integer.parseInt(request.getParameter("id"));

        Funcionario funcionario = funcionarioDAO.consultarId(id);

        funcionarioDAO.excluir(funcionario);

        encaminhar = LISTAR;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
