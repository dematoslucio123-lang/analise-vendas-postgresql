CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    id_categoria INT REFERENCES categorias(id_categoria)
);

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100),
    estado CHAR(2),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE vendas (
    id_venda SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    id_produto INT REFERENCES produtos(id_produto),
    quantidade INT NOT NULL,
    data_venda DATE NOT NULL
);


INSERT INTO categorias (nome_categoria) VALUES ('Eletrônicos'), ('Acessórios'), ('Informática');

INSERT INTO produtos (nome_produto, preco, id_categoria) VALUES 
('Mouse Gamer', 150.00, 2),
('Monitor 24p', 890.00, 3),
('Teclado Mecânico', 250.00, 2),
('Smartphone X', 2500.00, 1);

INSERT INTO clientes (nome_cliente, estado) VALUES 
('João Silva', 'SP'), ('Maria Souza', 'RJ'), ('Carlos Lima', 'MG'), ('Ana Costa', 'SP');

INSERT INTO vendas (id_cliente, id_produto, quantidade, data_venda) VALUES 
(1, 1, 2, '2023-10-01'), (2, 4, 1, '2023-10-05'), 
(3, 2, 1, '2023-10-10'), (4, 1, 1, '2023-11-02'),
(1, 3, 1, '2023-11-15');


SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM vendas;


SELECT 
    v.id_venda,
    c.nome_cliente,
    p.nome_produto,
    v.quantidade,
    (v.quantidade * p.preco) AS valor_total_venda,
    v.data_venda
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto;

SELECT p.nome_produto, SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY total_vendido DESC;

SELECT cat.nome_categoria, SUM(v.quantidade * p.preco) AS faturamento
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
JOIN categorias cat ON p.id_categoria = cat.id_categoria
GROUP BY cat.nome_categoria;

CREATE VIEW relatorio_vendas_detalhado AS
SELECT v.id_venda, c.nome_cliente, p.nome_produto, (v.quantidade * p.preco) AS total, v.data_venda
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto;


SELECT * FROM relatorio_vendas_detalhado;




CREATE OR REPLACE VIEW relatorio_vendas_detalhado AS
SELECT 
    v.id_venda, 
    c.nome_cliente, 
    p.nome_produto, 
    (v.quantidade * p.preco) AS valor_total, 
    v.data_venda
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto;


SELECT * FROM relatorio_vendas_detalhado;
