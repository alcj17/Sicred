
CREATE TABLE associado (
                id INTEGER NOT NULL,
                nome VARCHAR(80) NOT NULL,
                sobrenome VARCHAR(150) NOT NULL,
                idade INTEGER NOT NULL,
                email VARCHAR(120) NOT NULL,
                CONSTRAINT associado_pk PRIMARY KEY (id)
);


CREATE TABLE conta (
                id INTEGER NOT NULL,
                tipo VARCHAR(50) NOT NULL,
                data_criacao TIMESTAMP NOT NULL,
                id_associado INTEGER NOT NULL,
                CONSTRAINT conta_pk PRIMARY KEY (id)
);


CREATE TABLE cartao (
                id INTEGER NOT NULL,
                num_cartao INTEGER NOT NULL,
                nom_impresso VARCHAR(100) NOT NULL,
                id_conta INTEGER NOT NULL,
                id_associado INTEGER NOT NULL,
                CONSTRAINT cartao_pk PRIMARY KEY (id)
);


CREATE TABLE movimento (
                id INTEGER NOT NULL,
                vlr_transacao NUMERIC(10,2) NOT NULL,
                des_transacao VARCHAR(120) NOT NULL,
                data_movimento TIMESTAMP NOT NULL,
                id_cartao INTEGER NOT NULL,
                CONSTRAINT movimento_pk PRIMARY KEY (id)
);


ALTER TABLE conta ADD CONSTRAINT associado_conta_fk
FOREIGN KEY (id_associado)
REFERENCES associado (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cartao ADD CONSTRAINT associado_cartao_fk
FOREIGN KEY (id_associado)
REFERENCES associado (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cartao ADD CONSTRAINT conta_cartao_fk
FOREIGN KEY (id_conta)
REFERENCES conta (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE movimento ADD CONSTRAINT cartao_movimento_fk
FOREIGN KEY (id_cartao)
REFERENCES cartao (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;