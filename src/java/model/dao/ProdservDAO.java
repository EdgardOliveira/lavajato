package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Prodserv;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class ProdservDAO {
    Session session;
    Transaction transaction;
    List<Prodserv> lista = new ArrayList<>();
    
    public void salvar(Prodserv prodserv){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(prodserv);                          //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Prodserv> listar(){
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Prodserv.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }
    
    public Prodserv consultarId(int id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from prodserv where proId = "+id+"").addEntity(Prodserv.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
    
    public Prodserv consultarDescricao(String descricao){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from prodserv where proDescricao = '"+descricao+"'").addEntity(Prodserv.class);
         lista = query.list();
         session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }

    public Prodserv consultarTipo(String tipo){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from prodserv where proTipo = '"+tipo+"'").addEntity(Prodserv.class);
         lista = query.list();
         session.close();                               //fechar o banco de dados 
        return lista.get(0);
    }
   
    public void alterar(Prodserv prodserv){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(prodserv);                       //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public void excluir(Prodserv prodserv){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(prodserv);                       //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }        
}
