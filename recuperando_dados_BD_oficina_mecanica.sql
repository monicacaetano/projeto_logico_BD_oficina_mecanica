-- CONSULTAR OS REGISTROS DA TABELA CLIENTES ORDENANDO O NOME PARA ORDEM CRESCENTE
SELECT * FROM cliente ORDER BY nome;

-- RECUPERAR O NÚMERO DE CLIENTES QUE SOLICITARAM SERVIÇOS
SELECT count(*) FROM cliente c, ordem_de_servico o WHERE c.idcliente = idcliente_os;

-- RECUPERAR O NÚMERO DE SERVIÇOS FORAM SOLICITADOS PELOS CLIENTES
SELECT c.idcliente, nome, count(*) AS numero_de_os FROM cliente c
INNER JOIN ordem_de_servico o ON c.idcliente = o.idcliente_os
GROUP BY idcliente;

-- RECUPERAR OS VEICULOS DE CADA CLIENTE
SELECT * FROM cliente
INNER JOIN veiculo ON idcliente_veiculo = idcliente 
ORDER BY nome;

-- RECUPERAR O N° DE ORDENS DE SERVIÇO CONCLUÍDAS
SELECT count(*) FROM ordem_de_servico WHERE status_servico = 'concluido'; 

-- RECUPERAR A ESPECIALIDADE DE CADA MECANICO
SELECT nome, especialidade FROM mecanico;