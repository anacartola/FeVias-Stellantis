-- POPULANDO AS TABELAS LOCOMOTIVA, CONCESSIONARIA, LINHA E TRECHO
INSERT INTO T_SIF_LOCOMOTIVA (id_locomotiva, nm_locomotiva, nr_vagoes)
    VALUES (sq_sif_locomotiva.nextval, 'Ferrovia Transnordestina Logística', 13);

INSERT INTO T_SIF_CONCESSIONARIA (id_concessionaria, nm_concessionaria)
    VALUES (sq_sif_concessionaria.nextval, 'Malha Nordeste da Rede Ferroviária Federal S.A.');
    INSERT INTO T_SIF_LINHA (id_linha, id_concessionaria, nm_linha)
        VALUES (sq_sif_linha.nextval, sq_sif_concessionaria.currval, 'Malha 1');
        INSERT INTO T_SIF_TRECHO (id_trecho, T_SIF_LINHA_id_linha, nm_trecho, nr_tamanhokm)
            VALUES(sq_sif_trecho.nextval, sq_sif_linha.currval, 'Itaqui a Pecém', 1000);
        INSERT INTO T_SIF_TRECHO (id_trecho, T_SIF_LINHA_id_linha, nm_trecho, nr_tamanhokm)
            VALUES(sq_sif_trecho.nextval, sq_sif_linha.currval, 'Itaqui a Mucuripe', 1000);

INSERT INTO T_SIF_LOCOMOTIVA (id_locomotiva, nm_locomotiva, nr_vagoes)
    VALUES (sq_sif_locomotiva.nextval, 'Locomotiva Malha Norte', 56);

INSERT INTO T_SIF_CONCESSIONARIA (id_concessionaria, nm_concessionaria)
        VALUES(sq_sif_concessionaria.nextval, 'Rumo S/A');
        INSERT INTO T_SIF_LINHA (id_linha, id_concessionaria, nm_linha)
            VALUES (sq_sif_linha.nextval, sq_sif_concessionaria.currval, 'Malha Norte');
            INSERT INTO T_SIF_TRECHO (id_trecho, T_SIF_LINHA_id_linha, nm_trecho, nr_tamanhokm)
                VALUES (sq_sif_trecho.nextval, sq_sif_linha.currval, 'Rondonópolis a Santa Fé do Sul', 696);


INSERT INTO T_SIF_LOCOMOTIVA (id_locomotiva, nm_locomotiva, nr_vagoes)
    VALUES (sq_sif_locomotiva.nextval, 'Estrada de Ferro Carajás', 33);
    
INSERT INTO T_SIF_CONCESSIONARIA (id_concessionaria, nm_concessionaria)
       VALUES (sq_sif_concessionaria.nextval, 'Vale S/A');
       INSERT INTO T_SIF_LINHA (id_linha, id_concessionaria, nm_linha)
           VALUES (sq_sif_linha.nextval, sq_sif_concessionaria.currval, 'Estrada de Ferro Carajás');
           INSERT INTO T_SIF_TRECHO (id_trecho, T_SIF_LINHA_id_linha, nm_trecho, nr_tamanhokm)
               VALUES (sq_sif_trecho.nextval, sq_sif_linha.currval, 'Carajás a São Luís', 892);


INSERT INTO T_SIF_LOCOMOTIVA (id_locomotiva, nm_locomotiva, nr_vagoes)
    VALUES (sq_sif_locomotiva.nextval, 'Ferrovia Transnordestina Logística (FTL)', 13);
    
INSERT INTO T_SIF_CONCESSIONARIA (id_concessionaria, nm_concessionaria)
       VALUES (sq_sif_concessionaria.nextval, 'Rumo S/A');
       INSERT INTO T_SIF_LINHA (id_linha, id_concessionaria, nm_linha)
           VALUES (sq_sif_linha.nextval, sq_sif_linha.currval, 'Malha Paulista');
           INSERT INTO T_SIF_TRECHO (id_trecho, T_SIF_LINHA_id_linha, nm_trecho, nr_tamanhokm)
               VALUES (sq_sif_trecho.nextval, sq_sif_linha.currval, 'Itaqui a Mucuripe', 1000);

COMMIT;

-- POPULANDO A TABELA ESTADO, CIDADE, LOCALIZA ESTACAO E ESTACAO
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('AC', 'Acre');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('AP', 'Amapá');

INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('MA', 'Maranhão');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'MA', 'São Luiz');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Porto de Itaquí');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 1, sq_sif_localiza_estacao.currval, 'Porto de Itaquí', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Rosário');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Rosário a 1,8km do bairro do Carmo');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 1, sq_sif_localiza_estacao.currval, 'Estação de Rosário a 1,8km do bairro do Carmo', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Coroatá');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Coroatá, Peritoró');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 2, sq_sif_localiza_estacao.currval, 'Estação de Coroatá, Peritoró', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Codó');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Codó');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 2, sq_sif_localiza_estacao.currval, 'Estação de Codó', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Caxias');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Caxias');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 3, sq_sif_localiza_estacao.currval, 'Estação de Caxias', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Timon');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Timon');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 3, sq_sif_localiza_estacao.currval, 'Estação de Timon', 'S');
    
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'São Pedro da Água Branca');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Porto de São Luís');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Açaílândia');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Buriticupu');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Alto Alegre do Pindaré');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Santa Inês');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Vitória do Mearim');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES(sq_sif_cidade.nextval, 'MA', 'Arari');


INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('PI', 'Piauí');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'PI', 'Teresina');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Teresina');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 1, sq_sif_localiza_estacao.currval, 'Estação de Teresina', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'PI', 'Altos');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Altos');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 4,sq_sif_localiza_estacao.currval, 'Estação de Altos', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'PI', 'Castelo');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Castelo');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 4,sq_sif_localiza_estacao.currval, 'Estação de Castelo', 'S');

     
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('CE', 'Ceará');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'CE', 'Cratéus');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Cratéus');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 3, sq_sif_localiza_estacao.currval, 'Estação de Cratéus', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'CE', 'Nova Russas');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Nova Russas');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 3, sq_sif_localiza_estacao.currval, 'Estação de Nova Russas', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'CE', 'Sobral');
                INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Sobral');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 2, sq_sif_localiza_estacao.currval, 'Estação de Sobral', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'CE', 'Itapipoca');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Estação de Itapipoca');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 2, sq_sif_localiza_estacao.currval, 'Estação de Itapipoca', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'CE', 'São Gonçalo do Amarante');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Porto de Pecém');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 1, sq_sif_localiza_estacao.currval, 'Porto de Pecém', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'CE', 'Caucaia');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Porto de Pecém');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 1, sq_sif_localiza_estacao.currval, 'Porto de Pecém', 'S');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'CE', 'Fortaleza');
        INSERT INTO T_SIF_LOCALIZA_ESTACAO (id_loc_estacao, id_cidade, nm_localizacao)
            VALUES(sq_sif_localiza_estacao.nextval, sq_sif_cidade.currval, 'Porto de Mucuípe');
            INSERT INTO T_SIF_ESTACAO (id_estacao, id_trecho, id_loc_estacao, nm_estacao, vr_carrega_bateria)
                VALUES(sq_sif_estacao.nextval, 4, sq_sif_localiza_estacao.currval, 'Porto de Mucuípe', 'S');

COMMIT;
        
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('RN', 'Rio Grande do Norte');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('PB', 'Paraíba');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('PE', 'Pernambuco');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('AL', 'Alagoas');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('SE', 'Sergipe');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('BA', 'Bahia');
    
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('MT', 'Mato Grosso');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'MT', 'Rondonópolis');

INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('GO', 'Goiás');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('DF', 'Distrito Federal');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('MS', 'Mato Grosso do Sul');
 
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES('SP', 'São Paulo');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Santa Fé do Sul');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Rubinéia');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Taquaritinga');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Araraquara');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Bebedouro');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Colômbia');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Itirapina');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Bauru');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Panorama');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Rio Claro');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Campinas');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Jundiaí');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Santos');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'SP', 'Cajiti');

INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('MG', 'Minas Gerais');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('ES', 'Espírito Santo');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('PR', 'Paraná');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('SC', 'Santa Catarina');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('RS', 'Rio Grande do Sul');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('RO', 'Rondônia');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('AM', 'Amazonas');
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('RR', 'Roraima');
      
INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('PA', 'Pará');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'PA', 'Carajás');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'PA', 'Parauapebas');
    INSERT INTO T_SIF_CIDADE (id_cidade, sg_estado, nm_cidade)
        VALUES (sq_sif_cidade.nextval, 'PA', 'Marabá');

INSERT INTO T_SIF_ESTADO (sg_estado, nm_estado)
    VALUES ('TO', 'Tocantins');


COMMIT;


--POPULANDO A TABELA VAGÃO
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 100);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 150);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 200);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 250);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 300);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 350);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 400);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 500);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 550);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 600);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 650);
INSERT INTO T_SIF_VAGAO (id_vagao, tp_vagao, vl_peso_vagao)
    VALUES(sq_sif_vagao.nextval, 'O', 700);


-- POPULANDO TABELA EMPRESA
INSERT INTO T_SIF_EMPRESA (id_empresa, nm_razao_social, cd_cnpj)
    VALUES (sq_sif_empresa.nextval, 'Ferrovia Transnordestina Logistica S.A.', 17234244000131);
INSERT INTO T_SIF_EMPRESA (id_empresa, nm_razao_social, cd_cnpj)
    VALUES (sq_sif_empresa.nextval, 'RUMO S.A.', 02387241000160);


COMMIT;


-- POPULANDO AS TABELAS BATERIA CARREG E BATERIA
INSERT INTO T_SIF_BATERIA_CARREG (id_bateria_carreg, ds_bateria_carreg, perc_carga_bateria)
    VALUES (sq_sif_bateria_carreg.nextval, 'Bateria 1', 75);
    INSERT INTO T_SIF_BATERIA (id_bateria, ds_bateria, id_bateria_carreg)
        VALUES(sq_sif_bateria.nextval, 'Bateria 1', sq_sif_bateria_carreg.currval);
INSERT INTO T_SIF_BATERIA_CARREG (id_bateria_carreg, ds_bateria_carreg, perc_carga_bateria)
    VALUES (sq_sif_bateria_carreg.nextval, 'Bateria 2', 37);
    INSERT INTO T_SIF_BATERIA (id_bateria, ds_bateria, id_bateria_carreg)
        VALUES(sq_sif_bateria.nextval, 'Bateria 2', sq_sif_bateria_carreg.currval);
INSERT INTO T_SIF_BATERIA_CARREG (id_bateria_carreg, ds_bateria_carreg, perc_carga_bateria)
    VALUES (sq_sif_bateria_carreg.nextval, 'Bateria 3', 44);
    INSERT INTO T_SIF_BATERIA (id_bateria, ds_bateria, id_bateria_carreg)
        VALUES(sq_sif_bateria.nextval, 'Bateria 3', sq_sif_bateria_carreg.currval);
INSERT INTO T_SIF_BATERIA_CARREG (id_bateria_carreg, ds_bateria_carreg, perc_carga_bateria)
    VALUES (sq_sif_bateria_carreg.nextval, 'Bateria 4', 75);
    INSERT INTO T_SIF_BATERIA (id_bateria, ds_bateria, id_bateria_carreg)
        VALUES(sq_sif_bateria.nextval, 'Bateria 4', sq_sif_bateria_carreg.currval);
INSERT INTO T_SIF_BATERIA_CARREG (id_bateria_carreg, ds_bateria_carreg, perc_carga_bateria)
    VALUES (sq_sif_bateria_carreg.nextval, 'Bateria 5', 92);
    INSERT INTO T_SIF_BATERIA (id_bateria, ds_bateria, id_bateria_carreg)
        VALUES(sq_sif_bateria.nextval, 'Bateria 5', sq_sif_bateria_carreg.currval);
INSERT INTO T_SIF_BATERIA_CARREG (id_bateria_carreg, ds_bateria_carreg, perc_carga_bateria)
    VALUES (sq_sif_bateria_carreg.nextval, 'Bateria 6', 47);
    INSERT INTO T_SIF_BATERIA (id_bateria, ds_bateria, id_bateria_carreg)
        VALUES(sq_sif_bateria.nextval, 'Bateria 6', sq_sif_bateria_carreg.currval);
INSERT INTO T_SIF_BATERIA_CARREG (id_bateria_carreg, ds_bateria_carreg, perc_carga_bateria)
    VALUES (sq_sif_bateria_carreg.nextval, 'Bateria 7', 52);
        INSERT INTO T_SIF_BATERIA (id_bateria, ds_bateria, id_bateria_carreg)
        VALUES(sq_sif_bateria.nextval, 'Bateria 7', sq_sif_bateria_carreg.currval);


COMMIT;