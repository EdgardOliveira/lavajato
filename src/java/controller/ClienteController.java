package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.beans.Cliente;
import model.dao.ClienteDAO;

/**
 *
 * @author Edgard Oliveira
 */
@WebServlet(name = "Cliente", urlPatterns = {"/ClienteController"})
public class ClienteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERIR_OU_EDITAR = "/cliente.jsp";
    private static String LISTAR = "/clientes.jsp";
    private ClienteDAO clienteDAO;
    private static String encaminhar = "";

    public ClienteController() {
        super();
        clienteDAO = new ClienteDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacao = request.getParameter("operacao");

        switch (operacao) {
            case "cadastrar":
                inserirCliente(request, response);
                break;
            case "listar":
                listarClientes(request, response);
                break;
            case "atualizar":
                atualizarCliente(request, response);
                break;
            case "excluir":
                excluirCliente(request, response);
                break;
            default:
                listarClientes(request, response);
        }
        
        RequestDispatcher view = request.getRequestDispatcher(encaminhar);
        view.forward(request, response);
    }

    private void inserirCliente(HttpServletRequest request, HttpServletResponse response) {
        
        String nome = request.getParameter("txtNome");
        String cpf = request.getParameter("txtCpf");
        String celular = request.getParameter("txtCelular");
        String placa = request.getParameter("txtPlaca");
        String marca = request.getParameter("txtMarca");
        String modelo = request.getParameter("txtModelo");
        String cor = request.getParameter("txtCor");        

        Cliente cliente = new Cliente(nome, cpf, celular, placa, marca, modelo, cor);

        clienteDAO.salvar(cliente);

        encaminhar = LISTAR;
    }

    private void listarClientes(HttpServletRequest request, HttpServletResponse response) {
        
        request.setAttribute("clientes", clienteDAO.listar());
        
        encaminhar = LISTAR;
    }

    private void atualizarCliente(HttpServletRequest request, HttpServletResponse response) {
        
        int id = Integer.parseInt(request.getParameter("txtId"));
        String nome = request.getParameter("txtNome");
        String cpf = request.getParameter("txtCpf");
        String celular = request.getParameter("txtCelular");
        String placa = request.getParameter("txtPlaca");
        String marca = request.getParameter("txtMarca");
        String modelo = request.getParameter("txtModelo");
        String cor = request.getParameter("txtCor");        

        Cliente cliente = new Cliente(nome, cpf, celular, placa, marca, modelo, cor);
        cliente.setCliId(id);
        
        clienteDAO.alterar(cliente);
        
        encaminhar = LISTAR;

        request.setAttribute("clientes", clienteDAO.listar());
        
        //encaminha para a página de pré-venda
        //request.getRequestDispatcher(encaminhar).forward(request, response);

        //encaminhar = INSERIR_OU_EDITAR;
    }

    private void excluirCliente(HttpServletRequest request, HttpServletResponse response) {
        
        int id = Integer.parseInt(request.getParameter("id"));

        Cliente cliente = clienteDAO.consultarId(id);

        clienteDAO.excluir(cliente);

        encaminhar = LISTAR;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
