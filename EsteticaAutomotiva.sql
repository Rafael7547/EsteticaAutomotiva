-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS EsteticaAutomotiva;
USE EsteticaAutomotiva;

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Tabela de profissionais
CREATE TABLE IF NOT EXISTS profissionais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100)
);

-- Tabela de serviços oferecidos
CREATE TABLE IF NOT EXISTS servicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_servico VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- Tabela de agendamentos
CREATE TABLE IF NOT EXISTS agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_profissional INT NOT NULL,
    id_servico INT NOT NULL,
    data_agendamento DATE NOT NULL,
    hora TIME NOT NULL,
    status ENUM('Pendente', 'Confirmado', 'Concluído', 'Cancelado') DEFAULT 'Pendente',
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_profissional) REFERENCES profissionais(id),
    FOREIGN KEY (id_servico) REFERENCES servicos(id)
);

-- Inserindo dados exemplo de usuários
INSERT INTO usuarios (nome, email, senha) VALUES
('João Silva', 'joao@gmail.com', '1234'),
('Maria Souza', 'maria@gmail.com', 'abcd');

-- Inserindo profissionais
INSERT INTO profissionais (nome, especialidade) VALUES
('Carlos Mecânico', 'Polimento'),
('Ana Estética', 'Lavagem Premium'),
('Pedro Restauração', 'Cristalização de Pintura');

-- Inserindo serviços
INSERT INTO servicos (nome_servico, preco) VALUES
('Lavagem Simples', 50.00),
('Lavagem Premium', 80.00),
('Polimento', 120.00),
('Cristalização de Pintura', 200.00);

-- Agendamento exemplo
INSERT INTO agendamentos (id_usuario, id_profissional, id_servico, data_agendamento, hora)
VALUES (1, 2, 2, '2025-06-20', '14:00');

-- Consulta de login (verificação simples)
-- Substitua os dados pelo email e senha informados pelo usuário
SELECT * FROM usuarios WHERE email = 'joao@gmail.com' AND senha = '1234';

-- Visualizar agendamentos
SELECT 
    a.id AS agendamento_id,
    u.nome AS cliente,
    p.nome AS profissional,
    s.nome_servico AS servico,
    a.data_agendamento,
    a.hora,
    a.status
FROM agendamentos a
JOIN usuarios u ON a.id_usuario = u.id
JOIN profissionais p ON a.id_profissional = p.id
JOIN servicos s ON a.id_servico = s.id;

