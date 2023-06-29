-- CREATE TABLES

DROP TABLE TB_HLERA_PESSOA;
DROP TABLE TB_HLERA_CAMPANHA;
DROP TABLE TB_HLERA_INSCRICOES;

create table TB_HLERA_CAMPANHA(
    ID_CAMPANHA          NUMBER(19) not null
        primary key,
    NR_ITENS_DISPONIVEIS NUMBER(11),
    NM_CAMPANHA          VARCHAR2(255 char) not null,
    DS_DESCRICAO         VARCHAR2(255 char)not null,
    TP_CAMPANHA          NUMBER(3)
        check (tp_campanha between 0 and 2) not null
)
/
create table TB_HLERA_PESSOA(
    ID_PESSOA      NUMBER(19) not null
        primary key,
    NM_PESSOA      VARCHAR2(255 char) not null,
    DS_EMAIL       VARCHAR2(255 char) 
        constraint UN_EMAIL
            unique not null,
    DT_NASCIMENTO  DATE not null,  
    DS_BAIRRO      VARCHAR2(255 char) not null,
    DS_CIDADE      VARCHAR2(255 char) not null,
    DS_COMPLEMENTO VARCHAR2(255 char) not null,
    DS_ESTADO      VARCHAR2(255 char) not null,
    NR_CEP         VARCHAR2(255 char) not null,
    NR_NUMERO      VARCHAR2(255 char) not null,
    DS_LOGRADOURO  VARCHAR2(255 char) not null,
    DS_SENHA       VARCHAR2(255 char) not null,
    NR_CELULAR     VARCHAR2(255 char)
        constraint UN_CELULAR
            unique not null,
    NR_TELEFONE    VARCHAR2(255 char)
        constraint UN_TELEFONE
            unique,
    RG_PESSOA      VARCHAR2(255 char)
        constraint UN_RG
            unique not null,
    CPF_PESSOA     VARCHAR2(255 char)
        constraint UN_CPF
            unique not null,
    GR_PESSOA      NUMBER(3)
        check (gr_pessoa between 0 and 1) 
)
/
create table TB_HLERA_INSCRICOES(
    ID_CAMPANHA NUMBER(19) not null
        constraint FK_CAMPANHA
            references TB_HLERA_CAMPANHA,
    ID_PESSOA   NUMBER(19) not null
        constraint FK_PESSOA_CAMPANHA
            references TB_HLERA_PESSOA,
    primary key (ID_CAMPANHA, ID_PESSOA)
)
/






-- PROCEDURE PARA CARGA INCIAL

set serveroutput on;

drop table TB_LOG_ERROS;
DROP PROCEDURE CARGA_INICIAL;

-- CRIAÇÃO TABELA REGISTRO LOGS
CREATE TABLE TB_LOG_ERROS (
  ID_LOG INT GENERATED ALWAYS AS IDENTITY,
  NM_USUARIO VARCHAR(100),
  DT_OCORRENCIA TIMESTAMP,
  CD_ERRO INT,
  DS_MENSAGEM_ERRO VARCHAR(4000),
  PRIMARY KEY (ID_LOG)
);

-- CRIAÇÃO DA PROCEDURE DE CARGA INICIAL PARA PESSOA
CREATE OR REPLACE PROCEDURE CARGA_INICIAL AS
  v_nm_usuario VARCHAR2(100);
  v_dt_ocorrencia DATE;
  v_cd_erro NUMBER;
  v_mensagem_erro VARCHAR2(4000);
  v_cont_registro NUMBER; 

BEGIN
  BEGIN
    -- INSERINDO DADOS PESSOA
    SELECT COUNT(*) INTO v_cont_registro FROM TB_HLERA_PESSOA;
    IF v_cont_registro = 0 THEN
        INSERT INTO TB_HLERA_PESSOA VALUES (1, 'Maria da Silva', 'mariadasilva@gmail.com', TO_DATE('12-05-1990', 'DD-MM-YYYY'),'Centro', 'São Paulo', 
        'Apto 123', 'SP', '01234567', '123','Rua das Orquideas', 'senha123', '11987654321', '1133456780', '123456781','12315428901', 0);
        INSERT INTO TB_HLERA_PESSOA VALUES (2, 'João Santos', 'joaosantos@hotmail.com', TO_DATE('20-10-1985', 'DD-MM-YYYY'),'Vila Nova', 'Rio de Janeiro',
        'Casa 456', 'RJ', '04567890', '456','Avenida Principal', 'senha456', '21999888777', '2198765434', '987654314','98765432109', 0);
        INSERT INTO TB_HLERA_PESSOA VALUES (3, 'Ana Souza', 'anasouza@yahoo.com', TO_DATE('15-03-1988', 'DD-MM-YYYY'),'Jardim das Flores', 'Curitiba', 
        'Casa 789', 'PR', '05678901', '789','Rua Principal', 'senha789', '41988777666', '4176543210', '545719621','98717526321', 0);
        INSERT INTO TB_HLERA_PESSOA VALUES (4, 'Carolina Ferreira', 'carolinaferreira@gmail.com', TO_DATE('30-12-1987', 'DD-MM-YYYY'),'Jardim América', 
        'Belo Horizonte', 'Casa 789', 'MG', '03456789', '789','Rua das Palmeiras', 'senha789', '31996555444', '345321098', '765432143','10987654321', 0);
        INSERT INTO TB_HLERA_PESSOA VALUES (5, 'Rafaela Santos', 'rafaelasantos@hotmail.com', TO_DATE('18-09-1993', 'DD-MM-YYYY'),'Centro', 'Recife', 
        'Apto 123', 'PE', '05678901', '123','Avenida Central', 'senha1y23', '81955444333', '8143210987', '543210981','10137684321', 0);
        INSERT INTO TB_HLERA_PESSOA VALUES (6, 'Maria Silva', 'masilva@gmail.com', TO_DATE('15-05-1990', 'DD-MM-YYYY'),'Centro', 'São Paulo', 
        'Apto 101', 'SP', '01010000', '19','Rua das Galhardas', '999111', '11987652620', '1123456795', '598023841','12345678910', 1);
        INSERT INTO TB_HLERA_PESSOA VALUES (7, 'João Oliveira', 'joao.oliveira@hotmail.com', TO_DATE('20-09-1985', 'DD-MM-YYYY'),'Jardins', 
        'Rio de Janeiro', 'Casa 20', 'RJ', '20000001', '456','Avenida Brasil', 'abc123', '21987654321', '2134567890', '998877663','98765432100', 1);
        INSERT INTO TB_HLERA_PESSOA VALUES (8, 'Pedro Santos', 'pedro.santos@gmail.com', TO_DATE('22-07-1992', 'DD-MM-YYYY'),'Vila Madalena', 'São Paulo', 
        'Casa 5', 'SP', '05410000', '789','Rua dos Pinheiros', 'senh6', '11987651234', '1156789012', '334455667','23456789012', 1);
        INSERT INTO TB_HLERA_PESSOA VALUES (9, 'Ana Oliveira', 'ana.oliveira@hotmail.com', TO_DATE('12-03-1988', 'DD-MM-YYYY'),'Copacabana', 
        'Rio de Janeiro', 'Apartamento 15', 'RJ', '22011001', '101','Avenida Atlântica', 'abrenut56', '21987655678', '2178901234', '777665544','34567890123', 1);
        INSERT INTO TB_HLERA_PESSOA VALUES (10, 'Luisa Mendes', 'luisa.mendes@gmail.com', TO_DATE('05-11-1993', 'DD-MM-YYYY'),'Centro', 'Belo Horizonte', 
        'Bloco 3', 'MG', '30000123', '6786','Avenida Principal', 'senuuuu78', '31987654321', '3123456789', '755667788','45678901234', 1);
        COMMIT;    
    ELSE
      RAISE_APPLICATION_ERROR(-20001, 'A tabela PESSOA já contém registros.');
    END IF;
     -- INSERINDO DADOS CAMPANHA
    SELECT COUNT(*) INTO v_cont_registro FROM TB_HLERA_CAMPANHA;
     IF v_cont_registro = 0 THEN
        INSERT INTO TB_HLERA_CAMPANHA VALUES (1, 10, 'Campanha de Alimentos', 'Campanha de doação de alimentos em geral.', 0);
        INSERT INTO TB_HLERA_CAMPANHA VALUES (2, 15, 'Campanha de Roupas', 'Campanha de roupas em geral.', 1);
        INSERT INTO TB_HLERA_CAMPANHA VALUES (3, 8, 'Outros', 'Campanhas de doações em geral, o famoso "tudo vale".', 2);
        INSERT INTO TB_HLERA_CAMPANHA VALUES (4, 20, 'Campanha de Alimentos', 'Doamos alimentos.', 0);
        INSERT INTO TB_HLERA_CAMPANHA VALUES (5, 12, 'Campanha de Roupas', 'Doamos roupas', 1);
        COMMIT;
      ELSE
      RAISE_APPLICATION_ERROR(-20001, 'A tabela CAMPANHA já contém registros.');
    END IF;
    -- INSERINDO DADOS INSCRIÇÕES
     SELECT COUNT(*) INTO v_cont_registro FROM TB_HLERA_INSCRICOES;
     IF v_cont_registro = 0 THEN
        INSERT INTO TB_HLERA_INSCRICOES VALUES (1, 1);
        INSERT INTO TB_HLERA_INSCRICOES VALUES (2, 2);
        INSERT INTO TB_HLERA_INSCRICOES VALUES (3, 3);
        INSERT INTO TB_HLERA_INSCRICOES VALUES (4, 4);
        INSERT INTO TB_HLERA_INSCRICOES VALUES (5, 5);
        COMMIT;
    ELSE
      RAISE_APPLICATION_ERROR(-20001, 'A tabela INSCRICOES já contém registros.');
    END IF;
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      v_nm_usuario := USER;
      v_dt_ocorrencia := SYSDATE;
      v_cd_erro := SQLCODE;
      v_mensagem_erro := SQLERRM;

      INSERT INTO TB_LOG_ERROS (NM_USUARIO, DT_OCORRENCIA, CD_ERRO, DS_MENSAGEM_ERRO)
      VALUES (v_nm_usuario, v_dt_ocorrencia, v_cd_erro, v_mensagem_erro);

      IF DBMS_TRANSACTION.LOCAL_TRANSACTION_ID IS NOT NULL THEN
        ROLLBACK;
      END IF;
      RAISE_APPLICATION_ERROR(-20002, 'Ocorreu uma violação de chave única.');

    WHEN OTHERS THEN
      v_nm_usuario := USER;
      v_dt_ocorrencia := SYSDATE;
      v_cd_erro := SQLCODE;
      v_mensagem_erro := SQLERRM;

      INSERT INTO TB_LOG_ERROS (NM_USUARIO, DT_OCORRENCIA, CD_ERRO, DS_MENSAGEM_ERRO)
      VALUES (v_nm_usuario, v_dt_ocorrencia, v_cd_erro, v_mensagem_erro);

      IF DBMS_TRANSACTION.LOCAL_TRANSACTION_ID IS NOT NULL THEN
        ROLLBACK;
      END IF;
      RAISE;
  END;
END;
/

BEGIN
    CARGA_INICIAL;
END;
/





-- PESQUISAS

CREATE OR REPLACE PROCEDURE PESQUISA_DOADOR_BENEFICIARIO
IS
BEGIN
  -- PESQUISA PARA MOSTRAR OS USUÁRIOS DOADORES
  DBMS_OUTPUT.PUT_LINE('.DOADORES');
  FOR TB_HLERA_PESSOA IN (SELECT p.nm_pessoa
                          FROM TB_HLERA_PESSOA p
                          WHERE ROWNUM <= 5)
  LOOP
    DBMS_OUTPUT.PUT_LINE('Usuário encontrado: Nome = ' || tb_hlera_pessoa.nm_pessoa);
  END LOOP;

  DBMS_OUTPUT.NEW_LINE;
  
  -- PESQUISA PARA MOSTRAR OS USUÁRIOS BENEFICIÁRIOS
  DBMS_OUTPUT.PUT_LINE('.BENEFICIÁRIOS');
  FOR TB_HLERA_PESSOA IN (SELECT nm_pessoa
                          FROM (
                            SELECT nm_pessoa, ROW_NUMBER() OVER (ORDER BY id_pessoa) AS row_num
                            FROM TB_HLERA_PESSOA
                            WHERE id_pessoa > 5
                          )
                          WHERE row_num <= 5)
  LOOP
    DBMS_OUTPUT.PUT_LINE('Usuário encontrado: Nome = ' || tb_hlera_pessoa.nm_pessoa);
  END LOOP;
  
  DBMS_OUTPUT.NEW_LINE;
  
  -- Pesquisa com a nova query
  DBMS_OUTPUT.PUT_LINE('.CAMPANHAS');
  FOR TB_HLERA_CAMPANHA IN (SELECT c.*, p.nm_pessoa, p.id_pessoa AS id_pessoa
                            FROM TB_HLERA_CAMPANHA c
                            JOIN TB_HLERA_INSCRICOES i ON c.id_campanha = i.id_campanha
                            JOIN TB_HLERA_PESSOA p ON p.id_pessoa = i.id_pessoa)
  LOOP
    DBMS_OUTPUT.PUT_LINE('Campanha encontrada: *ID* = ' || tb_hlera_campanha.id_campanha || ' | *NOME* = ' || tb_hlera_campanha.nm_campanha || ' | *DOADOR* = ' || tb_hlera_campanha.nm_pessoa);
  END LOOP;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: ' || SQLERRM);
END;
/
BEGIN
   PESQUISA_DOADOR_BENEFICIARIO;
END;
/
