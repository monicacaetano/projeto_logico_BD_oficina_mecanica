-- INICIA O DB oficina_mecanica
USE oficina_mecanica;

-- LISTA AS TABELAS
SHOW TABLES;

-- EXCLUIR A PARTE DAQUI PRA BAIXO ANTES DE ENVIAR PARA O GITHUB
-- DESATIVA A VERIFICAÇÃO DA CHAVE ESTRAGEIRA
SET FOREIGN_KEY_CHECKS=0;

-- EXCLUI OS DADOS DAS TABELAS
TRUNCATE cliente;
TRUNCATE mecanico;
TRUNCATE mecanico_responsavel;
TRUNCATE ordem_de_servico;
TRUNCATE peca;
TRUNCATE peca_para_os;
TRUNCATE veiculo;

-- ATIVA A VERIFICAÇÃO DE CHAVE ESTRAGEIRA
SET FOREIGN_KEY_CHECKS=1;
-- /EXCLUIR ATÉ AQUI, INCLUSIVE ESSE COMENTARIO

-- ADICIONA OS CLIENTES: PRIMEIRO NOME, NOME DO MEIO, SOBRENOME, CPF, ENDEREÇO E DATA DE NASCIMENTO
INSERT INTO cliente (nome, cpf, cnpj, endereco, telefone, data_nascimento, email) VALUES
('Maria Rodrigues Souza', NULL, 123456789123456, 'rua Olegario Mac 29, Centro - Rio de Janeiro', 31998696718, '1993-11-06', 'maria@gmail.com'),
('Joao Silva Baiao', 12345678912, NULL, 'rua Floriano 30, Jardim - Sao Paulo', 31998696719, '2022-11-06', 'joao@gmail.com'),
('Jose Barbosa Cruz', 12345678913, NULL, 'rua Predisente 31, Lourdes - Belo Horizonte', 32998696718, '1992-11-06', 'jose@gmail.com'),
('Ana Oliveira Castro', NULL, 123456789123457, 'rua Flores 29, Centro - Santos', 31998696769, '1990-11-06', 'ana@gmail.com'),
('Pedro Maia Luna', 12345678915, NULL, 'rua Carangola 109, Itu - Viçosa', 31998696738, '1989-11-06', 'pedro@gmail.com');

-- VISUALIZA DADOS DA TABELA cliente
SELECT * FROM cliente;

-- ADICIONA OS MECÂNICOS: NOME, CPF, ESPECIALIDADE
INSERT INTO mecanico (nome, cpf, especialidade) VALUES
('Joao Rodrigues Gomes', 12345678914, 'Rodas'),
('Andre Ferreira Baiao', 12345678912, 'Motor'),
('Julio Brito Oliveira', 12345678913, 'Freios');
-- VISUALIZA DADOS DA TABELA mecanico
SELECT * FROM mecanico;

-- ADICIONA OS VEÍCULOS: ID DO CLIENTE, MARCA, MODELO, ANO, PLACA, COR
INSERT INTO veiculo (idcliente_veiculo, marca, modelo, ano, placa, cor) VALUES
('1', 'fiat', 'strada', '2022', 'bra2a18', 'branco'),
('2', 'fiat', 'mobi', '2021', 'rta2a17', 'preto'),
('3', 'volkswagen', 'up', '2019', 'rga1o18', 'branco');
-- VISUALIZA DADOS DA TABELA veiculo
SELECT * FROM veiculo;

-- ADICIONA AS PEÇAS: DESCRIÇÃO, MARCA, MODELO
INSERT INTO peca (descricao, marca, modelo) VALUES
('pneu', 'michelan', 'atr1245'),
('disco de freio', 'aba', 'rsfgk113234');
-- VISUALIZA DADOS DA TABELA peca
SELECT * FROM peca;

-- ADICIONA A ORDEM DE SERVICO: ID VEICULO, ID CLIENTE, NUMERO, DATA_EMISSAO, DESCRICAO, TIPO, STATUS
-- Tipo: revisão, conserto
-- Status: confirmado, em execução, concluído
INSERT INTO ordem_de_servico (idveiculo_os, idcliente_os, numero, data_emissao, descricao, tipo, status_servico) VALUES
('1', 3, '12354', '2022-11-09', 'trocar pneu', 'conserto', 'confirmado'),
('2', 2, '12356', '2022-11-01', 'trocar pastilha de freio', 'conserto', 'em_execucao'),
('3', 4, '13354', '2022-10-09', 'revisao periodica', 'revisao', 'concluido');
-- VISUALIZA DADOS DA TABELA ordem_de_servico
SELECT * FROM ordem_de_servico;

-- ADICIONA OS MECÂNICOS RESPONSÁVEIS: ID DO MECANICO, ID DA ORDEM DE SERVIÇO,
INSERT INTO mecanico_responsavel (idmecanico_responsavel, id_os_mecanico_responsavel) VALUES
(1, 1),
(2, 2),
(3, 3);
-- VISUALIZA DADOS DA TABELA mecanico_responsavel
SELECT * FROM mecanico_responsavel;

-- ADICIONA AS PEÇAS USADAS EM CADA ORDEM DE SERVIÇO: ID DA PEÇA, ID DA ORDEM DE SERVIÇO, QUANTIDADE, VALOR UNITÁRIO 
INSERT INTO peca_para_os (idpeca_pecaparaos, idordem_de_servico_pecaparaos, quantidade, valor_unitario) VALUES
(1, 1, 2, 500),
(2, 2, 1, 150),
(1, 3, 1, 500);
-- VISUALIZA DADOS DA TABELA mecanico_responsavel
SELECT * FROM peca_para_os;

