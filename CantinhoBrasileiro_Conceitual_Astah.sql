CREATE TABLE CaracteristicaPagamento (
 caracteristica INT NOT NULL,
 tipoPagamento INT
);

ALTER TABLE CaracteristicaPagamento ADD CONSTRAINT PK_CaracteristicaPagamento PRIMARY KEY (caracteristica);


CREATE TABLE Categoria (
 categoria INT NOT NULL,
 nome CHAR(10)
);

ALTER TABLE Categoria ADD CONSTRAINT PK_Categoria PRIMARY KEY (categoria);


CREATE TABLE ContaBancaria (
 conta INT NOT NULL,
 cpf INT NOT NULL,
 cpf_1 INT NOT NULL,
 nunConta INT,
 codSeg INT,
 agencia INT
);

ALTER TABLE ContaBancaria ADD CONSTRAINT PK_ContaBancaria PRIMARY KEY (conta,cpf);


CREATE TABLE Entrega (
 entrega INT NOT NULL,
 cpf INT NOT NULL,
 pedido INT,
 cpfEntregador INT,
 dataEntrega INT,
 TaxaEntrega INT
);

ALTER TABLE Entrega ADD CONSTRAINT PK_Entrega PRIMARY KEY (entrega);


CREATE TABLE Entregador (
 cpf INT NOT NULL,
 idade INT,
 cnh INT,
 foto INT,
 pedido INT NOT NULL
);

ALTER TABLE Entregador ADD CONSTRAINT PK_Entregador PRIMARY KEY (cpf);


CREATE TABLE Item (
 item INT NOT NULL,
 categoria INT NOT NULL,
 nome INT,
 descricao INT,
 valor INT
);

ALTER TABLE Item ADD CONSTRAINT PK_Item PRIMARY KEY (item);


CREATE TABLE ItemCardapio (
 data INT NOT NULL,
 item (FK) INT,
 valorUnitario INT,
 dataCardapio INT
);

ALTER TABLE ItemCardapio ADD CONSTRAINT PK_ItemCardapio PRIMARY KEY (data);


CREATE TABLE Pedido (
 pedido INT NOT NULL,
 cpf INT,
 conta INT,
 dataPedido INT,
 situacao INT,
 valor DOUBLE PRECISION
);

ALTER TABLE Pedido ADD CONSTRAINT PK_Pedido PRIMARY KEY (pedido);


CREATE TABLE Pessoa (
 cpf INT NOT NULL,
 dataNascimento CHAR(10),
 nome CHAR(10)
);

ALTER TABLE Pessoa ADD CONSTRAINT PK_Pessoa PRIMARY KEY (cpf);


CREATE TABLE Repasse (
 conta_0 INT NOT NULL,
 cpf_0 INT NOT NULL,
 entrega INT,
 cpf INT,
 conta INT,
 valorRepasse INT,
 dataRepasse INT
);


CREATE TABLE Telefone (
 cpf INT NOT NULL
);


CREATE TABLE telefone (
 cpf CHAR(10) NOT NULL,
 numero CHAR(10) NOT NULL,
 cpf_0 INT
);

ALTER TABLE telefone ADD CONSTRAINT PK_telefone PRIMARY KEY (cpf,numero);


CREATE TABLE TipoEndereco (
 idTipo INT NOT NULL,
 tipo CHAR(10)
);

ALTER TABLE TipoEndereco ADD CONSTRAINT PK_TipoEndereco PRIMARY KEY (idTipo);


CREATE TABLE TipoPrato (
 tipo INT,
 tipo_prato INT
);


CREATE TABLE Cartao (
 nroCartao INT NOT NULL,
 cpf INT NOT NULL,
 agencia INT,
 cvv INT
);

ALTER TABLE Cartao ADD CONSTRAINT PK_Cartao PRIMARY KEY (nroCartao);


CREATE TABLE Cliente (
 cpf INT NOT NULL
);

ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (cpf);


CREATE TABLE Date (
 pedido INT NOT NULL,
 cpf INT NOT NULL
);

ALTER TABLE Date ADD CONSTRAINT PK_Date PRIMARY KEY (pedido,cpf);


CREATE TABLE Endereco (
 endereco INT NOT NULL,
 idTipo INT NOT NULL,
 cpf_0 INT NOT NULL,
 idTipo_0 INT NOT NULL,
 cpf INT,
 rua CHAR(10),
 numero INT,
 complemento CHAR(10),
 bairro CHAR(10),
 cidade CHAR(10),
 cep INT
);

ALTER TABLE Endereco ADD CONSTRAINT PK_Endereco PRIMARY KEY (endereco,idTipo,cpf_0);


CREATE TABLE itemPedido (
 pedido INT NOT NULL,
 data INT NOT NULL,
 quantidade INT
);

ALTER TABLE itemPedido ADD CONSTRAINT PK_itemPedido PRIMARY KEY (pedido,data);


CREATE TABLE Login (
 login INT NOT NULL,
 email INT,
 senha INT
);

ALTER TABLE Login ADD CONSTRAINT PK_Login PRIMARY KEY (login);


CREATE TABLE MeioPagamento (
 caracteristica INT NOT NULL,
 pedido INT NOT NULL,
 nroCartao INT,
 valorCaracteristica INT
);

ALTER TABLE MeioPagamento ADD CONSTRAINT PK_MeioPagamento PRIMARY KEY (caracteristica,pedido);


CREATE TABLE varchar (
 categoria INT NOT NULL,
 endereco INT NOT NULL,
 idTipo INT NOT NULL,
 cpf_0 INT NOT NULL,
 endereco_0 INT NOT NULL,
 idTipo_0 INT NOT NULL,
 cpf_0_0 INT NOT NULL,
 endereco_1 INT NOT NULL,
 idTipo_1 INT NOT NULL,
 cpf_0_1 INT NOT NULL,
 endereco_2 INT NOT NULL,
 idTipo_2 INT NOT NULL,
 cpf_0_2 INT NOT NULL
);

ALTER TABLE varchar ADD CONSTRAINT PK_varchar PRIMARY KEY (categoria,endereco,idTipo,cpf_0,endereco_0,idTipo_0,cpf_0_0,endereco_1,idTipo_1,cpf_0_1,endereco_2,idTipo_2,cpf_0_2);


ALTER TABLE ContaBancaria ADD CONSTRAINT FK_ContaBancaria_0 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);
ALTER TABLE ContaBancaria ADD CONSTRAINT FK_ContaBancaria_1 FOREIGN KEY (cpf_1) REFERENCES Entregador (cpf);
ALTER TABLE ContaBancaria ADD CONSTRAINT FK_ContaBancaria_2 FOREIGN KEY (cpf) REFERENCES Entregador (cpf);


ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_0 FOREIGN KEY (cpf) REFERENCES Entregador (cpf);


ALTER TABLE Entregador ADD CONSTRAINT FK_Entregador_0 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);
ALTER TABLE Entregador ADD CONSTRAINT FK_Entregador_1 FOREIGN KEY (pedido) REFERENCES Pedido (pedido);


ALTER TABLE Item ADD CONSTRAINT FK_Item_0 FOREIGN KEY (categoria) REFERENCES Categoria (categoria);


ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_0 FOREIGN KEY (cpf) REFERENCES Entregador (cpf);
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_1 FOREIGN KEY (conta,cpf) REFERENCES ContaBancaria (conta,cpf);
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2 FOREIGN KEY (cpf) REFERENCES Cliente (cpf);


ALTER TABLE Repasse ADD CONSTRAINT FK_Repasse_0 FOREIGN KEY (conta_0,cpf_0) REFERENCES ContaBancaria (conta,cpf);


ALTER TABLE Telefone ADD CONSTRAINT FK_Telefone_0 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);


ALTER TABLE telefone ADD CONSTRAINT FK_telefone_0 FOREIGN KEY (cpf_0) REFERENCES Pessoa (cpf);


ALTER TABLE Cartao ADD CONSTRAINT FK_Cartao_0 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);


ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_0 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);


ALTER TABLE Date ADD CONSTRAINT FK_Date_0 FOREIGN KEY (pedido) REFERENCES Pedido (pedido);
ALTER TABLE Date ADD CONSTRAINT FK_Date_1 FOREIGN KEY (cpf) REFERENCES Pessoa (cpf);


ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_0 FOREIGN KEY (idTipo) REFERENCES TipoEndereco (idTipo);
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_1 FOREIGN KEY (cpf_0) REFERENCES Cliente (cpf);
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2 FOREIGN KEY (idTipo_0) REFERENCES TipoEndereco (idTipo);
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_3 FOREIGN KEY (cpf) REFERENCES Cliente (cpf);


ALTER TABLE itemPedido ADD CONSTRAINT FK_itemPedido_0 FOREIGN KEY (pedido) REFERENCES Pedido (pedido);
ALTER TABLE itemPedido ADD CONSTRAINT FK_itemPedido_1 FOREIGN KEY (data) REFERENCES ItemCardapio (data);


ALTER TABLE MeioPagamento ADD CONSTRAINT FK_MeioPagamento_0 FOREIGN KEY (caracteristica) REFERENCES CaracteristicaPagamento (caracteristica);
ALTER TABLE MeioPagamento ADD CONSTRAINT FK_MeioPagamento_1 FOREIGN KEY (pedido) REFERENCES Pedido (pedido);
ALTER TABLE MeioPagamento ADD CONSTRAINT FK_MeioPagamento_2 FOREIGN KEY (nroCartao) REFERENCES Cartao (nroCartao);


ALTER TABLE varchar ADD CONSTRAINT FK_varchar_0 FOREIGN KEY (categoria) REFERENCES Categoria (categoria);
ALTER TABLE varchar ADD CONSTRAINT FK_varchar_1 FOREIGN KEY (endereco,idTipo,cpf_0) REFERENCES Endereco (endereco,idTipo,cpf_0);
ALTER TABLE varchar ADD CONSTRAINT FK_varchar_2 FOREIGN KEY (endereco_0,idTipo_0,cpf_0_0) REFERENCES Endereco (endereco,idTipo,cpf_0);
ALTER TABLE varchar ADD CONSTRAINT FK_varchar_3 FOREIGN KEY (endereco_1,idTipo_1,cpf_0_1) REFERENCES Endereco (endereco,idTipo,cpf_0);
ALTER TABLE varchar ADD CONSTRAINT FK_varchar_4 FOREIGN KEY (endereco_2,idTipo_2,cpf_0_2) REFERENCES Endereco (endereco,idTipo,cpf_0);
ALTER TABLE varchar ADD CONSTRAINT FK_varchar_5 FOREIGN KEY (cpf_0) REFERENCES Pessoa (cpf);


