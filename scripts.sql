-- Criação da tabela Conta
CREATE TABLE Conta (
    ID_Conta INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome_Cliente VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    Saldo DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    Data_Criacao DATE NOT NULL
);

-- Criação da tabela Transacao
CREATE TABLE Transacao (
    ID_Transacao INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Conta_Origem INTEGER NOT NULL,
    ID_Conta_Destino INTEGER NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Data_Transacao DATE NOT NULL,
    Tipo_Transacao VARCHAR(50) NOT NULL,  -- Ex: "Transferência", "Depósito", etc.
    FOREIGN KEY (ID_Conta_Origem) REFERENCES Conta(ID_Conta),
    FOREIGN KEY (ID_Conta_Destino) REFERENCES Conta(ID_Conta)
);

-- Criação da tabela Emprestimo
CREATE TABLE Emprestimo (
    ID_Emprestimo INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Conta INTEGER NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Data_Solicitacao DATE NOT NULL,
    Juros DECIMAL(5, 2) NOT NULL,  -- Percentual de juros (ex: 3.5 para 3.5%)
    Prazo INTEGER NOT NULL,         -- Prazo em meses
    FOREIGN KEY (ID_Conta) REFERENCES Conta(ID_Conta)
);

-- Criação da tabela CartaoCredito
CREATE TABLE CartaoCredito (
    ID_Cartao INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Conta INTEGER NOT NULL,
    Limite DECIMAL(10, 2) NOT NULL,
    Data_Aprovacao DATE NOT NULL,
    Fatura_Atual DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (ID_Conta) REFERENCES Conta(ID_Conta)
);

-- Criação da tabela PagamentoServico
CREATE TABLE PagamentoServico (
    ID_Pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Conta INTEGER NOT NULL,
    Servico VARCHAR(100) NOT NULL,  -- Ex: "Luz", "Água", "Internet", etc.
    Valor DECIMAL(10, 2) NOT NULL,
    Data_Pagamento DATE NOT NULL,
    FOREIGN KEY (ID_Conta) REFERENCES Conta(ID_Conta)
);
