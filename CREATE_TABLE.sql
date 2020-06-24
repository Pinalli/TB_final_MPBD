CREATE TABLE CategoriasItens (
 id_categoria_item RAW(32) DEFAULT sys_guid() NOT NULL primary key,
 nome VARCHAR(30) NOT NULL,
 subtipo RAW(32) references CategoriasItens
);


CREATE TABLE Itens (
 id_item RAW(32) DEFAULT sys_guid() NOT NULL,
 id_categoria_item RAW(32) DEFAULT sys_guid(),
 nome VARCHAR(30) NOT NULL,
 descricao VARCHAR(40),
 preco NUMERIC(8,2) NOT NULL
);

ALTER TABLE Itens ADD CONSTRAINT PK_Itens PRIMARY KEY (id_item);

CREATE UNIQUE INDEX ak_itens ON Itens (id_categoria_item);


CREATE TABLE ItensCardapios (
 id_item_cardapio RAW(32) DEFAULT sys_guid() NOT NULL,
 data_cardapio CHAR(10) NOT NULL,
 id_item RAW(32) DEFAULT sys_guid() NOT NULL
);

ALTER TABLE ItensCardapios ADD CONSTRAINT PK_ItensCardapios PRIMARY KEY (id_item_cardapio);

CREATE UNIQUE INDEX ak_itens_cardapios ON ItensCardapios (id_item,data_cardapio);


CREATE TABLE Pessoas (
 cpf VARCHAR(11) NOT NULL,
 nome VARCHAR(50) NOT NULL,
 data_nascimento DATE NOT NULL,
 telefone NUMERIC(9) NOT NULL
);

ALTER TABLE Pessoas ADD CONSTRAINT PK_Pessoas PRIMARY KEY (cpf);


CREATE TABLE TiposEnderecos (
 id_tipo_endereco RAW(32) DEFAULT sys_guid() NOT NULL,
 tipo VARCHAR(30) NOT NULL
);

ALTER TABLE TiposEnderecos ADD CONSTRAINT PK_TiposEnderecos PRIMARY KEY (id_tipo_endereco);


CREATE TABLE Clientes (
 id_cliente RAW(32) DEFAULT sys_guid() NOT NULL,
 cpf VARCHAR(11) NOT NULL
);

ALTER TABLE Clientes ADD CONSTRAINT PK_Clientes PRIMARY KEY (id_cliente);

CREATE UNIQUE INDEX ak_clientes ON Clientes (cpf);


CREATE TABLE Enderecos (
 id_endereco RAW(32) DEFAULT sys_guid() NOT NULL,
 id_tipo_endereco RAW(32) DEFAULT sys_guid(),
 id_cliente RAW(32) DEFAULT sys_guid() NOT NULL,
 cidade VARCHAR(30) NOT NULL,
 bairro VARCHAR(30) NOT NULL,
 numero NUMERIC(4) NOT NULL,
 complemento VARCHAR(30)
);

ALTER TABLE Enderecos ADD CONSTRAINT PK_Enderecos PRIMARY KEY (id_endereco);

CREATE UNIQUE INDEX ak_enderecos ON Enderecos (id_cliente,id_tipo_endereco);


CREATE TABLE Entregadores (
 id_entregador RAW(32) DEFAULT sys_guid() NOT NULL,
 cpf VARCHAR(11) NOT NULL,
 cnh VARCHAR(20) NOT NULL,
 foto BLOB
);

ALTER TABLE Entregadores ADD CONSTRAINT PK_Entregadores PRIMARY KEY (id_entregador);

CREATE UNIQUE INDEX ak_entregadores ON Entregadores (cpf);


CREATE TABLE Logins (
 id_login RAW(32) DEFAULT sys_guid() NOT NULL,
 cpf VARCHAR(11) NOT NULL,
 usuario VARCHAR(15) NOT NULL,
 senha VARCHAR(20) NOT NULL
);

ALTER TABLE Logins ADD CONSTRAINT PK_Logins PRIMARY KEY (id_login);

CREATE UNIQUE INDEX ak_logins ON Logins (cpf,usuario);


CREATE TABLE Cartoes (
 id_cartao RAW(32) DEFAULT sys_guid() NOT NULL,
 id_cliente RAW(32) DEFAULT sys_guid() NOT NULL,
 nro_cartao NUMERIC(15) NOT NULL,
 cvv NUMERIC(4) NOT NULL,
 agencia NUMERIC(4) NOT NULL
);

ALTER TABLE Cartoes ADD CONSTRAINT PK_Cartoes PRIMARY KEY (id_cartao);

CREATE UNIQUE INDEX ak_cartoes ON Cartoes (id_cliente,nro_cartao);


CREATE TABLE ContasBancarias (
 id_conta_bancaria CHAR(10) DEFAULT 'sys_guid()' NOT NULL,
 id_entregador RAW(32) DEFAULT sys_guid() NOT NULL,
 nro_conta CHAR(15) NOT NULL,
 agencia NUMERIC(4) NOT NULL,
 tipo_conta VARCHAR(15) NOT NULL,
 banco VARCHAR(15) NOT NULL
);

ALTER TABLE ContasBancarias ADD CONSTRAINT PK_ContasBancarias PRIMARY KEY (id_conta_bancaria);

CREATE UNIQUE INDEX ak_contas_bancarias ON ContasBancarias (nro_conta,id_entregador);


CREATE TABLE Transacoes (
 id_transacao RAW(32) DEFAULT sys_guid() NOT NULL,
 id_cartao RAW(32) DEFAULT sys_guid() NOT NULL,
 data_transacao DATE NOT NULL,
 situacao VARCHAR(15) DEFAULT 'Em análise' NOT NULL
);

ALTER TABLE Transacoes ADD CONSTRAINT PK_Transacoes PRIMARY KEY (id_transacao);

CREATE UNIQUE INDEX ak_transacoes ON Transacoes (id_cartao);


CREATE TABLE Pagamentos (
 id_pagamento RAW(32) DEFAULT sys_guid() NOT NULL,
 id_transacao RAW(32) DEFAULT sys_guid(),
 tipo_pagamento VARCHAR(15) NOT NULL
);

ALTER TABLE Pagamentos ADD CONSTRAINT PK_Pagamentos PRIMARY KEY (id_pagamento);

CREATE UNIQUE INDEX ak_pagamentos ON Pagamentos (id_transacao);


CREATE TABLE Pedidos (
 id_pedido RAW(32) DEFAULT sys_guid() NOT NULL,
 id_cliente RAW(32) DEFAULT sys_guid() NOT NULL,
 id_pagamento RAW(32) DEFAULT sys_guid() NOT NULL,
 data DATE NOT NULL,
 valor_total NUMERIC(8,2) NOT NULL,
 situacao VARCHAR(15) NOT NULL
);

ALTER TABLE Pedidos ADD CONSTRAINT PK_Pedidos PRIMARY KEY (id_pedido);

CREATE UNIQUE INDEX ak_pedidos ON Pedidos (id_cliente,id_pagamento);


CREATE TABLE Entregas (
 id_entrega RAW(32) DEFAULT sys_guid() NOT NULL,
 id_pedido RAW(32) DEFAULT sys_guid() NOT NULL,
 id_entregador RAW(32) DEFAULT sys_guid() NOT NULL,
 taxa_entrega CHAR(10),
 data_entrega CHAR(10)
);

ALTER TABLE Entregas ADD CONSTRAINT PK_Entregas PRIMARY KEY (id_entrega);

CREATE UNIQUE INDEX ak_entregas ON Entregas (id_pedido,id_entregador);


CREATE TABLE ItensPedidos (
 id_item_pedido RAW(32) DEFAULT sys_guid() NOT NULL,
 id_item_cardapio RAW(32) DEFAULT sys_guid() NOT NULL,
 id_pedido RAW(32) DEFAULT sys_guid() NOT NULL,
 quantidade CHAR(10),
 valor_unitario CHAR(10)
);

ALTER TABLE ItensPedidos ADD CONSTRAINT PK_ItensPedidos PRIMARY KEY (id_item_pedido);

CREATE UNIQUE INDEX ak_itens_pedidos ON ItensPedidos (id_item_cardapio,id_pedido);


CREATE TABLE Repasses (
 id_repasse RAW(32) DEFAULT sys_guid() NOT NULL,
 id_entrega RAW(32) DEFAULT sys_guid() NOT NULL,
 id_conta_bancaria CHAR(10) DEFAULT 'sys_guid()' NOT NULL,
 data_repasse DATE NOT NULL,
 valor_repasse NUMERIC(8,2) NOT NULL
);

ALTER TABLE Repasses ADD CONSTRAINT PK_Repasses PRIMARY KEY (id_repasse);

CREATE UNIQUE INDEX ak_repasses ON Repasses (id_entrega,id_conta_bancaria);


ALTER TABLE Itens ADD CONSTRAINT FK_Itens_0 FOREIGN KEY (id_categoria_item) REFERENCES CategoriasItens (id_categoria_item);


ALTER TABLE ItensCardapios ADD CONSTRAINT FK_ItensCardapios_0 FOREIGN KEY (id_item) REFERENCES Itens (id_item);


ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes_0 FOREIGN KEY (cpf) REFERENCES Pessoas (cpf);


ALTER TABLE Enderecos ADD CONSTRAINT FK_Enderecos_0 FOREIGN KEY (id_tipo_endereco) REFERENCES TiposEnderecos (id_tipo_endereco);
ALTER TABLE Enderecos ADD CONSTRAINT FK_Enderecos_1 FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente);


ALTER TABLE Entregadores ADD CONSTRAINT FK_Entregadores_0 FOREIGN KEY (cpf) REFERENCES Pessoas (cpf);


ALTER TABLE Logins ADD CONSTRAINT FK_Logins_0 FOREIGN KEY (cpf) REFERENCES Pessoas (cpf);


ALTER TABLE Cartoes ADD CONSTRAINT FK_Cartoes_0 FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente);


ALTER TABLE ContasBancarias ADD CONSTRAINT FK_ContasBancarias_0 FOREIGN KEY (id_entregador) REFERENCES Entregadores (id_entregador);


ALTER TABLE Transacoes ADD CONSTRAINT FK_Transacoes_0 FOREIGN KEY (id_cartao) REFERENCES Cartoes (id_cartao);


ALTER TABLE Pagamentos ADD CONSTRAINT FK_Pagamentos_0 FOREIGN KEY (id_transacao) REFERENCES Transacoes (id_transacao);


ALTER TABLE Pedidos ADD CONSTRAINT FK_Pedidos_0 FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente);
ALTER TABLE Pedidos ADD CONSTRAINT FK_Pedidos_1 FOREIGN KEY (id_pagamento) REFERENCES Pagamentos (id_pagamento);


ALTER TABLE Entregas ADD CONSTRAINT FK_Entregas_0 FOREIGN KEY (id_pedido) REFERENCES Pedidos (id_pedido);
ALTER TABLE Entregas ADD CONSTRAINT FK_Entregas_1 FOREIGN KEY (id_entregador) REFERENCES Entregadores (id_entregador);


ALTER TABLE ItensPedidos ADD CONSTRAINT FK_ItensPedidos_0 FOREIGN KEY (id_item_cardapio) REFERENCES ItensCardapios (id_item_cardapio);
ALTER TABLE ItensPedidos ADD CONSTRAINT FK_ItensPedidos_1 FOREIGN KEY (id_pedido) REFERENCES Pedidos (id_pedido);


ALTER TABLE Repasses ADD CONSTRAINT FK_Repasses_0 FOREIGN KEY (id_entrega) REFERENCES Entregas (id_entrega);
ALTER TABLE Repasses ADD CONSTRAINT FK_Repasses_1 FOREIGN KEY (id_conta_bancaria) REFERENCES ContasBancarias (id_conta_bancaria);


