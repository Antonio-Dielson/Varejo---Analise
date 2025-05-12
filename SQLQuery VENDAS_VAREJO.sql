--Quantidade Total Vendido por Loja
SELECT
	l.Nome,
	l.Região,
	l.Cidade,
	SUM( v.Quantidade) AS Quantidade_Total_Vendida
FROM
	dbo.vendas v
	INNER JOIN dbo.lojas l
	ON l.Loja_ID = v.Loja_ID
GROUP BY 
	l.Nome, l.Região, l.Cidade;

--Total de Vendas por Tipo de Canal
SELECT
	v.Loja_ID,
	l.Nome,
	v.[Canal de Venda],
	COUNT(*) AS Total_Vendas
FROM
	dbo.vendas v
	INNER JOIN dbo.lojas l
		ON l.Loja_ID = v.Loja_ID
GROUP BY 
	v.Loja_ID, l.Nome, v.[Canal de Venda];

--Total Lucro Bruto por Cidade
SELECT
	l.Cidade,
	SUM(v.Quantidade * p.[Lucro Bruto]) AS Lucro_Total
FROM
	dbo.vendas v
	INNER JOIN dbo.lojas l ON v.Loja_ID = l.Loja_ID
	INNER JOIN dbo.produtos p ON v.Produto_ID = p.Produto_ID
GROUP BY
	l.Cidade;

-- 
