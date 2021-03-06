package model.beans;
// Generated 21/05/2020 11:37:51 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Cliente generated by hbm2java
 */
public class Cliente  implements java.io.Serializable {


     private Integer cliId;
     private String cliNome;
     private String cliCpf;
     private String cliCelular;
     private String cliPlaca;
     private String cliMarca;
     private String cliModelo;
     private String cliCor;
     private Set vendas = new HashSet(0);

    public Cliente() {
    }

	
    public Cliente(String cliNome, String cliCpf, String cliCelular, String cliPlaca, String cliMarca, String cliModelo, String cliCor) {
        this.cliNome = cliNome;
        this.cliCpf = cliCpf;
        this.cliCelular = cliCelular;
        this.cliPlaca = cliPlaca;
        this.cliMarca = cliMarca;
        this.cliModelo = cliModelo;
        this.cliCor = cliCor;
    }
    public Cliente(String cliNome, String cliCpf, String cliCelular, String cliPlaca, String cliMarca, String cliModelo, String cliCor, Set vendas) {
       this.cliNome = cliNome;
       this.cliCpf = cliCpf;
       this.cliCelular = cliCelular;
       this.cliPlaca = cliPlaca;
       this.cliMarca = cliMarca;
       this.cliModelo = cliModelo;
       this.cliCor = cliCor;
       this.vendas = vendas;
    }
   
    public Integer getCliId() {
        return this.cliId;
    }
    
    public void setCliId(Integer cliId) {
        this.cliId = cliId;
    }
    public String getCliNome() {
        return this.cliNome;
    }
    
    public void setCliNome(String cliNome) {
        this.cliNome = cliNome;
    }
    public String getCliCpf() {
        return this.cliCpf;
    }
    
    public void setCliCpf(String cliCpf) {
        this.cliCpf = cliCpf;
    }
    public String getCliCelular() {
        return this.cliCelular;
    }
    
    public void setCliCelular(String cliCelular) {
        this.cliCelular = cliCelular;
    }
    public String getCliPlaca() {
        return this.cliPlaca;
    }
    
    public void setCliPlaca(String cliPlaca) {
        this.cliPlaca = cliPlaca;
    }
    public String getCliMarca() {
        return this.cliMarca;
    }
    
    public void setCliMarca(String cliMarca) {
        this.cliMarca = cliMarca;
    }
    public String getCliModelo() {
        return this.cliModelo;
    }
    
    public void setCliModelo(String cliModelo) {
        this.cliModelo = cliModelo;
    }
    public String getCliCor() {
        return this.cliCor;
    }
    
    public void setCliCor(String cliCor) {
        this.cliCor = cliCor;
    }
    public Set getVendas() {
        return this.vendas;
    }
    
    public void setVendas(Set vendas) {
        this.vendas = vendas;
    }




}


