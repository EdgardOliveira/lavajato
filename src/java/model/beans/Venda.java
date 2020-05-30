package model.beans;
// Generated 21/05/2020 11:37:51 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Venda generated by hbm2java
 */
public class Venda  implements java.io.Serializable {


     private Integer venId;
     private Cliente cliente;
     private Funcionario funcionario;
     private Date venDataEntrada;
     private Date venHoraEntrada;
     private Date venDataSaida;
     private Date venHoraSaida;
     private String venTipo;
     private double venTotal;
     private String venFormaPagamento;
     private String venStatus;
     private Set itemvendas = new HashSet(0);

    public Venda() {
    }

	
    public Venda(Cliente cliente, Funcionario funcionario, Date venDataEntrada, Date venHoraEntrada, String venTipo, double venTotal) {
        this.cliente = cliente;
        this.funcionario = funcionario;
        this.venDataEntrada = venDataEntrada;
        this.venHoraEntrada = venHoraEntrada;
        this.venTipo = venTipo;
        this.venTotal = venTotal;
    }
    public Venda(Cliente cliente, Funcionario funcionario, Date venDataEntrada, Date venHoraEntrada, Date venDataSaida, Date venHoraSaida, String venTipo, double venTotal, String venFormaPagamento, String venStatus, Set itemvendas) {
       this.cliente = cliente;
       this.funcionario = funcionario;
       this.venDataEntrada = venDataEntrada;
       this.venHoraEntrada = venHoraEntrada;
       this.venDataSaida = venDataSaida;
       this.venHoraSaida = venHoraSaida;
       this.venTipo = venTipo;
       this.venTotal = venTotal;
       this.venFormaPagamento = venFormaPagamento;
       this.venStatus = venStatus;
       this.itemvendas = itemvendas;
    }
   
    public Integer getVenId() {
        return this.venId;
    }
    
    public void setVenId(Integer venId) {
        this.venId = venId;
    }
    public Cliente getCliente() {
        return this.cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    public Funcionario getFuncionario() {
        return this.funcionario;
    }
    
    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }
    public Date getVenDataEntrada() {
        return this.venDataEntrada;
    }
    
    public void setVenDataEntrada(Date venDataEntrada) {
        this.venDataEntrada = venDataEntrada;
    }
    public Date getVenHoraEntrada() {
        return this.venHoraEntrada;
    }
    
    public void setVenHoraEntrada(Date venHoraEntrada) {
        this.venHoraEntrada = venHoraEntrada;
    }
    public Date getVenDataSaida() {
        return this.venDataSaida;
    }
    
    public void setVenDataSaida(Date venDataSaida) {
        this.venDataSaida = venDataSaida;
    }
    public Date getVenHoraSaida() {
        return this.venHoraSaida;
    }
    
    public void setVenHoraSaida(Date venHoraSaida) {
        this.venHoraSaida = venHoraSaida;
    }
    public String getVenTipo() {
        return this.venTipo;
    }
    
    public void setVenTipo(String venTipo) {
        this.venTipo = venTipo;
    }
    public double getVenTotal() {
        return this.venTotal;
    }
    
    public void setVenTotal(double venTotal) {
        this.venTotal = venTotal;
    }
    public String getVenFormaPagamento() {
        return this.venFormaPagamento;
    }
    
    public void setVenFormaPagamento(String venFormaPagamento) {
        this.venFormaPagamento = venFormaPagamento;
    }
    public String getVenStatus() {
        return this.venStatus;
    }
    
    public void setVenStatus(String venStatus) {
        this.venStatus = venStatus;
    }
    public Set getItemvendas() {
        return this.itemvendas;
    }
    
    public void setItemvendas(Set itemvendas) {
        this.itemvendas = itemvendas;
    }




}

