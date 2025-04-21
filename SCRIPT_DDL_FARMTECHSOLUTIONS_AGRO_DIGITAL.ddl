-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-04-21 18:06:35 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE APLICACAO_DE_AGUA CASCADE CONSTRAINTS 
;

DROP TABLE APLICACAO_NUTRIENTES CASCADE CONSTRAINTS 
;

DROP TABLE CULTURAS CASCADE CONSTRAINTS 
;

DROP TABLE LEITURA_SENSOR CASCADE CONSTRAINTS 
;

DROP TABLE PLANTIO CASCADE CONSTRAINTS 
;

DROP TABLE PRODUTOR CASCADE CONSTRAINTS 
;

DROP TABLE SENSORES CASCADE CONSTRAINTS 
;

DROP TABLE TALHOES CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE APLICACAO_DE_AGUA 
    ( 
     id_aplic_agua   INTEGER  NOT NULL , 
     id_talhao       INTEGER  NOT NULL , 
     id_plantio      INTEGER  NOT NULL , 
     data_hora_aplic TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     qtd_agua_aplic  NUMBER  NOT NULL 
    ) 
;

ALTER TABLE APLICACAO_DE_AGUA 
    ADD CONSTRAINT PK_APLICACAO_DE_AGUA PRIMARY KEY ( id_aplic_agua ) ;

CREATE TABLE APLICACAO_NUTRIENTES 
    ( 
     id_aplic_nutrientes INTEGER  NOT NULL , 
     id_talhao           INTEGER  NOT NULL , 
     id_plantio          INTEGER  NOT NULL , 
     data_hora_aplic     TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     qtd_fosforo         NUMBER  NOT NULL , 
     qtd_potassio        NUMBER  NOT NULL , 
     qtd_nitrogenio      NUMBER  NOT NULL 
    ) 
;

ALTER TABLE APLICACAO_NUTRIENTES 
    ADD CONSTRAINT PK_APLICACAO_NUTRIENTES PRIMARY KEY ( id_aplic_nutrientes ) ;

CREATE TABLE CULTURAS 
    ( 
     id_cultura        INTEGER  NOT NULL , 
     nome_cultura      VARCHAR2 (15)  NOT NULL , 
     descricao_cultura VARCHAR2 (100)  NOT NULL , 
     umidade_ideal     NUMBER  NOT NULL , 
     ph_ideal          NUMBER  NOT NULL , 
     fosforo_ideal     NUMBER  NOT NULL , 
     potassio_ideal    NUMBER  NOT NULL 
    ) 
;

ALTER TABLE CULTURAS 
    ADD CONSTRAINT PK_CULTURAS PRIMARY KEY ( id_cultura ) ;

CREATE TABLE LEITURA_SENSOR 
    ( 
     id_leitura        INTEGER  NOT NULL , 
     id_sensor         INTEGER  NOT NULL , 
     id_plantio        INTEGER  NOT NULL , 
     data_hora_leitura TIMESTAMP WITH LOCAL TIME ZONE  NOT NULL , 
     valor_umidade     NUMBER  NOT NULL , 
     valor_ph          NUMBER  NOT NULL , 
     valor_fosforo     NUMBER  NOT NULL , 
     valor_potassio    NUMBER  NOT NULL 
    ) 
;

ALTER TABLE LEITURA_SENSOR 
    ADD CONSTRAINT PK_LEITURA_SENSOR PRIMARY KEY ( id_leitura ) ;

CREATE TABLE PLANTIO 
    ( 
     id_plantio          INTEGER  NOT NULL , 
     id_talhao           INTEGER  NOT NULL , 
     id_cultura          INTEGER  NOT NULL , 
     data_inicio_plantio DATE  NOT NULL , 
     data_final_plantio  DATE  NOT NULL , 
     area_plantio        NUMBER  NOT NULL 
    ) 
;

ALTER TABLE PLANTIO 
    ADD CONSTRAINT CK_PLANTIO_DATA 
    CHECK (DATA_FINAL > DATA_INICIAL)
;
ALTER TABLE PLANTIO 
    ADD CONSTRAINT PK_PLANTIO PRIMARY KEY ( id_plantio ) ;

CREATE TABLE PRODUTOR 
    ( 
     id_produtor   INTEGER  NOT NULL , 
     nome_produtor VARCHAR2 (30)  NOT NULL 
    ) 
;

ALTER TABLE PRODUTOR 
    ADD CONSTRAINT PK_PRODUTOR PRIMARY KEY ( id_produtor ) ;

ALTER TABLE PRODUTOR 
    ADD CONSTRAINT UN_PRODUTOR_NAME UNIQUE ( nome_produtor ) ;

CREATE TABLE SENSORES 
    ( 
     id_sensor              INTEGER  NOT NULL , 
     id_talhao              INTEGER  NOT NULL , 
     tipo_sensor            VARCHAR2 (5)  NOT NULL , 
     marca_sensor           VARCHAR2 (10)  NOT NULL , 
     modelo_sensor          VARCHAR2 (10)  NOT NULL , 
     serie_sensor           INTEGER  NOT NULL , 
     data_instalacao_sensor DATE  NOT NULL 
    ) 
;

ALTER TABLE SENSORES 
    ADD CONSTRAINT PK_SENSORES PRIMARY KEY ( id_sensor ) ;

CREATE TABLE TALHOES 
    ( 
     id_talhao   INTEGER  NOT NULL , 
     id_produtor INTEGER  NOT NULL , 
     nome_talhao VARCHAR2 (10)  NOT NULL , 
     area_talhao NUMBER  NOT NULL 
    ) 
;

ALTER TABLE TALHOES 
    ADD CONSTRAINT PK_TALHOES PRIMARY KEY ( id_talhao ) ;

ALTER TABLE APLICACAO_DE_AGUA 
    ADD CONSTRAINT FK_APLIC_DE_AGUA_PLANT FOREIGN KEY 
    ( 
     id_plantio
    ) 
    REFERENCES PLANTIO 
    ( 
     id_plantio
    ) 
;

ALTER TABLE APLICACAO_DE_AGUA 
    ADD CONSTRAINT FK_APLIC_DE_AGUA_TALH FOREIGN KEY 
    ( 
     id_talhao
    ) 
    REFERENCES TALHOES 
    ( 
     id_talhao
    ) 
;

ALTER TABLE APLICACAO_NUTRIENTES 
    ADD CONSTRAINT FK_APLIC_NUTR_PLANT FOREIGN KEY 
    ( 
     id_plantio
    ) 
    REFERENCES PLANTIO 
    ( 
     id_plantio
    ) 
;

ALTER TABLE APLICACAO_NUTRIENTES 
    ADD CONSTRAINT FK_APLIC_NUTR_TALH FOREIGN KEY 
    ( 
     id_talhao
    ) 
    REFERENCES TALHOES 
    ( 
     id_talhao
    ) 
;

ALTER TABLE LEITURA_SENSOR 
    ADD CONSTRAINT FK_LEIT_SENS_PLANT FOREIGN KEY 
    ( 
     id_plantio
    ) 
    REFERENCES PLANTIO 
    ( 
     id_plantio
    ) 
;

ALTER TABLE LEITURA_SENSOR 
    ADD CONSTRAINT FK_LEIT_SENS_SENSORES FOREIGN KEY 
    ( 
     id_sensor
    ) 
    REFERENCES SENSORES 
    ( 
     id_sensor
    ) 
;

ALTER TABLE PLANTIO 
    ADD CONSTRAINT FK_PLANT_CULT FOREIGN KEY 
    ( 
     id_cultura
    ) 
    REFERENCES CULTURAS 
    ( 
     id_cultura
    ) 
;

ALTER TABLE PLANTIO 
    ADD CONSTRAINT FK_PLANT_TALH FOREIGN KEY 
    ( 
     id_talhao
    ) 
    REFERENCES TALHOES 
    ( 
     id_talhao
    ) 
;

ALTER TABLE SENSORES 
    ADD CONSTRAINT FK_SENS_TALH FOREIGN KEY 
    ( 
     id_talhao
    ) 
    REFERENCES TALHOES 
    ( 
     id_talhao
    ) 
;

ALTER TABLE TALHOES 
    ADD CONSTRAINT FK_TALH_PRODUTOR FOREIGN KEY 
    ( 
     id_produtor
    ) 
    REFERENCES PRODUTOR 
    ( 
     id_produtor
    ) 
;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             20
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
