
-- PROJETO: ANALISE DE VENDAS
-- Banco de dados: projeto_vendas

-- 1. Consultar todos os clientes
SELECT *
FROM clientes;

-- 2. Calcular o valor de cada pedido
SELECT
    id_pedido,
    SUM(quantidade * preco_unitario) AS valor_total
FROM itens_pedido
GROUP BY id_pedido
ORDER BY id_pedido;

-- 3. Calcular o total gasto por cliente
SELECT
    c.nome,
    SUM(ip.quantidade * ip.preco_unitario) AS total_gasto
FROM clientes c
JOIN pedidos p
    ON c.id_clientes = p.id_cliente
JOIN itens_pedido ip
    ON p.id_pedido = ip.id_pedido
GROUP BY c.id_clientes, c.nome
ORDER BY total_gasto DESC;

-- 4. Descobrir os produtos mais vendidos
SELECT
    pr.nome_produto,
    SUM(ip.quantidade) AS total_vendido
FROM produtos pr
JOIN itens_pedido ip
    ON pr.id_produto = ip.id_produto
GROUP BY pr.id_produto, pr.nome_produto
ORDER BY total_vendido DESC;

-- 5. Calcular o faturamento por categoria
SELECT
    pr.categoria,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM produtos pr
JOIN itens_pedido ip
    ON pr.id_produto = ip.id_produto
GROUP BY pr.categoria
ORDER BY faturamento DESC;

-- 6. Analisar o faturamento mensal
SELECT
    DATE_TRUNC('month', p.data_pedido)::date AS mes,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM pedidos p
JOIN itens_pedido ip
    ON p.id_pedido = ip.id_pedido
GROUP BY DATE_TRUNC('month', p.data_pedido)
ORDER BY mes;
