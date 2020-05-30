package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.beans.Itemvenda;
import model.beans.Venda;
import model.conexao.FabricaConexao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Edgard Oliveira
 */
public class ItemVendaDAO {
    Session session;
    Transaction transaction;
    List<Itemvenda> lista = new ArrayList<>();
    
    public void salvar(Itemvenda itemvenda){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.save(itemvenda);                        //persistência (salvando)
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public List<Itemvenda> listar(){
        session = FabricaConexao.getSessionFactory();   //conexão
        lista = session.createCriteria(Itemvenda.class).list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }
    
    public Itemvenda consultarId(int id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from itemvenda where itvId = "+id+"").addEntity(Itemvenda.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista.get(0);
    }
    
    public List<Itemvenda> consultarVenId(int id){
        session = FabricaConexao.getSessionFactory();   //conexão
        Query query = session.createSQLQuery("select * from itemvenda where itvVenId = "+id+"").addEntity(Itemvenda.class);
        lista = query.list();
        session.close();                                //fechar o banco de dados 
        return lista;
    }    
    
    public void alterar(Itemvenda itemvenda){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.update(itemvenda);                      //modificando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }
    
    public void excluir(Itemvenda itemvenda){
        session = FabricaConexao.getSessionFactory();   //conexão
        transaction = session.beginTransaction();       //início da persistência
        session.delete(itemvenda);                      //apagando
        transaction.commit();                           //confirmação
        session.close();                                //fechar o banco de dados        
    }        
}
