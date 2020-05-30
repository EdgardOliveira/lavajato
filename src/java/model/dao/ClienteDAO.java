package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Cliente;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class ClienteDAO {
    Session session;
    Transaction transaction;
    List<Cliente> lista = new ArrayList<>();
    
    public void salvar(Cliente cliente){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(cliente);                          //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Cliente> listar(){
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Cliente.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }
    
    public Cliente consultarId(int id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from cliente where cliId = "+id+"").addEntity(Cliente.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
    
    public Cliente consultarNome(String nome){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from cliente where cliNome = '"+nome+"'").addEntity(Cliente.class);
         lista = query.list();
         session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }

    public Cliente consultarPlaca(String placa){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from cliente where cliPlaca = '"+placa+"'").addEntity(Cliente.class);
         lista = query.list();
         session.close();                               //fechar o banco de dados 
        return lista.get(0);
    }

    public Cliente consultarCpf(String cpf){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from cliente where cliCpf = '"+cpf+"'").addEntity(Cliente.class);
         lista = query.list();
         session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }    
    
    public void alterar(Cliente cliente){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(cliente);                              //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public void excluir(Cliente cliente){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(cliente);                        //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }        
}
