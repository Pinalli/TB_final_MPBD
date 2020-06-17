CREATE TABLE CaracteristicaPagamento (
 caracteristica INT,
 tipoPagamento INT
);


CREATE TABLE Categoria (
 categoria INT NOT NULL
);

ALTER TABLE Categoria ADD CONSTRAINT PK_Categoria PRIMARY KEY (categoria);


CREATE TABLE ContaBancaria (
 conta INT NOT NULL,
 numConta INT NOT NULL,
 cpf INT NOT NULL,
 idEntregador INT NOT NULL,
 idEntregador_0 INT NOT NULL,
 cpf_1 INT NOT NULL,
 nunConta INT,
 codSeg INT,
 agencia INT,
 banco INT,
 tipoConta INT
);

ALTER TABLE ContaBancaria ADD CONSTRAINT PK_ContaBancaria PRIMARY KEY (conta,numConta,cpf);


CREATE TABLE Entrega (
 idEntrega INT NOT NULL,
 idEntregador INT NOT NULL,
 cpf INT NOT NULL,
 cpfEntregador INT,
 pedido INT,
 TaxaEntrega FLOAT(10)
);

ALTER TABLE Entrega ADD CONSTRAINT PK_Entrega PRIMARY KEY (idEntrega);


CREATE TABLE Entregador (
 idEntregador INT NOT NULL,
 cpf INT NOT NULL,
 idade INT,
 cnh INT
);

ALTER TABLE Entregador ADD CONSTRAINT PK_Entregador PRIMARY KEY (idEntregador,cpf);


CREATE TABLE Item (
 item INT NOT NULL,
 idItem INT NOT NULL,
 categoria INT NOT NULL,
 valor INT,
 valorUnitario FLOAT(10)
);

ALTER TABLE Item ADD CONSTRAINT PK_Item PRIMARY KEY (item,idItem);


CREATE TABLE Pagamento (
 idPagamento INT NOT NULL,
 tipoPagamento INT
);

ALTER TABLE Pagamento ADD CONSTRAINT PK_Pagamento PRIMARY KEY (idPagamento);


CREATE TABLE Pedido (
 <<ipk> pedido INT,
 cpfCliente INT,
 valor FLOAT(10),
 idPedido INT,
 idPagamento INT NOT NULL,
 conta INT,
 numConta INT,
 cpf INT,
 idCliente INT NOT NULL,
 idEntregador INT NOT NULL
);


CREATE TABLE Pessoa (
 cpf INT NOT NULL,
 telefone INT
);

ALTER TABLE Pessoa ADD CONSTRAINT PK_Pessoa PRIMARY KEY (cpf);


CREATE TABLE Repasse (
 idRepasse INT NOT NULL,
 conta_0 INT NOT NULL,
 numConta_0 INT NOT NULL,
 cpf_0 INT NOT NULL,
 cpf INT,
 conta INT,
 entrega INT,
 idEntrega INT,
 numConta INT,
 valorRepasse FLOAT(10)
);

ALTER TABLE Repasse ADD CONSTRAINT PK_Repasse PRIMARY KEY (idRepasse);


CREATE TABLE Telefone (
 cpf INT NOT NULL
);


CREATE TABLE TipoEndereco (
 tipo CHAR(10)
);


CREATE TABLE TipoPrato (
 tipo INT,
 tipo_prato INT
);


CREATE TABLE Transacao (
 idTransacao INT NOT NULL,
 idPagamento INT NOT NULL,
 situacao INT
);

ALTER TABLE Transacao ADD CONSTRAINT PK_Transacao PRIMARY KEY (idTransacao);


CREATE TABLE blob (
 idEntregador INT NOT NULL,
 cpf INT NOT NULL
);

ALTER TABLE blob ADD CONSTRAINT PK_blob PRIMARY KEY (idEntregador,cpf);


CREATE TABLE Cliente (
 idCliente INT NOT NULL,
 cpf INT NOT NULL
);

ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (idCliente,cpf);


CREATE TABLE Endereco (
 cpf_0 INT,
 idCliente INT NOT NULL,
 idCliente_0 INT NOT NULL,
 cpf INT,
 numero INT,
 id_endereco INT
);


CREATE TABLE ItemPedido (
 <pk>> idItemPedido INT,
 quantidade INT
);


CREATE TABLE Login (
 idLogin INT NOT NULL
);

ALTER TABLE Login ADD CONSTRAINT PK_Login PRIMARY KEY (idLogin);


CREATE TABLE varchar (
 categoria INT NOT NULL,
 item INT NOT NULL,
 idItem INT NOT NULL,
 item_0 INT NOT NULL,
 idItem_0 INT NOT NULL,
 idLogin INT NOT NULL,
 idLogin_0 INT NOT NULL,
 cpf INT NOT NULL
);

ALTER TABLE varchar ADD CONSTRAINT PK_varchar PRIMARY KEY (categoria,item,idItem,item_0,idItem_0,idLogin,idLogin_0,cpf);


CREATE TABLE Cartao (
 nroCartao INT NOT NULL,
 cpf INT NOT NULL,
 idCliente INT NOT NULL,
 agencia INT,
 cvv INT
);

ALTER TABLE Cartao ADD CONSTRAINT PK_Cartao PRIMARY KEY (nroCartao);


CREATE TABLE ItemCardapio (
 item INT,
 valorUnitario FLOAT(10),
 dataCardapio INT
);


CREATE TABLE itemPedido (
 quantidade INT
);


CREATE TABLE MeioPagamento (
 valorCaracteristica INT,
 nroCartao INT
);


CREATE TABLE Date (
 idRepasse INT NOT NULL,
 idEntrega INT NOT NULL,
 idTransacao INT NOT NULL,
 cpf INT NOT NULL
);

ALTER TABLE Date ADD CONSTRAINT PK_Date PRIMARY KEY (idRepasse,idEntrega,idTransacao,cpf);


ALTER TABLE ContaBancaria ADD CONSTRAINT FK_ContaBancaria_0 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);
ALTER TABLE ContaBancaria ADD CONSTRAINT FK_ContaBancaria_1 FOREIGN KEY (idEntregador,cpf) REFERENCES Entregador (idEntregador,cpf);
ALTER TABLE ContaBancaria ADD CONSTRAINT FK_ContaBancaria_2 FOREIGN KEY (idEntregador_0,cpf_1) REFERENCES Entregador (idEntregador,cpf);


ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_0 FOREIGN KEY (idEntregador,cpf) REFERENCES Entregador (idEntregador,cpf);


ALTER TABLE Entregador ADD CONSTRAINT FK_Entregador_0 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);


ALTER TABLE Item ADD CONSTRAINT FK_Item_0 FOREIGN KEY (categoria) REFERENCES Categoria (categoria);


ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_0 FOREIGN KEY (idPagamento) REFERENCES Pagamento (idPagamento);
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_1 FOREIGN KEY (conta,numConta,cpf) REFERENCES ContaBancaria (conta,numConta,cpf);
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2 FOREIGN KEY (idCliente,cpf) REFERENCES Cliente (idCliente,cpf);
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_3 FOREIGN KEY (idEntregador,cpf) REFERENCES Entregador (idEntregador,cpf);


ALTER TABLE Repasse ADD CONSTRAINT FK_Repasse_0 FOREIGN KEY (conta_0,numConta_0,cpf_0) REFERENCES ContaBancaria (conta,numConta,cpf);


ALTER TABLE Telefone ADD CONSTRAINT FK_Telefone_0 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);


ALTER TABLE Transacao ADD CONSTRAINT FK_Transacao_0 FOREIGN KEY (idPagamento) REFERENCES Pagamento (idPagamento);


ALTER TABLE blob ADD CONSTRAINT FK_blob_0 FOREIGN KEY (idEntregador,cpf) REFERENCES Entregador (idEntregador,cpf);


ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_0 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);


ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_0 FOREIGN KEY (cpf_0,idCliente_0) REFERENCES Cliente (cpf,idCliente);
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_1 FOREIGN KEY (idCliente,cpf) REFERENCES Cliente (idCliente,cpf);


ALTER TABLE varchar ADD CONSTRAINT FK_varchar_0 FOREIGN KEY (categoria) REFERENCES Categoria (categoria);
ALTER TABLE varchar ADD CONSTRAINT FK_varchar_1 FOREIGN KEY (item,idItem) REFERENCES Item (item,idItem);
ALTER TABLE varchar ADD CONSTRAINT FK_varchar_2 FOREIGN KEY (item_0,idItem_0) REFERENCES Item (item,idItem);
ALTER TABLE varchar ADD CONSTRAINT FK_varchar_3 FOREIGN KEY (idLogin) REFERENCES Login (idLogin);
ALTER TABLE varchar ADD CONSTRAINT FK_varchar_4 FOREIGN KEY (idLogin_0) REFERENCES Login (idLogin);
ALTER TABLE varchar ADD CONSTRAINT FK_varchar_5 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);


ALTER TABLE Cartao ADD CONSTRAINT FK_Cartao_0 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);
ALTER TABLE Cartao ADD CONSTRAINT FK_Cartao_1 FOREIGN KEY (idCliente,cpf) REFERENCES Cliente (idCliente,cpf);


ALTER TABLE MeioPagamento ADD CONSTRAINT FK_MeioPagamento_0 FOREIGN KEY (nroCartao) REFERENCES Cartao (nroCartao);


ALTER TABLE Date ADD CONSTRAINT FK_Date_0 FOREIGN KEY (idRepasse) REFERENCES Repasse (idRepasse);
ALTER TABLE Date ADD CONSTRAINT FK_Date_1 FOREIGN KEY (idEntrega) REFERENCES Entrega (idEntrega);
ALTER TABLE Date ADD CONSTRAINT FK_Date_2 FOREIGN KEY (idTransacao) REFERENCES Transacao (idTransacao);
ALTER TABLE Date ADD CONSTRAINT FK_Date_3 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);


