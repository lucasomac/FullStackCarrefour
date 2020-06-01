CREATE OR REPLACE VIEW vw_bancos AS
(
SELECT numero, nome, ativo
FROM banco);

CREATE OR REPLACE VIEW vw_bancos_2(banco_numero, banco_nome, banco_ativo) AS
(
SELECT numero, nome, ativo
FROM banco);

create or replace temporary view vw_agencia as
(
select nome
from agencia);

create or replace view vw_bancos_ativos as
(
select numero, nome, ativo
from banco
where ativo is true
    );

insert into vw_bancos_ativos (numero, nome, ativo)
values (51, 'Banco legal', false);

create or replace view vw_bancos_com_a as
(
select numero, nome, ativo
from vw_bancos_ativos
where nome ilike 'a%'
    )
with cascaded check option;

select numero, nome, ativo
from vw_bancos_com_a;

insert into vw_bancos_com_a (numero, nome, ativo)
values (333, 'Alfa Omega', true);
insert into vw_bancos_com_a (numero, nome, ativo)
values (331, 'Alfa Gama', true);

CREATE TABLE IF NOT EXISTS FUNCIONARIOS
(
    ID      SERIAL,
    NOME    VARCHAR(50),
    GERENTE INTEGER,
    PRIMARY KEY (ID),
    FOREIGN KEY (GERENTE) REFERENCES FUNCIONARIOS (ID)
);

INSERT INTO FUNCIONARIOS (NOME, GERENTE)
VALUES ('ANSELMO', NULL);
INSERT INTO FUNCIONARIOS (NOME, GERENTE)
VALUES ('BEATRIZ', 1);
INSERT INTO FUNCIONARIOS (NOME, GERENTE)
VALUES ('MAGNO', 1);
INSERT INTO FUNCIONARIOS (NOME, GERENTE)
VALUES ('CREMILDA', 2);
INSERT INTO FUNCIONARIOS (NOME, GERENTE)
VALUES ('WAGNER', 4);

SELECT ID, NOME, GERENTE
FROM FUNCIONARIOS;

CREATE OR REPLACE RECURSIVE VIEW VW_FUN (ID, GERENTE, FUNCIONARIO) AS
(
SELECT ID, GERENTE, NOME
FROM FUNCIONARIOS
WHERE GERENTE IS NULL
UNION ALL
SELECT FUNCIONARIOS.ID, FUNCIONARIOS.GERENTE, FUNCIONARIOS.NOME
FROM FUNCIONARIOS
         JOIN VW_FUN on FUNCIONARIOS.GERENTE = VW_FUN.GERENTE
    );

SELECT ID, GERENTE, FUNCIONARIO
FROM VW_FUN;