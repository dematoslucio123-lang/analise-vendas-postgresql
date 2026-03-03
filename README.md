# 📊 Projeto: Análise de Performance de Vendas (E-commerce)

## 📌 Sobre o Projeto
Este projeto simula o banco de dados de uma loja de tecnologia. O objetivo foi estruturar dados brutos em um ambiente relacional e extrair insights estratégicos para a tomada de decisão.

## 🛠️ Tecnologias e Ferramentas
- **Banco de Dados:** PostgreSQL 16
- **Interface de Gestão:** pgAdmin 4
- **Linguagem:** SQL (DDL, DML e DQL)

## 🚀 O que eu desenvolvi:
1.  **Modelagem de Dados:** Criação de tabelas com chaves primárias e estrangeiras (PK/FK) para garantir a integridade dos dados.
2.  **Consultas Avançadas (JOINs):** União de tabelas de Clientes, Produtos e Vendas para visualização completa dos pedidos.
3.  **Agregadores e Métricas:** Uso de `SUM` e `GROUP BY` para calcular faturamento por produto e categoria.
4.  **Automação com Views:** Criação de uma `VIEW` para simplificar relatórios complexos.

## 🔍 Exemplo de Query Utilizada
Abaixo, a query utilizada para identificar o faturamento total por produto:

```sql
SELECT p.nome_produto, SUM(v.quantidade * p.preco) AS faturamento
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY faturamento DESC;
