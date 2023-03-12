USE MASTER;

CREATE DATABASE [bd_tcc];

USE bd_tcc;

CREATE TABLE [dbo].[dim_area](
	[idarea] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

CREATE TABLE [dbo].[dim_regiao](
	[idregiao] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

CREATE TABLE [dbo].[dim_classe_econo](
	[idclasse] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

CREATE TABLE [dbo].[dim_renda_familiar](
	[idrenda] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

CREATE TABLE [dbo].[dim_respostasfechadas](
	[idresposta] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

CREATE TABLE [dbo].[dim_a5a](
	[idmotivoprincipal] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

CREATE TABLE [dbo].[dim_a7](
	[idtipoconexao] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

CREATE TABLE [dbo].[dim_sexo](
	[idsexo] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

CREATE TABLE [dbo].[dim_c4](
	[idfrequencia] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

CREATE TABLE [dbo].[dim_grau_instrucao](
	[idgrauinstrucao] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

CREATE TABLE [dbo].[dim_faixa_etaria](
	[idfaixaetaria] [int] NOT NULL PRIMARY KEY,
	[descricao] [varchar] (50) NOT NULL
);

SELECT COUNT(*) 
FROM dbo.basedomicilios;  -- 23950 REGISTROS 

SELECT COUNT(*) 
FROM dbo.baseindividuos; -- 21011 REGISTROS

SELECT d.ID_DOMICILIO		iddomicilio
, d.CLASSE_2015				classe
, d.COD_REGIAO_2				regiao
, d.RENDA_FAMILIAR_2          renda
, d.AREA                      area
, i.SEXO						sexo
, i.FAIXA_ETARIA				faixa_etaria
, i.GRAU_INSTRUCAO			grau_instrucao
, d.A1_A	
, d.A1_B
, d.A4
, d.A5A
, d.A7
, d.A7A
, i.C4
, i.H2
INTO dbo.fato_domicilios
FROM dbo.basedomicilios  d
LEFT JOIN dbo.baseindividuos  i ON i.id_domicilio = d.id_domicilio;   -- 23950 REGISTROS -  TESTE QTDE REGISTROS OK

EXEC sp_help 'dbo.fato_domicilios';

insert into dim_area values (1,'Urbana')
insert into dim_area values (2,'Rural')


insert into dim_regiao values (1,'Sudeste')
insert into dim_regiao values (2,'Nordeste')
insert into dim_regiao values (3,'Sul')
insert into dim_regiao values (4,'Norte')
insert into dim_regiao values (5,'Centro-Oeste')

insert into dim_classe_econo values (1,'A')
insert into dim_classe_econo values (2,'B')
insert into dim_classe_econo values (3,'C')
insert into dim_classe_econo values (4,'DE')

insert into dim_renda_familiar values (1,'Até 1 SM')
insert into dim_renda_familiar values (2,'Mais de 1 SM até 2 SM')
insert into dim_renda_familiar values (3,'Mais de 2 SM até 3 SM')
insert into dim_renda_familiar values (4,'Mais de 3 SM até 5 SM')
insert into dim_renda_familiar values (5,'Mais de 5 SM até 10 SM')
insert into dim_renda_familiar values (6,'Mais de 10 SM')
insert into dim_renda_familiar values (7,'Não tem renda')
insert into dim_renda_familiar values (97,'Não sabe')
insert into dim_renda_familiar values (98,'Não respondeu')

insert into dim_respostasfechadas values (0,'Não')
insert into dim_respostasfechadas values (1,'Sim')
insert into dim_respostasfechadas values (97,'Não sabe')
insert into dim_respostasfechadas values (98,'Não respondeu')
insert into dim_respostasfechadas values (99,'Não se aplica')

insert into dim_a5a values (1,'Falta de computador')
insert into dim_a5a values (2,'Falta de necessidade')
insert into dim_a5a values (3,'Falta de interesse')
insert into dim_a5a values (4,'Têm acesso em outro lugar')
insert into dim_a5a values (5,'Acham muito caro')
insert into dim_a5a values (6,'Não sabem usar Internet')
insert into dim_a5a values (7,'Falta de disponibilidade')
insert into dim_a5a values (8,'Preocupações com segurança ou privacidade')
insert into dim_a5a values (9,'Evitam o contato com conteúdo perigoso')
insert into dim_a5a values (10,'Outro motivo')
insert into dim_a5a values (97,'Não sabe')
insert into dim_a5a values (98,'Não respondeu')
insert into dim_a5a values (99,'Não se aplica')

insert into dim_a7 values (1,'Conexão discada')
insert into dim_a7 values (2,'Conexão DSL')
insert into dim_a7 values (3,'Conexão via cabo ou fibra ótica')
insert into dim_a7 values (4,'Conexão via Rádio')
insert into dim_a7 values (5,'Conexão via Satélite')
insert into dim_a7 values (6,'Conexão via modem (3G ou 4G)')
insert into dim_a7 values (97,'Não sabe')
insert into dim_a7 values (98,'Não respondeu')
insert into dim_a7 values (99,'Não se aplica')

insert into dim_sexo values (1,'Masculino')
insert into dim_sexo values (2,'Feminino')

insert into dim_faixa_etaria values (1,'De 10 a 15 anos')
insert into dim_faixa_etaria values (2,'De 16 a 24 anos')
insert into dim_faixa_etaria values (3,'De 25 a 34 anos')
insert into dim_faixa_etaria values (4,'De 35 a 44 anos')
insert into dim_faixa_etaria values (5,'De 45 a 59 anos')
insert into dim_faixa_etaria values (6,'60 anos ou mais')

insert into dim_grau_instrucao values (1,'Analfabeto')
insert into dim_grau_instrucao values (2,'Sabe ler/escrever, mas não cursou escola')
insert into dim_grau_instrucao values (3,'Até pré-escola incompleto')
insert into dim_grau_instrucao values (4,'Pré-escola completo')
insert into dim_grau_instrucao values (5,'1a até 3a série')
insert into dim_grau_instrucao values (6,'4a até 5a série')
insert into dim_grau_instrucao values (7,'5a até 7a série')
insert into dim_grau_instrucao values (8,'8a série (9o ano)')
insert into dim_grau_instrucao values (9,'1a e 2a série')
insert into dim_grau_instrucao values (10,'3a série/vestibular')
insert into dim_grau_instrucao values (11,'Superior incompleto')
insert into dim_grau_instrucao values (12,'Superior completo')

insert into dim_c4 values (1,'Todos os dias ou quase todos os dias')
insert into dim_c4 values (2,'Pelo menos uma vez por semana')
insert into dim_c4 values (3,'Pelo menos uma vez por mês')
insert into dim_c4 values (4,'Menos do que uma vez por mês')
insert into dim_c4 values (99,'Não se aplica')