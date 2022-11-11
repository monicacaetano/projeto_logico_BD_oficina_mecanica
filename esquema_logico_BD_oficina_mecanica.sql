-- CRIAR O BANCO DE DADOS
-- DROP DATABASE oficina_mecanica;
CREATE DATABASE oficina_mecanica;
USE oficina_mecanica;

 
 -- CRIAR TABELA CLIENTE: ID DO CLIENTE, NOME, CPF, CNPJ, ENDEREÇO, TELEFONE, DATA DE NASCIMENTO, E-MAIL 
 CREATE TABLE cliente(
 idcliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (45) NOT NULL,
    cpf VARCHAR(11),
    cnpj VARCHAR(15),
    endereco VARCHAR(45),
    telefone VARCHAR(11),
    data_nascimento DATE,
    email VARCHAR(15),
		CONSTRAINT cpf_unico_cliente UNIQUE (cpf),
		CONSTRAINT cnpj_unico_cliente UNIQUE (cnpj)
   );
   
ALTER TABLE cliente AUTO_INCREMENT=1;
   
-- CRIAR TABELA VEÍCULO: ID DO VEÍCULO, ID DO CLIENTE, MARCA, MODELO, ANO, PLACA, COR 
CREATE TABLE veiculo(
 idveiculo INT AUTO_INCREMENT PRIMARY KEY,
	idcliente_veiculo INT,
	marca VARCHAR (45) NOT NULL,
	modelo VARCHAR(45) NOT NULL,
	ano INT NOT NULL,
	placa VARCHAR(45) NOT NULL,
	cor VARCHAR(45) NOT NULL,
		CONSTRAINT fk_cliente_veiculo FOREIGN KEY (idcliente_veiculo) REFERENCES cliente (idcliente)
        ON UPDATE CASCADE
   );
   
ALTER TABLE veiculo AUTO_INCREMENT=1;
   
-- CRIAR TABELA ORDEM DE SERVIÇO: ID DA ORDEM DE SERVIÇO, ID DO VEÍCULO, ID DO CLIENTE, NÚMERO, DATA DE EMISSÃO, DESCRIÇÃO, TIPO, STATUS
-- Tipo: revisão, conserto
-- Status: em execução, concluído
CREATE TABLE ordem_de_servico(
 idordem_de_servico INT AUTO_INCREMENT PRIMARY KEY,
	idveiculo_os INT,
	idcliente_os INT,
	numero INT NOT NULL,
	data_emissao DATE,
	descricao VARCHAR(45) NOT NULL,
    tipo ENUM('revisao', 'conserto'),
	status_servico ENUM('confirmado', 'em_execucao', 'concluido') DEFAULT 'confirmado',
		CONSTRAINT unico_numero UNIQUE (numero),
		CONSTRAINT fk_veiculo_os FOREIGN KEY (idveiculo_os) REFERENCES veiculo (idveiculo),
        CONSTRAINT fk_cliente_os FOREIGN KEY (idcliente_os) REFERENCES cliente (idcliente)
        ON UPDATE CASCADE
   );
   
ALTER TABLE ordem_de_servico AUTO_INCREMENT=1;
   
-- CRIAR TABELA MECÂNICO: NOME, CPF, ESPECIALIDADE
CREATE TABLE mecanico(
 idmecanico INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	especialidade VARCHAR(45) NOT NULL,
    CONSTRAINT cpf_unico_mecanico UNIQUE (cpf)
);
   
ALTER TABLE mecanico AUTO_INCREMENT=1;

-- CRIAR TABELA MECÂNICO_RESPONSÁVEL: ID DO MECÂNICO RESPONSÁVEL, ID DA ORDEM DE SERVIÇO
CREATE TABLE mecanico_responsavel(
 idmecanico_responsavel INT NOT NULL,
	id_os_mecanico_responsavel INT NOT NULL,
	CONSTRAINT fk_mec_resp FOREIGN KEY (idmecanico_responsavel) REFERENCES mecanico (idmecanico),
	CONSTRAINT fk_os_mec_resp FOREIGN KEY (id_os_mecanico_responsavel) REFERENCES ordem_de_servico (idordem_de_servico)
);

-- CRIAR TABELA PEÇA: DESCRIÇÃO, MARCA, MODELO
CREATE TABLE peca(
 idpeca INT AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(45) NOT NULL,
	marca VARCHAR(45) NOT NULL,
    modelo VARCHAR(45) NOT NULL
);

ALTER TABLE peca AUTO_INCREMENT=1;

-- CRIAR TABELA PEÇA PARA ORDEM DE SERVIÇO: ID DA PEÇA, ID DA ORDEM DE SERVIÇO, QUANTIDADE, VALOR UNITÁRIO
CREATE TABLE peca_para_os(
 idpeca_pecaparaos INT NOT NULL,
	idordem_de_servico_pecaparaos INT NOT NULL,
    quantidade INT,
	valor_unitario INT, 
    CONSTRAINT fk_peca_os FOREIGN KEY (idpeca_pecaparaos) REFERENCES peca (idpeca),
	CONSTRAINT fk_os_peca FOREIGN KEY (idordem_de_servico_pecaparaos) REFERENCES ordem_de_servico (idordem_de_servico)
);


