SELECT * FROM demo;

CREATE DATABASE pizzaria
use pizzaria

CREATE TABLE pizza(
  idPizza INTEGER PRIMARY KEY AUTOINCREMENT,
  nomePizza CHAR(50),
  preco FLOAT,
  ingredientes TEXT 
)

INSERT INTO pizza(nomepizza, preco, ingredientes) 
VALUES ('pizza portuguesa', 51.99, 'Presunto, cebola, e mussarela'),
('pizza peito de peru', 57.99, 'peito de peru com mussarela'),
('pizza batata suprema', 62.90, 'bata frita coberta com cheddar, mussarela e bacon'),
('pizza quatro queijos', 55.99, 'mussarela, catupiry, gorgonzola,parmessão, mollho de tomate e azeitonas');

SELECT * FROM pizza


CREATE TABLE cliente(
	idCliente INTEGER PRIMARY KEY AUTOINCREMENT,
  	nomeCliente CHAR(50),
  	telefone char(14),
  	endereco CHAR (30) 
)

insert into cliente (nomeCliente, telefone, endereco) VALUES
("Angélica", "149911223344", "Brás 124"),
("Marta", "11940550731", "Rua João Reis Lacerda, 87"),
("Pedro", "179232443564", "Av. belem, 184"),
("Lucas", "219851522455844", "Rua 25 março, 14261");

SELECT * FROM cliente

create table pedidos (
  idPedido integer PRIMARY key AUTOINCREMENT,
  idPizza int, 
  idCliente INT,
  data datetime,
  FOREIGN KEY (idpizza) REFERENCES pizza(idpizza),
   FOREIGN KEY (idcliente) REFERENCES cliente(idcliente)
  )
  
    insert into pedidos (idCliente, idpizza,  data) VALUES
(1, 1, '2020-12-02 19:45:11'),
(1, 2, '2020-12-05 20:18:23'),
(1, 2, '2020-12-05 22:45:15'),
(2, 3, '2020-12-07 21:15:15'),
(2, 4, '2021-12-07 12:15:32'),
(2, 1, '2020-12-09 19:01:49'),
(3, 4, '2020-12-15 18:50:47'),
(3, 2, '2020-12-17 20:42:08'),
(2, 3, '2020-12-19 22:34:11'),
(4, 2, '2020-11-20 22:23:37'),
(4, 4, datetime('now')); 
  
  SELECT * FROM pedidos

--Mostrar quantas vezes cada pizza foi pedida
    SELECT pz.nomepizza, COUNT (p.idpizza) AS " Número de vezes que uma pizza foi pedida"
FROM pizza pz, pedidos p
INNER JOIN pizza ON pz.idPizza = p.idpizza
GROUP BY pz.nomepizza 
ORDER by  COUNT (p.idpizza) DESC
;

--Mostrar o nome do cliente, data, hora e qual é a pizza que ele pediu
SELECT cliente.nomeCliente AS "Cliente", pedidos.data AS "Data e Hora", pizza.nomePizza as "Pedido"
FROM pedidos
INNER JOIN cliente ON pedidos.idCliente = cliente.idCliente
INNER JOIN pizza ON pedidos.idPizza = pizza.idPizza; 
