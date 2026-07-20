-- ============================================================================
-- DML_FeVias_operacao.sql
--
-- Camada OPERACIONAL da POC. Roda DEPOIS de DDL_FeVias.sql e DML_FeVias.sql.
-- O arquivo original DML_FeVias.sql NAO e alterado (permanece como registro
-- autentico da modelagem original); este arquivo apenas:
--
--   (D) corrige dois problemas de dados que o seed original deixou passar; e
--   (B) popula as 5 tabelas de evento que estavam vazias, com um cenario
--       sintetico e coerente de ~1 semana de operacao, para que a rede de
--       troca de bateria efetivamente rode e possa ser consultada.
--
-- Os IDs abaixo seguem a ordem das sequences do seed original (start 1):
--   locomotiva 1..4  | estacao 1..16 | bateria 1..7 | vagao 1..12 | empresa 1..2
-- Baterias e suas cargas: b1=75 b2=37 b3=44 b4=75 b5=92 b6=47 b7=52.
-- Todos os literais de texto sao ASCII de proposito (evita conflito de charset
-- no carregamento).
-- ============================================================================

SET DEFINE OFF

-- ---------------------------------------------------------------------------
-- (D) CORRECOES DE DADOS
-- ---------------------------------------------------------------------------

-- Correcao 1: a linha "Malha Paulista" apontava id_concessionaria para a
-- sequence de LINHA (sq_sif_linha.currval) em vez da de concessionaria -- um
-- deslize de currval. Reaponta para a Rumo S/A (id_concessionaria = 2), a
-- operadora real da Malha Paulista.
UPDATE t_sif_linha
   SET id_concessionaria = 2
 WHERE id_linha = 4
   AND nm_linha = 'Malha Paulista';

-- Correcao 2: o seed marcou TODA estacao como carregavel ('S'), o que tornava
-- qualquer analise de cobertura de recarga sem sentido. Marca tres estacoes
-- do interior como ainda nao eletrificadas ('N'), refletindo um rollout por
-- fases -- e criando lacunas reais de recarga para a analise encontrar.
--   5  = Estacao de Caxias      (trecho 3)
--   8  = Estacao de Altos       (trecho 4)
--   11 = Estacao de Nova Russas (trecho 3)
UPDATE t_sif_estacao
   SET vr_carrega_bateria = 'N'
 WHERE id_estacao IN (5, 8, 11);

COMMIT;

-- ---------------------------------------------------------------------------
-- (B) SEED OPERACIONAL
-- ---------------------------------------------------------------------------

-- Vagoes atribuidos a cada locomotiva (+ peso medido e data da pesagem).
-- vl_peso reflete o peso do vagao correspondente.
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (1, 1, 100, TO_DATE('2024-06-01 07:30','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (1, 2, 150, TO_DATE('2024-06-01 07:30','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (1, 3, 200, TO_DATE('2024-06-01 07:30','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (2, 4, 250, TO_DATE('2024-06-01 06:45','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (2, 5, 300, TO_DATE('2024-06-01 06:45','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (2, 6, 350, TO_DATE('2024-06-01 06:45','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (2, 7, 400, TO_DATE('2024-06-01 06:45','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (2, 8, 500, TO_DATE('2024-06-01 06:45','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (3, 9, 550, TO_DATE('2024-06-02 05:20','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (3, 10, 600, TO_DATE('2024-06-02 05:20','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (3, 11, 650, TO_DATE('2024-06-02 05:20','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_vagao (id_locomotiva, id_vagao, vl_peso, dt_atualizacao_peso) VALUES (4, 12, 700, TO_DATE('2024-06-03 06:10','YYYY-MM-DD HH24:MI'));

-- Vinculo vagao-empresa. A PK de t_sif_vagao_empresa e apenas id_empresa, entao
-- so cabe UMA linha por empresa (quirk do schema, documentado no README). A FK
-- composta (id_locomotiva, id_vagao) referencia t_sif_loc_vagao acima.
INSERT INTO t_sif_vagao_empresa (id_empresa, id_locomotiva, id_vagao) VALUES (1, 1, 1);
INSERT INTO t_sif_vagao_empresa (id_empresa, id_locomotiva, id_vagao) VALUES (2, 2, 4);

-- Baterias montadas em locomotivas ao longo da semana (inclui trocas).
-- A montagem MAIS RECENTE de cada locomotiva define a bateria em uso:
--   loco1 -> b4 (75%) | loco2 -> b5 (92%) | loco3 -> b6 (47%) | loco4 -> b7 (52%)
INSERT INTO t_sif_loc_bateria (id_locomotiva, id_bateria, dt_transferencia) VALUES (1, 1, TO_DATE('2024-06-01 08:00','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_bateria (id_locomotiva, id_bateria, dt_transferencia) VALUES (1, 4, TO_DATE('2024-06-05 09:00','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_bateria (id_locomotiva, id_bateria, dt_transferencia) VALUES (2, 5, TO_DATE('2024-06-01 08:30','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_bateria (id_locomotiva, id_bateria, dt_transferencia) VALUES (3, 2, TO_DATE('2024-06-02 07:00','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_bateria (id_locomotiva, id_bateria, dt_transferencia) VALUES (3, 6, TO_DATE('2024-06-06 10:00','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_loc_bateria (id_locomotiva, id_bateria, dt_transferencia) VALUES (4, 7, TO_DATE('2024-06-03 06:00','YYYY-MM-DD HH24:MI'));

-- Baterias transferidas para estacoes de recarga (apenas estacoes 'S').
-- Porto de Itaqui (estacao 1) concentra as trocas; portos do Ceara recebem
-- eventos pontuais.
INSERT INTO t_sif_bateria_estacao (id_estacao, id_bateria, dt_transferencia) VALUES (1, 3, TO_DATE('2024-06-01 06:00','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_bateria_estacao (id_estacao, id_bateria, dt_transferencia) VALUES (1, 7, TO_DATE('2024-06-02 05:00','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_bateria_estacao (id_estacao, id_bateria, dt_transferencia) VALUES (1, 2, TO_DATE('2024-06-05 12:00','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_bateria_estacao (id_estacao, id_bateria, dt_transferencia) VALUES (14, 6, TO_DATE('2024-06-01 05:00','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_bateria_estacao (id_estacao, id_bateria, dt_transferencia) VALUES (15, 4, TO_DATE('2024-06-04 09:00','YYYY-MM-DD HH24:MI'));
INSERT INTO t_sif_bateria_estacao (id_estacao, id_bateria, dt_transferencia) VALUES (16, 1, TO_DATE('2024-06-05 08:00','YYYY-MM-DD HH24:MI'));

-- Registros de viagem. hr_chegada / cd_cidade_chegada NULOS = viagem em curso.
INSERT INTO t_sif_registro (id_registro, id_locomotiva, id_estacao, ds_registro, hr_saida, hr_chegada, cd_cidade_saida, cd_cidade_chegada)
    VALUES (1, 1, 1, 'Saida Porto de Itaqui rumo a Rosario', TO_DATE('2024-06-01 08:00','YYYY-MM-DD HH24:MI'), TO_DATE('2024-06-01 12:30','YYYY-MM-DD HH24:MI'), 'Sao Luiz', 'Rosario');
INSERT INTO t_sif_registro (id_registro, id_locomotiva, id_estacao, ds_registro, hr_saida, hr_chegada, cd_cidade_saida, cd_cidade_chegada)
    VALUES (2, 1, 2, 'Rosario a Codo', TO_DATE('2024-06-02 09:00','YYYY-MM-DD HH24:MI'), TO_DATE('2024-06-02 13:00','YYYY-MM-DD HH24:MI'), 'Rosario', 'Codo');
INSERT INTO t_sif_registro (id_registro, id_locomotiva, id_estacao, ds_registro, hr_saida, hr_chegada, cd_cidade_saida, cd_cidade_chegada)
    VALUES (3, 2, 3, 'Coroata a Sobral', TO_DATE('2024-06-01 09:00','YYYY-MM-DD HH24:MI'), TO_DATE('2024-06-01 20:00','YYYY-MM-DD HH24:MI'), 'Coroata', 'Sobral');
INSERT INTO t_sif_registro (id_registro, id_locomotiva, id_estacao, ds_registro, hr_saida, hr_chegada, cd_cidade_saida, cd_cidade_chegada)
    VALUES (4, 2, 12, 'Sobral a Itapipoca', TO_DATE('2024-06-03 07:00','YYYY-MM-DD HH24:MI'), TO_DATE('2024-06-03 10:30','YYYY-MM-DD HH24:MI'), 'Sobral', 'Itapipoca');
INSERT INTO t_sif_registro (id_registro, id_locomotiva, id_estacao, ds_registro, hr_saida, hr_chegada, cd_cidade_saida, cd_cidade_chegada)
    VALUES (5, 3, 9, 'Castelo a Porto de Mucuipe', TO_DATE('2024-06-02 08:00','YYYY-MM-DD HH24:MI'), TO_DATE('2024-06-02 15:00','YYYY-MM-DD HH24:MI'), 'Castelo', 'Fortaleza');
INSERT INTO t_sif_registro (id_registro, id_locomotiva, id_estacao, ds_registro, hr_saida, hr_chegada, cd_cidade_saida, cd_cidade_chegada)
    VALUES (6, 3, 16, 'Porto de Mucuipe a Altos', TO_DATE('2024-06-06 11:00','YYYY-MM-DD HH24:MI'), NULL, 'Fortaleza', NULL);
INSERT INTO t_sif_registro (id_registro, id_locomotiva, id_estacao, ds_registro, hr_saida, hr_chegada, cd_cidade_saida, cd_cidade_chegada)
    VALUES (7, 4, 8, 'Altos a Castelo', TO_DATE('2024-06-03 07:00','YYYY-MM-DD HH24:MI'), TO_DATE('2024-06-03 09:00','YYYY-MM-DD HH24:MI'), 'Altos', 'Castelo');
INSERT INTO t_sif_registro (id_registro, id_locomotiva, id_estacao, ds_registro, hr_saida, hr_chegada, cd_cidade_saida, cd_cidade_chegada)
    VALUES (8, 1, 16, 'Retorno de Fortaleza', TO_DATE('2024-06-05 10:00','YYYY-MM-DD HH24:MI'), NULL, 'Fortaleza', NULL);

COMMIT;
