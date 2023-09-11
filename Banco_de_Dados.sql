CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(20)
);

CREATE TABLE Veiculo (
    VeiculoID INT PRIMARY KEY,
    Modelo VARCHAR(50),
    Ano INT,
    Placa VARCHAR(10),
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

CREATE TABLE Servico (
    ServicoID INT PRIMARY KEY,
    Tipo VARCHAR(50),
    Data DATE,
    Valor DECIMAL(10,2),
    VeiculoID INT,
    FOREIGN KEY (VeiculoID) REFERENCES Veiculo(VeiculoID)
);

INSERT INTO Cliente (ClienteID, Nome, Telefone) VALUES (1, 'João', '123456789');
INSERT INTO Veiculo (VeiculoID, Modelo, Ano, Placa, ClienteID) VALUES (1, 'Fiat Uno', 2015, 'ABC1234', 1);
INSERT INTO Servico (ServicoID, Tipo, Data, Valor, VeiculoID) VALUES (1, 'Troca de Óleo', '2023-09-10', 50.00, 1);

SELECT * FROM Cliente;
SELECT * FROM Veiculo;
SELECT * FROM Servico;

SELECT * FROM Veiculo WHERE Ano > 2010;

SELECT Modelo, Ano, CONCAT(Modelo, ' (', Ano, ')') AS Veiculo_Completo FROM Veiculo;

SELECT * FROM Cliente ORDER BY Nome ASC;

SELECT ClienteID, COUNT(*) AS Total_Servicos FROM Servico GROUP BY ClienteID HAVING COUNT(*) > 1;

SELECT c.Nome, v.Modelo, s.Tipo
FROM Cliente c
JOIN Veiculo v ON c.ClienteID = v.ClienteID
JOIN Servico s ON v.VeiculoID = s.VeiculoID;
