
-- ============================================
-- PROJETO DE ANALISE DE VENDAS
-- Criacao das tabelas e insercao dos dados
-- Banco: PostgreSQL
-- ============================================

-- 1. TABELA DE CLIENTES
CREATE TABLE clientes (
    id_clientes INTEGER PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

-- 2. TABELA DE PRODUTOS
CREATE TABLE produtos (
    id_produto INTEGER PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria VARCHAR(50),
    preco NUMERIC(10,2)
);

-- 3. TABELA DE PEDIDOS
CREATE TABLE pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    data_pedido DATE,

    CONSTRAINT fk_pedidos_clientes
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_clientes)
);

-- 4. TABELA DE ITENS DOS PEDIDOS
CREATE TABLE itens_pedido (
    id_pedido INTEGER,
    id_produto INTEGER,
    quantidade INTEGER,
    preco_unitario NUMERIC(10,2),

    PRIMARY KEY (id_pedido, id_produto),

    CONSTRAINT fk_itens_pedidos
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),

    CONSTRAINT fk_itens_produtos
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
);

-- ============================================
-- INSERCAO DOS DADOS
-- ============================================

-- CLIENTES
INSERT INTO clientes (id_clientes, nome, cidade) VALUES
(1, 'Ana Silva', 'Niterói'),
(2, 'Bruno Costa', 'Rio de Janeiro'),
(3, 'Carla Souza', 'São Paulo'),
(4, 'Daniel Lima', 'Niterói'),
(5, 'Eduarda Alves', 'Belo Horizonte');

-- PRODUTOS
INSERT INTO produtos (id_produto, nome_produto, categoria, preco) VALUES
(1, 'Notebook', 'Eletrônicos', 3500.00),
(2, 'Mouse', 'Acessórios', 80.00),
(3, 'Teclado', 'Acessórios', 150.00),
(4, 'Monitor', 'Eletrônicos', 1200.00),
(5, 'Cadeira Gamer', 'Móveis', 950.00),
(6, 'Headset', 'Acessórios', 220.00),
(7, 'Webcam', 'Eletrônicos', 300.00);

-- PEDIDOS
INSERT INTO pedidos (id_pedido, id_cliente, data_pedido) VALUES
(1, 1, '2026-01-10'),
(2, 2, '2026-01-12'),
(3, 1, '2026-01-15'),
(4, 3, '2026-02-02'),
(5, 4, '2026-02-10'),
(6, 5, '2026-02-15'),
(7, 2, '2026-03-05'),
(8, 3, '2026-03-12');

-- ITENS DOS PEDIDOS
INSERT INTO itens_pedido
(id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(1, 2, 2, 80.00),
(2, 4, 1, 1200.00),
(2, 6, 1, 220.00),
(3, 3, 2, 150.00),
(3, 2, 1, 80.00),
(4, 1, 1, 3500.00),
(4, 7, 1, 300.00),
(5, 5, 1, 950.00),
(5, 6, 2, 220.00),
(6, 4, 2, 1200.00),
(6, 3, 1, 150.00),
(7, 2, 3, 80.00),
(7, 6, 1, 220.00),
(8, 1, 1, 3500.00),
(8, 5, 1, 950.00);

-- ============================================
-- FIM DO SCRIPT
-- ============================================
