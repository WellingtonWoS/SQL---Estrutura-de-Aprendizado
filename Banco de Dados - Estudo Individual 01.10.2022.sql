CREATE DATABASE empresaImaginaria;
USE empresaImaginaria;

CREATE TABLE comcliem(
	n_numeclien INT NOT NULL AUTO_INCREMENT,
    c_codiclien VARCHAR(10),
    c_nomeclien VARCHAR(100),
    c_razaclien VARCHAR(100),
    d_dataclien DATE,
    c_cnpjclien VARCHAR(20),
    c_foneclien VARCHAR(20),
    PRIMARY KEY (n_numeclien)
);

DESCRIBE comcliem;

ALTER TABLE comcliem AUTO_INCREMENT=100;

CREATE TABLE comforne(
	n_numeforne INT NOT NULL AUTO_INCREMENT,
    c_codiforne VARCHAR(10),
    c_nomeforne VARCHAR(100),
    c_razaforne VARCHAR(100),
    c_forneforne VARCHAR(20),
    PRIMARY KEY (n_numeforne)
);

CREATE TABLE comvende(
	n_numevende INT NOT NULL AUTO_INCREMENT,
    c_codivende VARCHAR(10),
    c_nomevende VARCHAR(100),
    c_razavende VARCHAR(100),
    c_fonevende VARCHAR(20),
    n_porcvende FLOAT(10,2),
    PRIMARY KEY (n_numevende)
);

CREATE TABLE comprodu(
	n_numeprodu INT NOT NULL AUTO_INCREMENT,
    c_codiprodu VARCHAR(20),
    c_descprodu VARCHAR(100),
    n_valoprodu FLOAT(10,2),
    c_situprodu VARCHAR(1),
    n_numeforne INT,
    PRIMARY KEY(n_numeprodu)
);

CREATE TABLE comvenda(
	n_numevenda INT NOT NULL AUTO_INCREMENT,
    c_codivenda VARCHAR(10),
    n_numeclien INT NOT NULL,
    n_numeforne INT NOT NULL,
    n_numevende INT NOT NULL,
    n_valovenda FLOAT(10,2),
    n_descvenda FLOAT(10,2),
    n_totavenda FLOAT(10,2),
    d_datavenda DATE,
    PRIMARY KEY(n_numevenda)
);

CREATE TABLE comvendas(
	n_numevenda INT NOT NULL AUTO_INCREMENT,
    c_codivenda VARCHAR(10),
    n_numeclien INT NOT NULL,
    n_numeforne INT NOT NULL,
    n_numevende INT NOT NULL,
    n_valovenda FLOAT(10,2),
    n_descvenda FLOAT(10,2),
    n_totavenda FLOAT(10,2),
    d_datavenda DATE,
    PRIMARY KEY(n_numevenda)
);

CREATE TABLE comivenda(
	n_numeivenda INT NOT NULL AUTO_INCREMENT,
    n_numevenda INT NOT NULL,
    n_numeprodu INT NOT NULL,
    n_valoivenda FLOAT(10,2),
    n_qtdeivenda INT,
    n_descivenda FLOAT(10,2),
    PRIMARY KEY(n_numeivenda)
);

ALTER TABLE comvenda ADD CONSTRAINT fk_comprodu_comforne
	FOREIGN KEY(n_numeforne)
	REFERENCES comforne(n_numeforne)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    
ALTER TABLE comvenda ADD CONSTRAINT fk_comprodu_comvende
	FOREIGN KEY (n_numevende)
    REFERENCES comvende(n_numevende)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    
ALTER TABLE comvenda ADD CONSTRAINT fk_comvenda_comclien
	FOREIGN KEY (n_numeclien)
    REFERENCES comcliem(n_numeclien)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    
ALTER TABLE comivenda ADD CONSTRAINT fk_comivenda_comprodu
	FOREIGN KEY (n_numeprodu)
    REFERENCES comprodu(n_numeprodu)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    
ALTER TABLE comivenda ADD CONSTRAINT fk_comivenda_comvenda
	FOREIGN KEY (n_numevenda)
    REFERENCES comvenda(n_numevenda)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
    
ALTER TABLE comivenda DROP FOREIGN KEY
fk_comivenda_comprodu;

ALTER TABLE comcliem ADD COLUMN c_cidaclien VARCHAR(50);

ALTER TABLE comcliem ADD COLUMN c_estclien VARCHAR(50);

ALTER TABLE comcliem DROP COLUMN c_estclien;

ALTER TABLE comcliem ADD COLUMN c_estaclien VARCHAR(50);

ALTER TABLE comcliem MODIFY COLUMN c_estaclien INT;

ALTER TABLE comcliem MODIFY COLUMN c_estaclien VARCHAR(100);

DROP TABLE comvendas;

INSERT INTO comcliem(n_numeclien, c_codiclien, c_nomeclien, c_razaclien,
					d_dataclien, c_cnpjclien, c_foneclien, c_cidaclien, c_estaclien)
VALUES(1, '0001', 'AARONSON', 'AARONSON FURNITURE LTDA', '2015-02-17', '17.807.928/0001-85',
		'(21) 8167-6584', 'QUEIMADOS', 'RJ');
        
UPDATE comcliem SET c_nomeclien = 'AARONSON FURNITURE' WHERE n_numeclien = 1;
COMMIT;

UPDATE comcliem SET c_nomeclien = 'AARONSON FURNITURE', c_cidaclien = 'LONDRINA', c_estaclien = 'PR'
							WHERE n_numeclien = 1;
COMMIT;

UPDATE comcliem SET c_nomeclien = 'AARONSON' WHERE n_numeclien = 1;
ROLLBACK;

DELETE FROM comcliem WHERE n_numeclien = 1;
COMMIT;

TRUNCATE TABLE comcliem;

## Inicio popula tabela clientes
insert into comcliem values(	1 	,'0001','AARONSON FURNITURE'   	    ,'AARONSON FURNITURE LTD'	,'2015-02-17 23:14:50',     '17.807.928/0001-85', '(21) 8167-6584' ,'QUEIMADOS'             ,'RJ' );
insert into comcliem values(	2   ,'0002','LITTLER '             	    ,'LITTLER  LTDA'        	,'2015-02-17 23:14:50',     '55.643.605/0001-92', '(27) 7990-9502' ,'SERRA'                	,'ES' );
insert into comcliem values(	3   ,'0003','KELSEY  NEIGHBOURHOOD'	    ,'KELSEY  NEIGHBOURHOOD' 	,'2015-02-17 23:14:50',     '05.202.361/0001-34', '(11) 4206-9703' ,'BRAGANÇA PAULISTA'    	,'SP' );
insert into comcliem values(	4   ,'0004','GREAT AMERICAN MUSIC' 	    ,'GREAT AMERICAN MUSIC'	    ,'2015-02-17 23:14:50',     '11.880.735/0001-73', '(75) 7815-7801' ,'SANTO ANTÔNIO DE JESUS','BA' );
insert into comcliem values(	5   ,'0005','LIFE PLAN COUNSELLING'	    ,'LIFE PLAN COUNSELLING' 	,'2015-02-17 23:14:50',     '75.185.467/0001-52', '(17) 4038-9355' ,'BEBEDOURO'            	,'SP' );
insert into comcliem values(	6   ,'0006','PRACTI-PLAN'          	    ,'PRACTI-PLAN LTDA'     	,'2015-02-17 23:14:50',     '32.518.106/0001-78', '(28) 2267-6159' ,'CACHOEIRO DE ITAPEMIRI','ES' );
insert into comcliem values(	7   ,'0007','SPORTSWEST'           	    ,'SPORTSWEST LTDA'      	,'2015-02-17 23:14:50',     '83.175.645/0001-92', '(61) 4094-7184' ,'TAGUATINGA'           	,'DF' );
insert into comcliem values(	8   ,'0008','HUGHES MARKETS'       	    ,'HUGHES MARKETS LTDA'  	,'2015-02-17 23:14:50',     '04.728.160/0001-02', '(21) 7984-9809' ,'RIO DE JANEIRO'       	,'RJ' );
insert into comcliem values(	9   ,'0009','AUTO WORKS'           	    ,'AUTO WORKS LTDA'      	,'2015-02-17 23:14:50',     '08.271.985/0001-00', '(21) 8548-5555' ,'RIO DE JANEIRO'       	,'RJ' );
insert into comcliem values(	10	,'00010','DAHLKEMPER '          	,'DAHLKEMPER  LTDA'     	,'2015-02-17 23:14:50',  	'49.815.047/0001-00','(11) 4519-7670'  ,'SÃO PAULO'            	,'SP' );
## Fim popula tabela clientes

## Inicio popula tabela Vendedores
insert into comvende values(1,'0001',    'CARLOS FERNANDES','CARLOS FERNANDES LTDA',  '(47) 7535-8144',12  );
insert into comvende values(2,'0002',    'JÚLIA	GOMES',     'JÚLIA GOMES LTDA',       '(12) 8037-6661',25  );
## Fim popula tabela Vendedores

## Inicio popula tabela Fornecedores
insert into comforne values(1 ,'0001',  'DUN RITE LAWN MAINTENANCE'	   ,'DUN RITE LAWN MAINTENANCE LTDA'	,'(85) 7886-8837' );
insert into comforne values(2 ,'0002',  'SEWFRO FABRICS'	           ,'SEWFRO FABRICS LTDA'	            ,'(91) 5171-8483' );
## Fim popula tabela Fornecedores

## Inicio popula tabela Produtos
insert into comprodu values( 1	,	'123131',     'NOTEBOOK'	,'1251.29'  ,'A',	1  );
insert into comprodu values( 2	,	'123223',     'SMARTPHONE','1242.21'  ,'A',	2  );
insert into comprodu values( 3	,	'1231',     'DESKTOP'	,'1241.21'  ,'A',	1  );
insert into comprodu values( 4	,	'142123',     'TELEVISÃO'	,'2564.92'  ,'A',	2  );
insert into comprodu values( 5	,	'7684',     'DRONE'		,'2325.32'  ,'A',	1  );						
## Fim popula tabela Produtos

## Inicio popula tabela Vendas
## n_numevenda c_codivenda n_numeclien 	n_numeforne n_numevende n_valovenda	n_descvenda n_totavenda	d_datavenda  
insert into comvenda values(1	    ,	'1'	    ,	1	,	1	,	1 ,  '25141.02'  ,	0	,	'25141.02'  ,  '2015-01-01'	 );
insert into comvenda values(2	    ,	'2'	    ,	2	,	2	,	2 ,  '12476.58'  ,	0	,	'12476.58'  ,  '2015-01-02'	 );
insert into comvenda values(3	    ,	'3'	    ,	3	,	1	,	1 ,  '16257.32'  ,	0	,	'16257.32'  ,  '2015-01-03'	 );
insert into comvenda values(4	    ,	'4'	    ,	4	,	2	,	2 ,  '8704.55',	    0	,	'8704.55'   ,  '2015-01-04'	 );
insert into comvenda values(5	    ,	'5'	    ,	5	,	1	,	1 ,  '13078.81',	0	,	'13078.81'  ,  '2015-01-01'	 );
insert into comvenda values(6	    ,	'6'	    ,	6	,	2	,	2 ,  '6079.19',	    0	,	'6079.19'   ,  '2015-01-02'	 );
insert into comvenda values(7	    ,	'7'	    ,	7	,	1	,	1 ,  '7451.26',	    0	,	'7451.26'   ,  '2015-01-03'	 );
insert into comvenda values(8	    ,	'8'	    ,	8	,	2	,	2 ,  '15380.47',	0	,	'15380.47'  ,  '2015-01-04'	 );
insert into comvenda values(9	    ,	'9'	    ,	9	,	1	,	1 ,  '13508.34',	0	,	'13508.34'  ,  '2015-01-01'	 );
insert into comvenda values(10	    ,	'10'	,	1	,	2	,	2 ,  '20315.07',	0	,	'20315.07'  ,  '2015-01-02'	 );
insert into comvenda values(11	    ,	'11'	,	1	,	1	,	1 ,  '8704.55',	    0	,	'8704.55'   ,  '2015-01-01'	 );
insert into comvenda values(12	    ,	'12'	,	2	,	2	,	2 ,  '11198.05',	0	,	'11198.05'  ,  '2015-01-02'	 );
insert into comvenda values(13	    ,	'13'	,	3	,	1	,	1 ,  '4967.84',	    0	,	'4967.84'   ,  '2015-01-03'	 );
insert into comvenda values(14	    ,	'14'	,	3	,	2	,	2 ,  '7451.26',	    0	,	'7451.26'   ,  '2015-01-04'	 );
insert into comvenda values(15	    ,	'15'	,	5	,	1	,	1 ,  '10747.359',	0	,	'10747.36'  ,  '2015-01-01'	 );
insert into comvenda values(16	    ,	'16'	,	6	,	2	,	2 ,  '13502.34',	0	,	'13502.34'  ,  '2015-01-02'	 );
insert into comvenda values(17	    ,	'17'	,	7	,	1	,	1 ,  '22222.99',	0	,	'22222.99'  ,  '2015-01-03'	 );
insert into comvenda values(18	    ,	'18'	,	8	,	2	,	2 ,  '15465.69',	0	,	'15465.69'  ,  '2015-01-04'	 );
insert into comvenda values(19	    ,	'19'	,	9	,	1	,	1 ,  '4650.64',	    0	,	'4650.64'   ,  '2015-01-01'	 );
insert into comvenda values(20	    ,	'20'	,	9	,	2	,	2 ,  '6975.96',	    0	,	'6975.96'   ,  '2015-01-02'	 );
## Fim popula tabela Vendas

## Inicio popula tabela Itens Vendas
insert into comivenda values(1 ,1 ,1,'1251.29',1,0);
insert into comivenda values(2 ,1 ,2,'1242.21',2,0);
insert into comivenda values(3 ,1 ,3,'1241.21',3,0);
insert into comivenda values(4 ,1 ,4,'1513.77',4,0);
insert into comivenda values(5 ,1 ,5,'2325.32',5,0);               
insert into comivenda values(6 ,2 ,1,'1251.29',6,0);               
insert into comivenda values(7 ,3 ,3,'1241.21',7,0);               
insert into comivenda values(8 ,4 ,1,'1251.29',1,0);              
insert into comivenda values(9 ,5 ,3,'1241.21',2,0);              
insert into comivenda values(10,6 ,1,'1251.29',3,0);              
insert into comivenda values(11,7 ,2,'1242.21',4,0);              
insert into comivenda values(12,8 ,5,'2325.32',5,0);
insert into comivenda values(13,9 ,2,'1242.21',6,0);
insert into comivenda values(14,10,3,'1241.21',7,0);
insert into comivenda values(15,11,1,'1251.29',1,0);
insert into comivenda values(16,12,1,'1251.29',2,0);
insert into comivenda values(17,13,2,'1242.21',3,0);
insert into comivenda values(18,14,2,'1242.21',4,0);
insert into comivenda values(19,15,3,'1241.21',5,0);
insert into comivenda values(20,16,3,'1241.21',6,0);
insert into comivenda values(21 ,17,4,'1513.77',7,0);
insert into comivenda values(22 ,18,4,'1513.77',1,0);
insert into comivenda values(23 ,19,5,'2325.32',2,0);
insert into comivenda values(24 ,20,5,'2325.32',3,0);
insert into comivenda values(25 ,2 ,2,'1242.21',4,0);
insert into comivenda values(26 ,3 ,4,'1513.77',5,0);
insert into comivenda values(27 ,4 ,2,'1242.21',6,0);
insert into comivenda values(28 ,5 ,4,'1513.77',7,0);
insert into comivenda values(29 ,6 ,5,'2325.32',1,0);
insert into comivenda values(30,7 ,3,'1241.21',2,0);
insert into comivenda values(31,8 ,1,'1251.29',3,0);
insert into comivenda values(32,9 ,4,'1513.77',4,0);
insert into comivenda values(33,10,5,'2325.32',5,0);
insert into comivenda values(34,11,2,'1242.21',6,0);
insert into comivenda values(35,12,2,'1242.21',7,0);
insert into comivenda values(36,13,3,'1241.21',1,0);
insert into comivenda values(37,14,3,'1241.21',2,0);
insert into comivenda values(38,15,4,'1513.77',3,0);
insert into comivenda values(39,16,4,'1513.77',4,0);
insert into comivenda values(40,17,5,'2325.32',5,0);
insert into comivenda values(41,18,5,'2325.32',6,0);
## Fim popula tabela  Itens Vendas


SELECT * FROM comcliem;

SELECT n_numeclien, c_razaclien
FROM comcliem;

SELECT n_numeclien, c_codiclien, c_razaclien
FROM comcliem
WHERE c_codiclien = '0001';

SELECT n_numeclien, c_codiclien, c_razaclien
FROM comcliem
WHERE c_codiclien <> '0001';

SELECT n_numeclien, c_codiclien, c_razaclien
FROM comcliem
WHERE c_razaclien LIKE 'L%';

SELECT n_numeclien FROM comvenda;
SELECT DISTINCT n_numeclien FROM comvenda;

SELECT c_codiclien, c_razaclien FROM comcliem WHERE n_numeclien IN (1,2);

SELECT c_codiclien, c_razaclien FROM comcliem WHERE n_numeclien NOT IN (1,2);

SELECT c_razaclien FROM comcliem WHERE n_numeclien 
		IN
(SELECT n_numeclien FROM comvenda WHERE n_numeclien);

SELECT c_razaclien FROM comcliem WHERE n_numeclien 
		NOT IN
(SELECT n_numeclien FROM comvenda WHERE n_numeclien);

SELECT c_codivenda Cod_Venda,
(SELECT c_razaclien FROM comcliem
WHERE n_numeclien = comvenda.n_numeclien) Nome_Cliente FROM comvenda;

SELECT c_codiclien CODIGO, c_nomeclien CLIENTE
FROM comcliem
WHERE n_numeclien NOT IN(1,2,3,4);

##Diferença de resultados nas colunas usando ALIAS##
SELECT c_codivenda, 
(SELECT c_razaclien FROM comcliem WHERE n_numeclien = comvenda.n_numeclien)
FROM comvenda;

SELECT c_codivenda COD_Venda,
(SELECT c_razaclien FROM comcliem WHERE n_numeclien = comvenda.n_numeclien) NOME_Cliente
FROM comvenda;

####JOINS#####
SELECT c_codiclien, c_razaclien, c_codivenda Cod_Venda
FROM comvenda, comcliem
WHERE comvenda.n_numeclien = comcliem.n_numeclien
ORDER BY c_razaclien;

##Criando tabelas por meio de SELECT
CREATE TABLE comclien_bkp AS
(SELECT * FROM comcliem WHERE c_estaclien ='SP');
############

CREATE TABLE comcontato(
	n_numecontato INT NOT NULL AUTO_INCREMENT,
    c_nomecontato VARCHAR(200),
    c_fonecontato VARCHAR(30),
    c_cidacontato VARCHAR(200),
    c_estacontato VARCHAR(2),
    n_numeclien INT,
    PRIMARY KEY(n_numecontato)
);

INSERT INTO comcontato
(SELECT n_numeclien, c_nomeclien, c_foneclien, c_cidaclien, c_estaclien, n_numeclien
FROM comcliem);

SELECT * FROM comcontato;
SELECT * FROM comcliem;

##Alterando registros por meio de SELECT
UPDATE comcontato SET c_cidacontato = 'LONDRINA', c_estacontato = 'PR'		##Não funcionou 
WHERE n_numeclien IN (SELECT n_numeclien FROM comclien_bkp);

DELETE FROM comcontato														##Não funcionou
WHERE n_numeclien NOT IN (SELECT n_numeclien FROM comvenda);