SELECT banco.nome,
       agencia.nome,
       conta_corrente.numero,
       conta_corrente.digito,
       CLIENTE.nome,
       ct.valor,
       CT.tipo_transacao_id
FROM banco
         JOIN agencia on banco.numero = agencia.banco_numero
         JOIN conta_corrente
              on conta_corrente.banco_numero = banco.numero and agencia.numero = conta_corrente.agencia_numero
         JOIN cliente on conta_corrente.cliente_numero = cliente.numero
         JOIN cliente_transacoes ct
              on conta_corrente.banco_numero = ct.banco_numero and conta_corrente.agencia_numero = ct.agencia_numero and
                 conta_corrente.numero = ct.conta_corrente_numero and
                 conta_corrente.digito = ct.conta_corrente_digito and conta_corrente.cliente_numero = ct.cliente_numero;

select nome, numero
from banco;
select banco_numero, nome, numero
from agencia;

with tbl_tem_banco as (select numero, nome from banco)
select numero, nome
from tbl_tem_banco;

with params as (select 213 as banco_numero),
     tbl_temp_banco as (select numero, nome
                        from banco
                                 join params on params.banco_numero = banco.numero)
select numero, nome
from tbl_temp_banco;

with clientes_e_transacoes AS (select cliente.nome             as cliente_nome,
                                      tipo_transacao.nome      as transacao_nome,
                                      cliente_transacoes.valor as valor
                               from cliente_transacoes
                                        join cliente on cliente.numero = cliente_transacoes.cliente_numero
                                        join tipo_transacao on cliente_transacoes.tipo_transacao_id = tipo_transacao.id)
select *
from clientes_e_transacoes;

with clientes_e_transacoes AS (select cliente.nome             as cliente_nome,
                                      tipo_transacao.nome      as transacao_nome,
                                      cliente_transacoes.valor as valor
                               from cliente_transacoes
                                        join cliente on cliente.numero = cliente_transacoes.cliente_numero
                                        join tipo_transacao on cliente_transacoes.tipo_transacao_id = tipo_transacao.id
                                        join banco on cliente_transacoes.banco_numero = banco.numero and
                                                      banco.nome ilike '%Itaú%')
select cliente_nome, transacao_nome, valor
from clientes_e_transacoes;