DROP DATABASE IF EXISTS barber;

CREATE DATABASE barber;
USE barber;

CREATE TABLE user (
    id int NOT NULL AUTO_INCREMENT,
    email varchar(255) NOT NULL UNIQUE,
    senha char(64) NOT NULL,
    salt  char(96) NOT NULL,
    cargo varchar(30) NOT NULL,
    token varchar(255),
    PRIMARY KEY (id),
    CHECK (cargo = 'FUNCIONARIO' OR cargo = 'CLIENTE')
);

CREATE TRIGGER ucase_insert BEFORE INSERT ON user FOR EACH ROW
SET NEW.email = LOWER(NEW.email), NEW.senha = UPPER(NEW.senha), NEW.salt = UPPER(NEW.salt);

CREATE TRIGGER ucase_update BEFORE UPDATE ON user FOR EACH ROW
SET NEW.email = LOWER(NEW.email), NEW.senha = UPPER(NEW.senha), NEW.salt = UPPER(NEW.salt);

INSERT INTO user (email, senha, salt, cargo)
VALUES ('admin@barbershop.com',
		'8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918',
		'9FCD52BABCE64865C7FF54FEE0B2F85E27E2EFF3F2C4D6FE8A22442FBE64B80B5F54B3EEEE6CD327C899EBD558FE3635',
		'FUNCIONARIO');