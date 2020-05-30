package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Venda;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class VendaDAO {
    Session session;
    Transaction transaction;
    List<Venda> lista = new ArrayList<>();
    
    public void salvar(Venda venda){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(venda);                          //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Venda> listar(){
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Venda.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }
    
    public Venda consultarId(int id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from venda where venId = "+id+"").addEntity(Venda.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
    
    public Venda consultarTipo(String tipo){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from venda where venTipo = '"+tipo+"'").addEntity(Venda.class);
         lista = query.list();
         session.close();                               //fechar o banco de dados 
        return lista.get(0);
    }
   
    public void alterar(Venda venda){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(venda);                          //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public void excluir(Venda venda){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(venda);                          //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }        
}
