CREATE TABLE modalidade (idmod SERIAL primary key, nomemod VARCHAR(50));

CREATE TABLE categoria (idcat SERIAL primary key,
nomecat VARCHAR(60),
tipocat VARCHAR(1),
generocat VARCHAR(1),
idmod integer,
foreign key (idmod) references modalidade);

CREATE TABLE competidor (idcompetidor SERIAL primary key);

CREATE TABLE inscricao (idinscricao SERIAL primary key,
idcat integer, 
idcompetidor integer,
foreign key (idcompetidor) references competidor(idcompetidor),
foreign key (idcat) references categoria (idcat));

CREATE TABLE patrocinador (cnpj VARCHAR(20) primary key,
nomepat VARCHAR(30),
patevento VARCHAR(1), 
patcompetidor VARCHAR(1), 
enderecopat VARCHAR(70) , 
valor VARCHAR(12));

CREATE TABLE patrocinio (idpatrocinio SERIAL primary key,
idcompetidor integer,
cnpj varchar (20),
foreign key (idcompetidor) references competidor(idcompetidor),
foreign key (cnpj) references patrocinador (cnpj));

CREATE TABLE pessoa (cpf varchar(15) primary key,
nomepessoa VARCHAR(30),
datanascimento DATE, 
sexo VARCHAR(1));

CREATE TABLE atleta (idcompetidor integer primary key,
cpf varchar (15),
foreign key (idcompetidor) references competidor(idcompetidor),
foreign key (cpf) references pessoa (cpf));

CREATE TABLE equipe (idcompetidor integer primary key,
nomeequi VARCHAR(60),
foreign key (idcompetidor) references competidor(idcompetidor));

CREATE TABLE atlequ (idatlequ serial primary key,
aidcompetidor integer,
eidcompetidor integer,
foreign key (aidcompetidor) references atleta(idcompetidor),
foreign key (eidcompetidor) references equipe(idcompetidor));


CREATE TABLE funcionario (cpf varchar(15) primary key);
 
CREATE TABLE arbitro (cpf varchar(15) primary key);

CREATE TABLE modarb (idmodarb serial primary key,
cpf varchar(15),
idmod integer,
foreign key (cpf) references arbitro(cpf),
foreign key (idmod) references modalidade(idmod));

CREATE TABLE local (idlocal serial primary key,
enderecolocal varchar(40),
capacidade varchar(10),
cpf varchar(15));

CREATE TABLE modloc (idmodloc serial primary key,
idlocal integer,
idmod integer,
foreign key (idlocal) references local(idlocal),
foreign key (idmod) references modalidade(idmod));

CREATE TABLE competicao (idcompeticao serial primary key,
fase varchar(1),
datacompeticao date,
horacompeticao varchar(5), 
idcat integer,
idlocal integer,
foreign key (idcat) references categoria(idcat),
foreign key (idlocal) references local(idlocal));

CREATE TABLE participacao (idparticipacao serial primary key,
idcompeticao integer, 
idcompetidor integer, 
escore real, 
unidade varchar(15),
foreign key (idcompeticao) references competicao(idcompeticao),
foreign key (idcompetidor) references competidor(idcompetidor));


INSERT INTO modalidade (nomemod) VALUES
('Atletismo'),
('Basquete'),
('Boxe'),
('Ciclismo'),
('Futebol'),
('Ginástica'),
('Handbol'),
('Levantamento de Pesos'),
('Hipismo'),
('Iatimos'),
('Judo'),
('Natacao'),
('Tenis'),
('Volei');

INSERT INTO categoria (nomecat, tipocat, generocat, idmod) VALUES 
('100mt rasos', 'I', 'M', 1),
('400mt barreiras', 'I', 'M', 1),
('800mt rasos', 'I', 'M', 1),
('800mt barreiras', 'I', 'M', 1),
('Maratona', 'I', 'M', 1),
('Salto distancia', 'I', 'M', 1),
('Salto triplo', 'I', 'M', 1 ),
('Salto altura', 'I', 'M', 1 ),
('Salto com vara', 'I', 'M', 1 ),
('Revezamento 4x100', 'C', 'M', 1 ),
('Revezamento 4x400', 'C', 'M', 1),
('Arremesso Disco', 'I', 'M', 1),
('Arremesso Dardo', 'I', 'M', 1),
('Arremesso Martelo', 'I', 'M', 1),
('100mt rasos', 'I', 'F', 1),
('400mt barreiras', 'I', 'F', 1),
('800mt rasos', 'I', 'F', 1),
('800mt barreiras', 'I', 'F', 1),
('Maratona', 'I', 'F', 1),
('Salto distancia', 'I', 'F', 1),
('Salto triplo', 'I', 'F', 1 ),
('Salto altura', 'I', 'F', 1 ),
('Salto com vara', 'I', 'F', 1 ),
('Revezamento 4x100', 'C', 'F', 1 ),
('Revezamento 4x400', 'C', 'F', 1 ),
('Arremesso Disco', 'I', 'F', 1),
('Arremesso Dardo', 'I', 'F', 1),
('Arremesso Martelo', 'I', 'F', 1),
('Masculino       ', 'C', 'M', 2),
('Feminino        ', 'C', 'F', 2),
('Peso Galo', 'I', 'M', 3),
('Peso Mosca', 'I', 'M', 3),
('Peso Leve', 'I', 'M', 3),
('Peso Pena', 'I', 'M', 3),
('Peso Medio', 'I', 'M', 3),
('Peso Pesado', 'I', 'M', 3),
('Peso SuperPesado', 'I', 'M', 3),
('Pista', 'I', 'M', 4),
('Estrada', 'I', 'M', 4),
('Pista', 'I', 'F', 4),
('Estrada', 'I', 'F', 4),
('Masculino', 'C', 'M', 5),
('Feminino', 'C', 'F', 5),
('Artistica', 'I', 'M', 6),
('Ritmica', 'I', 'M', 6),
('Trampolim AcrobÃ¡tico', 'I', 'M', 6),
('Aerobica', 'I', 'M', 6),
('Artistica', 'I', 'F', 6),
('Ritmica', 'I', 'F', 6),
('Trampolim Acrobatico', 'I', 'F', 6),
('Aerobica', 'I', 'F', 6),
('Masculino', 'I', 'M', 7),
('Feminino', 'I', 'F', 7),
('Peso Galo', 'I', 'M', 8),
('Peso Mosca', 'I', 'M', 8),
('Peso Leve', 'I', 'M', 8),
('Peso Pena', 'I', 'M', 8),
('Peso Medio', 'I', 'M', 8),
('Peso Pesado', 'I', 'M', 8),
('Peso SuperPesado', 'I', 'M', 8),
('Saltos', 'I', 'M', 9),
('Equitacao', 'I', 'M', 9),
('Adestramento', 'I', 'M', 9),
('Classe Laser', 'I', 'M', 10),
('Classe Star', 'I', 'M', 10),
('Classe finn', 'I', 'M', 10),
('Classe 470', 'I', 'M', 10),
('Classe Soling', 'I', 'M', 10),
('Classe Tornado', 'I', 'M', 10),
('Classe Europa', 'I', 'M', 10),
('Classe Prancha-vela', 'I', 'M', 10),
('Peso Galo', 'I', 'M', 11),
('Peso Mosca', 'I', 'M', 11),
('Peso Leve', 'I', 'M', 11),
('Peso Pena', 'I', 'M', 11),
('Peso Medio', 'I', 'M', 11),
('Peso Pesado', 'I', 'M', 11),
('Peso SuperPesado', 'I', 'M', 11),
('50mt Livre', 'I', 'M', 12),
('100mt Peito', 'I', 'M', 12),
('100mt Costas', 'I', 'M', 12),
('100mt Borboleta', 'I', 'M', 12),
('100mt Livre', 'I', 'M', 12),
('200mt Peito', 'I', 'M', 12),
('200mt Costas', 'I', 'M', 12),
('200mt Borboleta', 'I', 'M', 12),
('200mt Livre', 'I', 'M', 12),
('400mt Peito', 'I', 'M', 12),
('400mt Costas', 'I', 'M', 12),
('400mt Borboleta', 'I', 'M', 12),
('400mt Livre', 'I', 'M', 12),
('Revezamento 4x100 Livre', 'C', 'M', 12),
('Revezamento 4x100 Costa', 'C', 'M', 12),
('800mt Livre', 'I', 'M', 12),
('1500mt Livre', 'I', 'M', 12),
('50mt Livre', 'I', 'F', 12),
('100mt Peito', 'I', 'F', 12),
('100mt Costas', 'I', 'F', 12),
('100mt Borboleta', 'I', 'F', 12),
('100mt Livre', 'I', 'F', 12),
('200mt Peito', 'I', 'F', 12),
('200mt Costas', 'I', 'F', 12),
('200mt Borboleta', 'I', 'F', 12),
('200mt Livre', 'I', 'F', 12),
('400mt Peito', 'I', 'F', 12),
('400mt Costas', 'I', 'F', 12),
('400mt Borboleta', 'I', 'F', 12),
('400mt Livre', 'I', 'F', 12),
('Revezamento 4x100 Livre', 'C', 'F', 12),
('Revezamento 4x100 Costa', 'C', 'F', 12),
('1500mt Livre', 'I', 'F', 12),
('Mesa', 'I', 'M', 13),
('Quadra', 'I', 'M', 13),
('Mesa-Dupla', 'C', 'M', 13),
('Quadra-Dupla', 'C', 'M', 13),
('Mesa', 'I', 'F', 13),
('Quadra', 'I', 'F', 13),
('Mesa-Dupla', 'C', 'F', 13),
('Quadra-Dupla', 'C', 'F', 13),
('Masculino', 'C', 'M', 14),
('Feminino', 'C', 'F', 14);

INSERT INTO competidor(idcompetidor) values
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default),
(default);

INSERT INTO inscricao (idcat, idcompetidor) VALUES 
(1, 1),
(1, 2),
(1, 3),
(15, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(42, 50),
(42, 51),
(42, 52),
(42, 53),
(42, 54),
(42, 55),
(42, 56),
(42, 57),
(42, 58),
(121, 59),
(121, 60),
(79, 1),
(80, 2),
(81, 3),
(82, 5),
(96, 4),
(97, 22);

INSERT INTO patrocinador (cnpj, nomepat, patevento, 
	patcompetidor, enderecopat, valor) VALUES 
('10222222000133', 'Fabrica esportiva 1', '1', '0', 'Av. Um   n 1, Udia-MG, Brasil', '100000.00'),
('20222222000133', 'Fabrica esportiva 2', '1', '0', 'Av. Dois n 2, Udia-MG, Brasil', '50000.00'),
('30222222000133', 'Fabrica esportiva 3', '0', '1', 'Av. Tres n 3, Udia-MG, Brasil', '0');


INSERT INTO patrocinio (idcompetidor, cnpj) VALUES 
('1', '20222222000133'),
('2', '20222222000133'),
('3', '20222222000133'),
('4', '20222222000133'),
('4', '30222222000133'),
('5', '30222222000133'),
('6', '30222222000133'),
('7', '30222222000133'),
('8', '30222222000133'),
('9', '30222222000133'),
('10', '30222222000133');


INSERT INTO pessoa (cpf, nomepessoa, datanascimento, sexo) VALUES 
('11122233301', 'Adilson Pires', '1990-01-01', 'M'),
('11122233302', 'Artur A Moura', '1990-01-01', 'M'),
('11122233303', 'Cesar W Alvarenga', '1990-01-01', 'M'),
('11122233304', 'Claudia Araujo', '1990-01-01', 'F'),
('11122233305', 'Daniel N Guardieiro', '1990-01-01', 'M'),
('11122233306', 'Danilo Ribeiro', '1990-01-01', 'M'),
('11122233307', 'Diego C Bessa', '1990-01-01', 'M'),
('11122233308', 'Diego M Oliveira', '1990-01-01', 'M'),
('11122233309', 'Diogo Mendes', '1990-01-01', 'M'),
('11122233310', 'Edislei C Reis', '1990-01-01', 'M'),
('11122233311', 'Eduardo I Sa', '1990-01-01', 'M'),
('11122233312', 'Eli R Silva', '1990-01-01', 'M'),
('11122233313', 'Everson F Giacomelli Jr.', '1990-01-01', 'M'),
('11122233314', 'Fabiano S Terra', '1990-01-01', 'M'),
('11122233315', 'Fabricio S Araujo', '1990-01-01', 'M'),
('11122233316', 'Gabriel', '1990-01-01', 'M'),
('11122233317', 'Gil Victor', '1990-01-01', 'M'),
('11122233318', 'Guilherme H G Silva', '1990-01-01', 'M'),
('11122233319', 'Helder Linhare', '1990-01-01', 'M'),
('11122233320', 'Humberto E Cruz Jr.', '1990-01-01', 'M'),
('11122233321', 'Jackson G S Souza', '1990-01-01', 'M'),
('11122233322', 'Jaqueline A Papini', '1990-01-01', 'F'),
('11122233323', 'Johnathan Machado', '1990-01-01', 'M'),
('11122233324', 'Jose V Ramalho', '1990-01-01', 'M'),
('11122233325', 'Leonardo A Piedade', '1990-01-01', 'M'),
('11122233326', 'Leonardo M Malta', '1990-01-01', 'M'),
('11122233327', 'Lucas A Melo', '1990-01-01', 'M'),
('11122233328', 'Luiz F S GonÃ§alves', '1990-01-01', 'M'),
('11122233329', 'Luiz H F Mineo', '1990-01-01', 'M'),
('11122233330', 'Marcelo N Faria', '1990-01-01', 'M'),
('11122233331', 'Marco A L GonÃ§alves', '1990-01-01', 'M'),
('11122233332', 'Mariangela  S Simedo', '1990-01-01', 'F'),
('11122233333', 'Maxuel A Alves', '1990-01-01', 'M'),
('11122233334', 'Pablo D Rezende', '1990-01-01', 'M'),
('11122233335', 'Rafael Guersoni Resende', '1990-01-01', 'M'),
('11122233336', 'Raulcezar M F Alves', '1990-01-01', 'M'),
('11122233337', 'Ricardo S Brito', '1990-01-01', 'M'),
('11122233338', 'Rodrigo C CustÃ³dio', '1990-01-01', 'M'),
('11122233339', 'Rubens R Junior', '1990-01-01', 'M'),
('11122233340', 'Rubens S Melo', '1990-01-01', 'M'),
('11122233341', 'Samuel B Andrade', '1990-01-01', 'M'),
('11122233342', 'Thiago C Lopes', '1990-01-01', 'M'),
('11122233343', 'Thiago H Jesus', '1990-01-01', 'M'),
('11122233344', 'Thiago P Queiroz', '1990-01-01', 'M'),
('11122233345', 'Ilmerio R Silva', '1990-01-01', 'M'),
('11122233346', 'Autran Macedo', '1990-01-01', 'M'),
('11122233347', 'Anilton Joaquim', '1990-01-01', 'M'),
('11122233348', 'Claudio Camargo', '1990-01-01', 'M'),
('11122233349', 'Maria AmÃ©lia', '1990-01-01', 'F');

INSERT INTO atleta (idcompetidor, cpf) 	VALUES 
('1', '11122233301'),
('2', '11122233302'),
('3', '11122233303'),
('4', '11122233304'),
('5', '11122233305'),
('6', '11122233306'),
('7', '11122233307'),
('8', '11122233308'),
('9', '11122233309'),
('10', '11122233310'),
('11', '11122233311'),
('12', '11122233312'),
('13', '11122233313'),
('14', '11122233314'),
('15', '11122233315'),
('16', '11122233316'),
('17', '11122233317'),
('18', '11122233318'),
('19', '11122233319'),
('20', '11122233320'),
('21', '11122233321'),
('22', '11122233322'),
('23', '11122233323'),
('24', '11122233324'),
('25', '11122233325'),
('26', '11122233326'),
('27', '11122233327'),
('28', '11122233328'),
('29', '11122233329'),
('30', '11122233330'),
('31', '11122233331'),
('32', '11122233332'),
('33', '11122233333'),
('34', '11122233334'),
('35', '11122233335'),
('36', '11122233336'),
('37', '11122233337'),
('38', '11122233338'),
('39', '11122233339'),
('40', '11122233340'),
('41', '11122233341'),
('42', '11122233342'),
('43', '11122233343'),
('44', '11122233344');

INSERT INTO equipe (idcompetidor, nomeequi) VALUES 
(50, 'Fut Professores'),
(51, 'Fut periodo 1'),
(52, 'Fut periodo 2'),
(53, 'Fut periodo 3'),
(54, 'Fut periodo 4'),
(55, 'Fut periodo 5'),
(56, 'Fut periodo 6'),
(57, 'Fut periodo 7'),
(58, 'Fut periodo 8'),
(59, 'Volei time 1'),
(60, 'Volei time 2'),
(61, 'Natação Comp. masculino'),
(62, 'Natação Comp. feminino');

INSERT INTO atlequ (aidcompetidor, eidcompetidor) VALUES 
('1', '54'),
('2', '54'),
('3', '54'),
('5', '54'),
('6', '54'),
('7', '54'),
('8', '54'),
('9', '54'),
('10', '54'),
('11', '54'),
('4', '59'),
('22', '60'),
('4', '62'),
('22', '62'),
('32', '62'),
('20', '61'),
('21', '61');

INSERT INTO funcionario (cpf) VALUES 
('11122233345'),
('11122233346'),
('11122233347'),
('11122233348'),
('11122233349');

INSERT INTO arbitro (cpf)  VALUES 
('11122233345'),
('11122233346'),
('11122233347'),
('11122233348'),
('11122233349');

INSERT INTO modarb (cpf, idmod) VALUES 
('11122233345', 1),
('11122233345', 5),
('11122233345', 14),
('11122233346', 1),
('11122233347', 5),
('11122233348', 1),
('11122233349', 14);

INSERT INTO local (idlocal, enderecolocal, capacidade, cpf) VALUES 
(default, 'Av. 2 nro 3, Udia-MG', '5000', '11122233348'),
(default, 'Av. 3 nro 2, Udia-MG', '60000', '11122233347'),
(default, 'Av. 1 nro 2, Rio-RJ', '60000', '11122233347');


INSERT INTO modloc (idlocal, idmod) VALUES 
(1, 2),
(1, 7),
(1, 5),
(1, 14),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14);



INSERT INTO competicao (idcompeticao, fase, datacompeticao, horacompeticao, 
		 idcat, idlocal) VALUES 
(default, '0', '2006-07-10', '12:00', 1, 3),
(default, '1', '2006-07-12', '12:00', 1, 3),
(default, 'F', '2006-07-13', '12:00', 1, 3),
(default, '0', '2006-07-14', '12:00', 2, 3),
(default, '1', '2006-07-15', '12:00', 2, 3),
(default, 'F', '2006-07-16', '12:00', 2, 3),
(default, 'F', '2006-07-17', '12:00', 121, 1),
(default, '0', '2006-07-16', '12:00', 3, 3),
(default, '1', '2006-07-17', '12:00', 3, 3),
(default, '0', '2006-07-16', '12:00', 4, 3),
(default, '1', '2006-07-17', '12:00', 4, 3),
(default, '3', '2006-07-17', '12:00', 4, 3);


INSERT INTO participacao (idcompeticao, idcompetidor, 
	escore, unidade) VALUES 
(1, 1, '12.0', 'segundos'),
(1, 2, '13.0', 'segundos'),
(1, 3, '14.0', 'segundos'),
(1, 9, '15.0', 'segundos'),
(1, 5, '16.0', 'segundos'),
(1, 6, '17.0', 'segundos'),
(1, 7, '17.2', 'segundos'),
(1, 8, '17.3', 'segundos'),
(2, 1, '12.5', 'segundos'),
(2, 2, '12.6', 'segundos'),
(2, 3, '12.7', 'segundos'),
(2, 9, '12.8', 'segundos'),
(3, 1, '12.0', 'segundos'),
(3, 2, '11.6', 'segundos'),
(4, 11, '55.0', 'segundos'),
(4, 12, '56.0', 'segundos'),
(4, 13, '57.0', 'segundos'),
(4, 14, '58.0', 'segundos'),
(4, 15, '59.0', 'segundos'),
(4, 16, '60.0', 'segundos'),
(4, 17, '60.1', 'segundos'),
(4, 18, '60.2', 'segundos'),
(5, 11, '54.0', 'segundos'),
(5, 12, '55.0', 'segundos'),
(5, 13, '56.0', 'segundos'),
(5, 14, '57.0', 'segundos'),
(6, 11, '52.0', 'segundos'),
(6, 12, '51.0', 'segundos'),
(7, 59, '3', 'sets'),
(7, 60, '2', 'sets');

/*a) Visão 'nadadores' contendo (nome da pesssoa e o nome da categoria) dos atletas inscritos na
modalidade 'Natacao';*/

CREATE OR REPLACE VIEW nadadores(nome, categoria) AS
SELECT pessoa.nomepessoa, categoria.nomecat
FROM pessoa, categoria, modalidade, inscricao, atleta, competidor
WHERE modalidade.nomemod = 'Natacao' AND 
modalidade.idmod = categoria.idmod AND
categoria.idcat = inscricao.idcat AND
competidor.idcompetidor = inscricao.idcompetidor AND
atleta.idcompetidor = competidor.idcompetidor AND
pessoa.cpf = atleta.cpf;

SELECT * FROM nadadores;

/*b) Visão 'participantes_modalidade1' contendo (nome da categoria e nome do participante) dos
participantes inscritos nas categorias. Os participantes são atletas ou equipes;*/

CREATE OR REPLACE VIEW participantes_modalidades1 (participante, categoria) AS
SELECT pessoa.nomepessoa ,categoria.nomecat
FROM categoria, pessoa, inscricao, atleta
WHERE categoria.idcat = inscricao.idcat AND
	  inscricao.idcompetidor = atleta.idcompetidor AND
	  pessoa.cpf = atleta.cpf 
UNION
SELECT equipe.nomeequi ,categoria.nomecat
FROM categoria, pessoa, inscricao, equipe
WHERE categoria.idcat = inscricao.idcat AND
	  inscricao.idcompetidor = equipe.idcompetidor
ORDER BY nomepessoa;

SELECT * FROM participantes_modalidades1;

/*c) Visão 'patrocinios_evento' contendo soma de valor dos patrocínios para o evento*/

CREATE OR REPLACE VIEW patrocinios_evento (soma) AS
SELECT sum((valor)::numeric(20,2))
FROM patrocinador, patrocinio
WHERE patrocinador.cnpj=patrocinio.cnpj;

SELECT * FROM patrocinios_evento;

/*d) Visão 'patrocinios_atletas1' contendo para cada atleta seu nome e a quantidade de patrocinadores
associados ao atleta;*/

CREATE OR REPLACE VIEW patrocionios_atletas1 (nome, quantidade) AS
SELECT pessoa.nomepessoa, COUNT(*)
FROM pessoa, patrocinio, atleta
WHERE pessoa.cpf = atleta.cpf AND 
atleta.idcompetidor = patrocinio.idcompetidor
GROUP BY nomepessoa;

SELECT * FROM patrocionios_atletas1;
