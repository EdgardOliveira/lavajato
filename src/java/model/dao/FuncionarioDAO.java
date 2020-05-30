package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Funcionario;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class FuncionarioDAO {
    Session session;
    Transaction transaction;
    List<Funcionario> lista = new ArrayList<>();
    
    public void salvar(Funcionario funcionario){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(funcionario);                      //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Funcionario> listar(){
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Funcionario.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }
    
    public Funcionario consultarId(int id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from funcionario where funId = "+id+"").addEntity(Funcionario.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
    
    public Funcionario consultarNome(String nome){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from funcionario where funNome = '"+nome+"'").addEntity(Funcionario.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
    
    public int efetuarLogin(String usuario, String senha){
        int id = -1; //-1 = não existe/não autenticado        
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select funId, funNome, funUsuario, funSenha from funcionario where funUsuario = '"+usuario+"' and funSenha = '"+senha+"'").addEntity(Funcionario.class);
        lista = query.list();
        session.close();//fechar o banco de dados 
        
        if ((lista.size()>0) && (!lista.get(0).getFunNome().isEmpty())){
            id = lista.get(0).getFunId();
        }
        
        return id;
    }
    
    public void alterar(Funcionario funcionario){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(funcionario);                    //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public void excluir(Funcionario funcionario){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(funcionario);                    //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }        
}