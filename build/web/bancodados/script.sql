/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Edgard Oliveira
 * Created: 29/05/2020
 */

/** criação do banco de dados **/
create database lavajato;

/** utilização do banco de dados */
use lavajato;

/** criação da tabela de funcionários **/
create table funcionario(
    funId int(5) not null primary key auto_increment,
    funNome varchar(60) not null,
    funUsuario varchar(30) not null unique,
    funSenha varchar(30) not null
);

/** criação da tabela de clientes **/
create table cliente(
    cliId int(5) not null auto_increment primary key ,
    cliNome varchar(60) not null,
    cliCpf varchar(11) not null unique,
    cliCelular varchar(11) not null,
    cliPlaca varchar(7) not null unique,
    cliMarca varchar(20) not null,
    cliModelo varchar(30) not null,
    cliCor varchar(20) not null
);

/** criação da tabela de produtos e serviços **/
create table prodserv(
  proId int(5) not null primary key auto_increment,
  proDescricao varchar(50) not null,
  proTipo enum('S', 'P') not null,
  proPrecoCusto double not null,
  proPrecoVenda double not null,
  proQuantEstoque int(5) not null
);

/** criação da tabela de vendas **/
create table venda(
    venId int(5) not null primary key auto_increment,
    venDataEntrada DATE not null,
    venHoraEntrada TIME not null,
    venDataSaida DATE null,
    venHoraSaida TIME null,
    venFunId int(5) not null,
    venTipo enum('P', 'V') not null,
    venTotal double not null,
    venFormaPagamento enum('Dinheiro', 'Debito', 'Credito') null,
    venCliId int(5) not null,
    venStatus enum('Entrando', 'Em fila para lavar', 'Lavando', 'Lavando Motor', 'Lavando por baixo', 'Aspirando', 'Encerando', 'Pronto', 'Finalizado'),
    foreign key (venCliId) references cliente(cliId),
    foreign key (venFunId) references funcionario(funId)
);

/** criação da tabela de itens vendidos **/
create table itemvenda(
  itvId int(5) not null primary key auto_increment,
  itvVenId int(5) not null,
  itvProId int(5) not null,
  itvQuant int(5) not null,
  itvSubtotal double not null,
  foreign key (itvVenId) references venda(venId),
  foreign key (itvProId) references prodserv(proId)
);

/** populando as tabelas **/

insert into funcionario(funNome, funUsuario, funSenha) values
('Edgard Oliveira', 'edgard', '321'),
('Marcos Oliveira', 'marcos', 'travolta'),
('Marinho Alencar', 'marinho', '123'),
('Thiago Lins', 'thiago', 'paleteiro'),
('João Guilherme', 'joao', 'xup');

insert into cliente(cliNome, cliCpf, cliCelular, cliPlaca, cliMarca, cliModelo, cliCor) values
('Edgard Oliveira', '68936419234', '92981264800', 'PHI3F27', 'Honda', 'City', 'Prata'),
('Marcos Oliveira', '78936419234', '92989994800', 'NON3F27', 'Honda', 'Biz', 'Preta'),
('Marinho Alencar', '98936419234', '92981264770', 'PHI3F55', 'Volksvagem', 'Passat', 'Cinza'),
('Thiago Lins', '68988897234', '92984444800', 'ZZZ3F27', 'Volksvagem', 'Brasilia', 'Amarela'),
('Joao Guilherme', '68777419234', '92555264800', 'KQI3F27', 'Fiat', 'Uno', 'Azul');

insert into prodserv(proDescricao, proTipo, proPrecoCusto, proPrecoVenda, proQuantEstoque) values
('Pacote Lavagem Simples - Veículo P', 'S', 10.00, 20.00, 9999),
('Pacote Lavagem Intermediária - Veículo P', 'S', 15.00, 35.00, 9999),
('Pacote Lavagem Completa - Veículo P', 'S', 20.00, 45.00, 9999),
('Pacote Lavagem Simples - Veículo M', 'S', 15.00, 35.00, 9999),
('Pacote Lavagem Intermediária - Veículo M', 'S', 25.00, 45.00, 9999),
('Pacote Lavagem Completa - Veículo M', 'S', 35.00, 55.00, 9999),
('Pacote Lavagem Simples - Veículo G', 'S', 20.00, 40.00, 9999),
('Pacote Lavagem Intermediária - Veículo G', 'S', 35.00, 55.00, 9999),
('Pacote Lavagem Completa - Veículo G', 'S', 40.00, 65.00, 9999),
('Pacote Lavagem Uber', 'S', 5.00, 15.00, 9999),
('Pacote Lavagem Taxi', 'S', 5.00, 12.00, 9999),
('Cerveja Lata', 'P', 2.00, 6.00, 50),
('Cerveja Longneck', 'P', 4.00, 8.00, 50),
('Refrigerante Lata', 'P', 2.00, 6.00, 50);

insert into venda(venDataEntrada, venHoraEntrada, venDataSaida, venHoraSaida, venFunId, venTipo, venTotal, venFormaPagamento, venCliId, venStatus)  values
('2020-05-15', '08:00', '2020-05-15', '09:00', 5,  'V', 20.00, 'Dinheiro', 1, 'Finalizado'),
('2020-05-15', '09:00', '2020-05-15', '10:00', 4, 'V', 35.00, 'Credito', 2, 'Finalizado'),
('2020-05-15', '10:00', '2020-05-15', '11:00', 4, 'V', 45.00, 'Debito', 3, 'Finalizado'),
('2020-05-15', '11:00', '2020-05-15', '12:00', 2, 'V', 65.00, 'Dinheiro', 1, 'Finalizado'),
('2020-05-15', '12:00', '2020-05-15', null, 1, 'V', 41.00, null, 1, 'Aspirando');

insert into itemvenda(itvVenId, itvProId, itvQuant, itvSubtotal) values
(1, 1, 1, 20.00),
(2, 4, 1, 35.00),
(3, 5, 1, 45.00),
(4, 9, 1, 65.00),
(5, 1, 1, 20.00),
(5, 14, 1, 6.00);