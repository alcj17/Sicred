
CREATE TABLE public.associado (
                id_associado INTEGER NOT NULL,
                nome VARCHAR(80) NOT NULL,
                sobrenome VARCHAR(150) NOT NULL,
                idade INTEGER NOT NULL,
                email VARCHAR(120) NOT NULL,
                CONSTRAINT associado_pk PRIMARY KEY (id_associado)
);


CREATE TABLE public.conta (
                id_conta INTEGER NOT NULL,
                tipo VARCHAR(50) NOT NULL,
                data_criacao VARCHAR(25) NOT NULL,
                id_associado INTEGER NOT NULL,
                CONSTRAINT conta_pk PRIMARY KEY (id_conta)
);


CREATE TABLE public.cartao (
                id_cartao INTEGER NOT NULL,
                num_cartao INTEGER NOT NULL,
                nom_impresso VARCHAR(100) NOT NULL,
                id_conta INTEGER NOT NULL,
                id_associado INTEGER NOT NULL,
                CONSTRAINT cartao_pk PRIMARY KEY (id_cartao)
);


CREATE TABLE public.movimento (
                id_movimento INTEGER NOT NULL,
                vlr_transacao VARCHAR(50) NOT NULL,
                des_transacao VARCHAR(120) NOT NULL,
                data_movimento VARCHAR(25) NOT NULL,
                id_cartao INTEGER NOT NULL,
                CONSTRAINT movimento_pk PRIMARY KEY (id_movimento)
);


ALTER TABLE public.conta ADD CONSTRAINT associado_conta_fk
FOREIGN KEY (id_associado)
REFERENCES public.associado (id_associado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.cartao ADD CONSTRAINT associado_cartao_fk
FOREIGN KEY (id_associado)
REFERENCES public.associado (id_associado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.cartao ADD CONSTRAINT conta_cartao_fk
FOREIGN KEY (id_conta)
REFERENCES public.conta (id_conta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.movimento ADD CONSTRAINT cartao_movimento_fk
FOREIGN KEY (id_cartao)
REFERENCES public.cartao (id_cartao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;