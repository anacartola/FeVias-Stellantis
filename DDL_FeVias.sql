--Tables, constraints e comentários
CREATE TABLE t_sif_bateria (
    id_bateria        NUMBER(7) NOT NULL,
    id_bateria_carreg NUMBER(7) NOT NULL,
    ds_bateria        VARCHAR2(2000) NOT NULL
);

COMMENT ON COLUMN t_sif_bateria.id_bateria IS
    'Id da bateria';

COMMENT ON COLUMN t_sif_bateria.ds_bateria IS
    'Descrição da Bateria';

ALTER TABLE t_sif_bateria ADD CONSTRAINT t_sif_bateria_pk PRIMARY KEY ( id_bateria );

CREATE TABLE t_sif_bateria_carreg (
    id_bateria_carreg  NUMBER(7) NOT NULL,
    ds_bateria_carreg  VARCHAR2(2000) NOT NULL,
    perc_carga_bateria NUMBER(3) NOT NULL
);

COMMENT ON COLUMN t_sif_bateria_carreg.id_bateria_carreg IS
    'Id do carregamento da bateria';

COMMENT ON COLUMN t_sif_bateria_carreg.ds_bateria_carreg IS
    'Descrição do carregamento da bateria';

COMMENT ON COLUMN t_sif_bateria_carreg.perc_carga_bateria IS
    'Percentual da carga da bateria';

ALTER TABLE t_sif_bateria_carreg ADD CONSTRAINT t_sif_bateria_carreg_pk PRIMARY KEY ( id_bateria_carreg );

CREATE TABLE t_sif_bateria_estacao (
    id_estacao       NUMBER(6) NOT NULL,
    id_bateria       NUMBER(7) NOT NULL,
    dt_transferencia DATE NOT NULL
);

COMMENT ON COLUMN t_sif_bateria_estacao.dt_transferencia IS
    'Data e Hora de transferência de bateria para a estação';

ALTER TABLE t_sif_bateria_estacao ADD CONSTRAINT t_sif_bateria_estacao_pk PRIMARY KEY ( id_estacao,
                                                                                        id_bateria );

CREATE TABLE t_sif_cidade (
    id_cidade NUMBER(5) NOT NULL,
    sg_estado VARCHAR2(2) NOT NULL,
    nm_cidade VARCHAR2(255) NOT NULL
);

COMMENT ON COLUMN t_sif_cidade.id_cidade IS
    'Id da cidade';

COMMENT ON COLUMN t_sif_cidade.nm_cidade IS
    'Nome da cidade';

ALTER TABLE t_sif_cidade ADD CONSTRAINT t_sif_cidade_pk PRIMARY KEY ( id_cidade );

CREATE TABLE t_sif_concessionaria (
    id_concessionaria NUMBER(6) NOT NULL,
    nm_concessionaria VARCHAR2(255) NOT NULL
);

COMMENT ON COLUMN t_sif_concessionaria.id_concessionaria IS
    'Id da concessionária';

COMMENT ON COLUMN t_sif_concessionaria.nm_concessionaria IS
    'Nome da concessionária';

ALTER TABLE t_sif_concessionaria ADD CONSTRAINT t_sif_concessionaria_pk PRIMARY KEY ( id_concessionaria );

CREATE TABLE t_sif_empresa (
    id_empresa      NUMBER(5) NOT NULL,
    nm_razao_social VARCHAR2(300) NOT NULL,
    cd_cnpj         VARCHAR2(14) NOT NULL
);

COMMENT ON COLUMN t_sif_empresa.id_empresa IS
    'Id da empresa';

COMMENT ON COLUMN t_sif_empresa.nm_razao_social IS
    'Nome da empresa';

COMMENT ON COLUMN t_sif_empresa.cd_cnpj IS
    'CNPJ da empresa';

ALTER TABLE t_sif_empresa ADD CONSTRAINT t_sif_empresa_pk PRIMARY KEY ( id_empresa );

CREATE TABLE t_sif_estacao (
    id_estacao         NUMBER(6) NOT NULL,
    id_trecho          NUMBER(6) NOT NULL,
    id_loc_estacao     NUMBER(6) NOT NULL,
    nm_estacao         VARCHAR2(255) NOT NULL,
    vr_carrega_bateria VARCHAR2(1) NOT NULL
);

COMMENT ON COLUMN t_sif_estacao.id_estacao IS
    'id da estação';

COMMENT ON COLUMN t_sif_estacao.nm_estacao IS
    'Nome da estação';

COMMENT ON COLUMN t_sif_estacao.vr_carrega_bateria IS
    'Para ''S'', bateria é carregável na estação e ''N'' bateria não é carregável na estação';

ALTER TABLE t_sif_estacao
    ADD CONSTRAINT ck_sif_estacao_carrega_bateria CHECK ( vr_carrega_bateria = 'S'
                                                          OR vr_carrega_bateria = 'N' );

ALTER TABLE t_sif_estacao ADD CONSTRAINT t_sif_estacao_pk PRIMARY KEY ( id_estacao );

CREATE TABLE t_sif_estado (
    sg_estado VARCHAR2(2) NOT NULL,
    nm_estado VARCHAR2(255) NOT NULL
);

COMMENT ON COLUMN t_sif_estado.sg_estado IS
    'Sigla do estado';

COMMENT ON COLUMN t_sif_estado.nm_estado IS
    'Nome do estado';

ALTER TABLE t_sif_estado ADD CONSTRAINT t_sif_estado_pk PRIMARY KEY ( sg_estado );

CREATE TABLE t_sif_linha (
    id_linha          NUMBER(6) NOT NULL,
    id_concessionaria NUMBER(6) NOT NULL,
    nm_linha          VARCHAR2(255) NOT NULL
);

COMMENT ON COLUMN t_sif_linha.id_linha IS
    'Id da linha';

COMMENT ON COLUMN t_sif_linha.nm_linha IS
    'Nome da linha';

ALTER TABLE t_sif_linha ADD CONSTRAINT t_sif_linha_pk PRIMARY KEY ( id_linha );

CREATE TABLE t_sif_loc_bateria (
    id_locomotiva    NUMBER(6) NOT NULL,
    id_bateria       NUMBER(7) NOT NULL,
    dt_transferencia DATE NOT NULL
);

COMMENT ON COLUMN t_sif_loc_bateria.dt_transferencia IS
    'Data e Hora de transferência de bateria para a locomotiva';

ALTER TABLE t_sif_loc_bateria ADD CONSTRAINT t_sif_loc_bateria_pk PRIMARY KEY ( id_locomotiva,
                                                                                id_bateria );

CREATE TABLE t_sif_loc_vagao (
    id_locomotiva       NUMBER(6) NOT NULL,
    id_vagao            NUMBER(6) NOT NULL,
    vl_peso             NUMBER(5, 2) NOT NULL,
    dt_atualizacao_peso DATE NOT NULL
);

COMMENT ON COLUMN t_sif_loc_vagao.id_locomotiva IS
    'Id da locomotiva relacionado ao vagão';

COMMENT ON COLUMN t_sif_loc_vagao.id_vagao IS
    'Id do vagao relacionado a locomotiva';

COMMENT ON COLUMN t_sif_loc_vagao.vl_peso IS
    'Peso do vagão';

COMMENT ON COLUMN t_sif_loc_vagao.dt_atualizacao_peso IS
    'Data e Hora da atualização do peso';

ALTER TABLE t_sif_loc_vagao ADD CONSTRAINT ck_sif_loc_vagao_peso CHECK ( vl_peso > 0 );

ALTER TABLE t_sif_loc_vagao ADD CONSTRAINT t_sif_loc_vagao_pk PRIMARY KEY ( id_locomotiva,
                                                                            id_vagao );

CREATE TABLE t_sif_localiza_estacao (
    id_loc_estacao NUMBER(6) NOT NULL,
    id_cidade      NUMBER(5) NOT NULL,
    nm_localizacao VARCHAR2(255) NOT NULL
);

COMMENT ON COLUMN t_sif_localiza_estacao.id_loc_estacao IS
    'Id da localização da estação';

COMMENT ON COLUMN t_sif_localiza_estacao.nm_localizacao IS
    'Nome da localização como cidade/estado';

ALTER TABLE t_sif_localiza_estacao ADD CONSTRAINT t_sif_localiza_estacao_pk PRIMARY KEY ( id_loc_estacao );

CREATE TABLE t_sif_locomotiva (
    id_locomotiva NUMBER(6) NOT NULL,
    nm_locomotiva VARCHAR2(255) NOT NULL,
    nr_vagoes     NUMBER(3) NOT NULL
);

COMMENT ON COLUMN t_sif_locomotiva.id_locomotiva IS
    'Id da locomotiva';

COMMENT ON COLUMN t_sif_locomotiva.nm_locomotiva IS
    'Nome da locomotiva';

COMMENT ON COLUMN t_sif_locomotiva.nr_vagoes IS
    'Quantidade de vagões nessa locomotiva';

ALTER TABLE t_sif_locomotiva ADD CONSTRAINT ck_sif_locomotiva_vagoes CHECK ( nr_vagoes > 0 );

ALTER TABLE t_sif_locomotiva ADD CONSTRAINT t_sif_locomotiva_pk PRIMARY KEY ( id_locomotiva );

CREATE TABLE t_sif_registro (
    id_registro       NUMBER(9) NOT NULL,
    id_locomotiva     NUMBER(6) NOT NULL,
    id_estacao        NUMBER(6) NOT NULL,
    ds_registro       VARCHAR2(2000) NOT NULL,
    hr_saida          DATE NOT NULL,
    hr_chegada        DATE,
    cd_cidade_saida   VARCHAR2(255) NOT NULL,
    cd_cidade_chegada VARCHAR2(255)
);

COMMENT ON COLUMN t_sif_registro.id_registro IS
    'Id do registro';

COMMENT ON COLUMN t_sif_registro.hr_saida IS
    'Hora da saída';

COMMENT ON COLUMN t_sif_registro.hr_chegada IS
    'Hora da chegada';

COMMENT ON COLUMN t_sif_registro.cd_cidade_saida IS
    'Código/Id da cidade de saída';

COMMENT ON COLUMN t_sif_registro.cd_cidade_chegada IS
    'Código/Id da cidade dechegada';

ALTER TABLE t_sif_registro ADD CONSTRAINT t_sif_registro_pk PRIMARY KEY ( id_registro );

CREATE TABLE t_sif_trecho (
    id_trecho            NUMBER(6) NOT NULL,
    t_sif_linha_id_linha NUMBER(6) NOT NULL,
    nm_trecho            VARCHAR2(255) NOT NULL,
    nr_tamanhokm         NUMBER(7) NOT NULL
);

COMMENT ON COLUMN t_sif_trecho.id_trecho IS
    'Id do trecho';

COMMENT ON COLUMN t_sif_trecho.nm_trecho IS
    'Nome do trecho';

COMMENT ON COLUMN t_sif_trecho.nr_tamanhokm IS
    'Kilometragem do trecho';

ALTER TABLE t_sif_trecho ADD CONSTRAINT ck_sif_trecho_tamanhokm CHECK ( nr_tamanhokm > 0 );

ALTER TABLE t_sif_trecho ADD CONSTRAINT t_sif_trecho_pk PRIMARY KEY ( id_trecho );

CREATE TABLE t_sif_vagao (
    id_vagao      NUMBER(6) NOT NULL,
    tp_vagao      VARCHAR2(1) NOT NULL,
    vl_peso_vagao NUMBER(5, 2) NOT NULL
);

COMMENT ON COLUMN t_sif_vagao.id_vagao IS
    'Id do vagão	';

COMMENT ON COLUMN t_sif_vagao.tp_vagao IS
    'Tipo do vagão: para pessoas ''P'' e para objetos ''O''';

COMMENT ON COLUMN t_sif_vagao.vl_peso_vagao IS
    'Valor do peso do vagão';

ALTER TABLE t_sif_vagao
    ADD CONSTRAINT ck_sif_vagao_tipo_vagao CHECK ( tp_vagao = 'P'
                                                   OR tp_vagao = 'O' );

ALTER TABLE t_sif_vagao ADD CONSTRAINT ck_sif_vagao_peso_vagao CHECK ( vl_peso_vagao > 0 );

ALTER TABLE t_sif_vagao ADD CONSTRAINT t_sif_vagao_pk PRIMARY KEY ( id_vagao );

CREATE TABLE t_sif_vagao_empresa (
    id_empresa    NUMBER(5) NOT NULL,
    id_locomotiva NUMBER(6) NOT NULL,
    id_vagao      NUMBER(6) NOT NULL
);

ALTER TABLE t_sif_vagao_empresa ADD CONSTRAINT t_sif_vagao_empresa_pk PRIMARY KEY ( id_empresa );

ALTER TABLE t_sif_bateria
    ADD CONSTRAINT t_sif_bateria_carreg_fk FOREIGN KEY ( id_bateria_carreg )
        REFERENCES t_sif_bateria_carreg ( id_bateria_carreg );

ALTER TABLE t_sif_bateria_estacao
    ADD CONSTRAINT t_sif_be_bateria_fk FOREIGN KEY ( id_bateria )
        REFERENCES t_sif_bateria ( id_bateria )
            ON DELETE CASCADE;

ALTER TABLE t_sif_bateria_estacao
    ADD CONSTRAINT t_sif_be_estacao_fk FOREIGN KEY ( id_estacao )
        REFERENCES t_sif_estacao ( id_estacao );

ALTER TABLE t_sif_localiza_estacao
    ADD CONSTRAINT t_sif_cidade_fk FOREIGN KEY ( id_cidade )
        REFERENCES t_sif_cidade ( id_cidade );

ALTER TABLE t_sif_linha
    ADD CONSTRAINT t_sif_concessionaria_fk FOREIGN KEY ( id_concessionaria )
        REFERENCES t_sif_concessionaria ( id_concessionaria );

ALTER TABLE t_sif_vagao_empresa
    ADD CONSTRAINT t_sif_empresa_fk FOREIGN KEY ( id_empresa )
        REFERENCES t_sif_empresa ( id_empresa );

ALTER TABLE t_sif_registro
    ADD CONSTRAINT t_sif_estacao_fk FOREIGN KEY ( id_estacao )
        REFERENCES t_sif_estacao ( id_estacao );

ALTER TABLE t_sif_cidade
    ADD CONSTRAINT t_sif_estado_fk FOREIGN KEY ( sg_estado )
        REFERENCES t_sif_estado ( sg_estado );

ALTER TABLE t_sif_loc_bateria
    ADD CONSTRAINT t_sif_lb_bateria_fk FOREIGN KEY ( id_bateria )
        REFERENCES t_sif_bateria ( id_bateria );

ALTER TABLE t_sif_loc_bateria
    ADD CONSTRAINT t_sif_lb_locomotiva_fk FOREIGN KEY ( id_locomotiva )
        REFERENCES t_sif_locomotiva ( id_locomotiva );

ALTER TABLE t_sif_trecho
    ADD CONSTRAINT t_sif_linha_fk FOREIGN KEY ( t_sif_linha_id_linha )
        REFERENCES t_sif_linha ( id_linha );

ALTER TABLE t_sif_vagao_empresa
    ADD CONSTRAINT t_sif_loc_vagao_fk FOREIGN KEY ( id_locomotiva,
                                                    id_vagao )
        REFERENCES t_sif_loc_vagao ( id_locomotiva,
                                     id_vagao );

ALTER TABLE t_sif_estacao
    ADD CONSTRAINT t_sif_localiza_estacao_fk FOREIGN KEY ( id_loc_estacao )
        REFERENCES t_sif_localiza_estacao ( id_loc_estacao );

ALTER TABLE t_sif_registro
    ADD CONSTRAINT t_sif_locomotiva_fk FOREIGN KEY ( id_locomotiva )
        REFERENCES t_sif_locomotiva ( id_locomotiva );

ALTER TABLE t_sif_loc_vagao
    ADD CONSTRAINT t_sif_lv_locomotiva_fk FOREIGN KEY ( id_locomotiva )
        REFERENCES t_sif_locomotiva ( id_locomotiva );

ALTER TABLE t_sif_loc_vagao
    ADD CONSTRAINT t_sif_lv_vagao_fk FOREIGN KEY ( id_vagao )
        REFERENCES t_sif_vagao ( id_vagao );

ALTER TABLE t_sif_estacao
    ADD CONSTRAINT t_sif_trecho_fk FOREIGN KEY ( id_trecho )
        REFERENCES t_sif_trecho ( id_trecho );

--Sequences
CREATE SEQUENCE SQ_SIF_BATERIA INCREMENT BY 1 START WITH 1 MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_BATERIA_CARREG INCREMENT BY 1 START WITH 1 MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_CIDADE INCREMENT BY 1 START WITH 1 MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_CONCESSIONARIA INCREMENT BY 1 START WITH 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_EMPRESA INCREMENT BY 1 START WITH 1 MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_ESTACAO INCREMENT BY 1 START WITH 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_LINHA INCREMENT BY 1 START WITH 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_LOCALIZA_ESTACAO	INCREMENT BY 1 START WITH 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_LOCOMOTIVA INCREMENT BY 1 START WITH 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_REGISTRO INCREMENT BY 1 START WITH 1 MAXVALUE 999999999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_TRECHO INCREMENT BY 1 START WITH 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_VAGAO INCREMENT BY 1 START WITH 1 MAXVALUE 999999 NOCACHE NOCYCLE;
CREATE SEQUENCE SQ_SIF_VAGAO_EMPRESA INCREMENT BY 1 START WITH 1 MAXVALUE 99999 NOCACHE NOCYCLE;

