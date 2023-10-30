-- Criar o banco de dados
CREATE DATABASE UniversidadeDB;
USE UniversidadeDB;

-- Tabela de Áreas
CREATE TABLE Areas (
    AreaID INT AUTO_INCREMENT PRIMARY KEY,
    NomeArea VARCHAR(50) NOT NULL
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    CursoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCurso VARCHAR(100) NOT NULL,
    AreaID INT,
    FOREIGN KEY (AreaID) REFERENCES Areas(AreaID)
);

-- Tabela de Alunos
CREATE TABLE Alunos (
    AlunoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

-- Tabela Matriculas
CREATE TABLE Matriculas (
    MatriculaID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT,
    CursoID INT,
    DataMatricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AlunoID) REFERENCES Alunos(AlunoID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Inserir Áreas
INSERT INTO Areas (NomeArea) VALUES
('Ciência da Computação'),
('Engenharia Elétrica'),
('Medicina'),
('Direito'),
('Administração'),
('Engenharia Civil'),
('Psicologia'),
('Artes'),
('Matemática'),
('Biologia'),
('História'),
('Física'),
('Economia'),
('Filosofia'),
('Música'),
('Química'),
('Línguas Estrangeiras'),
('Geografia'),
('Educação Física');

-- Inserir Cursos
INSERT INTO Cursos (NomeCurso, AreaID) VALUES
('Bacharelado em Ciência da Computação', 1),
('Engenharia Elétrica', 2),
('Medicina Geral', 3),
('Bacharelado em Direito', 4),
('Administração de Empresas', 5),
('Engenharia Civil', 6),
('Psicologia Clínica', 7),
('Artes Visuais', 8),
('Licenciatura em Matemática', 9),
('Biologia Celular', 10),
('História Antiga', 11),
('Física Aplicada', 12),
('Economia Internacional', 13),
('Filosofia Contemporânea', 14),
('Música Clássica', 15),
('Química Orgânica', 16),
('Inglês Avançado', 17),
('Geografia Humana', 18),
('Educação Física', 19),
('Mestrado em Ciência da Computação', 1);


-- Inserir Alunos
INSERT INTO Alunos (Nome, Sobrenome, Email) VALUES
('João', 'Silva', 'joao.silva@dominio.com'),
('Maria', 'Santos', 'maria.santos@dominio.com'),
('Pedro', 'Ribeiro', 'pedro.ribeiro@dominio.com'),
('Ana', 'Ferreira', 'ana.ferreira@dominio.com'),
('Carlos', 'Lopes', 'carlos.lopes@dominio.com'),
('Sofia', 'Almeida', 'sofia.almeida@dominio.com'),
('Luís', 'Martins', 'luis.martins@dominio.com'),
('Marta', 'Oliveira', 'marta.oliveira@dominio.com'),
('Ricardo', 'Carvalho', 'ricardo.carvalho@dominio.com'),
('Lara', 'Sousa', 'lara.sousa@dominio.com'),
('Hugo', 'Rocha', 'hugo.rocha@dominio.com'),
('Beatriz', 'Fonseca', 'beatriz.fonseca@dominio.com'),
('Paulo', 'Gonçalves', 'paulo.goncalves@dominio.com'),
('Mariana', 'Costa', 'mariana.costa@dominio.com'),
('António', 'Pereira', 'antonio.pereira@dominio.com'),
('Cláudia', 'Rodrigues', 'claudia.rodrigues@dominio.com'),
('Daniel', 'Mendes', 'daniel.mendes@dominio.com'),
('Isabel', 'Pinto', 'isabel.pinto@dominio.com'),
('Fernando', 'Cruz', 'fernando.cruz@dominio.com'),
('Catarina', 'Gomes', 'catarina.gomes@dominio.com');

-- Inserir Matrículas (exemplo com pelo menos 20 registros)
-- Substitua os valores de AlunoID e CursoID pelos IDs reais dos alunos e cursos que você deseja relacionar.

-- Inserir matrícula 1
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (1, 1);

-- Inserir matrícula 2
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (2, 2);

-- Inserir matrícula 3
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (3, 3);

-- Inserir matrícula 4
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (4, 4);

-- Inserir matrícula 5
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (5, 5);

-- Inserir matrícula 6
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (6, 6);

-- Inserir matrícula 7
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (7, 7);

-- Inserir matrícula 8
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (8, 8);

-- Inserir matrícula 9
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (9, 9);

-- Inserir matrícula 10
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (10, 10);

-- Inserir matrícula 11
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (11, 1);

-- Inserir matrícula 12
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (12, 2);

-- Inserir matrícula 13
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (13, 3);

-- Inserir matrícula 14
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (14, 4);

-- Inserir matrícula 15
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (15, 5);

-- Inserir matrícula 16
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (16, 6);

-- Inserir matrícula 17
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (17, 7);

-- Inserir matrícula 18
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (18, 8);

-- Inserir matrícula 19
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (19, 9);

-- Inserir matrícula 20
INSERT INTO Matriculas (AlunoID, CursoID) VALUES (20, 10);


-- Stored Procedure para inserir um novo curso
DELIMITER //
CREATE PROCEDURE InserirCurso(IN nomeCurso VARCHAR(100), IN nomeArea VARCHAR(50))
BEGIN
    DECLARE areaID INT;

    INSERT INTO Areas (NomeArea) VALUES (nomeArea);
    SET areaID = LAST_INSERT_ID();

    INSERT INTO Cursos (NomeCurso, AreaID) VALUES (nomeCurso, areaID);
END;
//
DELIMITER ;

-- Função para obter o ID do curso com base no nome do curso e nome da área
CREATE FUNCTION ObterIDCurso(IN nomeCurso VARCHAR(100), IN nomeArea VARCHAR(50)) RETURNS INT
BEGIN
    DECLARE cursoID INT;

    SELECT CursoID INTO cursoID
    FROM Cursos c
    JOIN Areas a ON c.AreaID = a.AreaID
    WHERE c.NomeCurso = nomeCurso AND a.NomeArea = nomeArea;

    RETURN cursoID;
END;

-- Procedure para fazer a matrícula de um aluno em um curso
DELIMITER //
CREATE PROCEDURE MatricularAluno(
    IN alunoNome VARCHAR(50),
    IN alunoSobrenome VARCHAR(50),
    IN alunoEmail VARCHAR(100),
    IN cursoNome VARCHAR(100),
    IN cursoArea VARCHAR(50)
)
BEGIN
    DECLARE alunoID INT;
    DECLARE cursoID INT;

    -- Verificar se o aluno já está matriculado em algum curso
    SELECT AlunoID INTO alunoID
    FROM Alunos
    WHERE Email = alunoEmail;

    IF alunoID IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O aluno já está matriculado em outro curso';
    END IF;

    -- Inserir o aluno
    INSERT INTO Alunos (Nome, Sobrenome, Email) VALUES (alunoNome, alunoSobrenome, alunoEmail);
    SET alunoID = LAST_INSERT_ID();

    -- Obter o ID do curso
    SET cursoID = ObterIDCurso(cursoNome, cursoArea);

    IF cursoID IS NOT NULL THEN
        -- Matricular o aluno no curso
        INSERT INTO Matriculas (AlunoID, CursoID) VALUES (alunoID, cursoID);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Curso não encontrado';
    END IF;
END;
//
DELIMITER ;
