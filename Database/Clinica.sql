CREATE DATABASE pagos DEFAULT CHARACTER SET utf8;
USE pagos;
CREATE TABLE IF NOT EXISTS pagos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    paciente VARCHAR(35) NOT NULL,
    valor INT NOT NULL,
    actividad VARCHAR(35) NOT NULL,
    fecha TIMESTAMP NOT NULL,
    nequi BOOLEAN NOT NULL DEFAULT FALSE,
    datafono BOOLEAN NOT NULL DEFAULT FALSE,
    transferencia BOOLEAN NOT NULL DEFAULT FALSE,
    efectivo BOOLEAN NOT NULL DEFAULT FALSE,
    notas VARCHAR(100) NULL
);

-- Sumar valor de pagos

SELECT SUM(valor) FROM pagos;
INSERT INTO pagos (paciente, valor, actividad, fecha, nequi, datafono, transferencia, efectivo) 
VALUES ('Karol Funeque', 90000, 'Control, Reparaciones', NOW(), FALSE, FALSE, FALSE, TRUE);

-- show table in the day of max value
SELECT * FROM pagos WHERE DATE(fecha) = 
(SELECT DATE(fecha) AS dia FROM pagos GROUP BY dia ORDER BY SUM(valor) DESC LIMIT 1);
