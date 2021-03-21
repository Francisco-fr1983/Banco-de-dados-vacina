CREATE TABLE SUBLOTE_VACINA1 (
id_vacina1 int PRIMARY KEY AUTOINCREMENT NOT NULL,
qte_vacina1 int,
dt_envio_vacina1 date,
qual_uf varchar(15),
qual_MU varchar(15),
nome_da_vacina varchar(15),
VACINA_id_vacina: int(FK),
DISTRIBUICAO_VACINA_id_distribuicao_vacina:int(FK),
unidade_de_vacinacao_id_unidade_vacinacao:int(FK),
ESTOQUE_VACINAS_id_estoques_vacinas:int(FK)
)

CREATE TABLE SUBLOTE_VACINA2 (
id_vacina2 int PRIMARY KEY AUTOINCREMENT NOT NULL,
qual_uf varchar(15),
qual_MU varchar(15),
qte_vacina2 int,
dt_envio_vacina2 date,
nome_da_vacina varchar(15)
VACINA_id_vacina: int(FK),
DISTRIBUICAO_VACINA_id_distribuicao_vacina:int(FK),
unidade_de_vacinacao_id_unidade_vacinacao:int(FK),
ESTOQUE_VACINAS_id_estoques_vacinas:int(FK)
)

CREATE TABLE SUS_MUNICIPAL (
id_sus_MU int PRIMARY KEY AUTOINCREMENT NOT NULL,
qte_pedido_MU int,
qte_vacinas_MU int,
valor_do_repasse_uf int,
data_vdade_vacina date,
GRUPO_CRITERIO_MU_id_grupo_criterio_MU:int(FK),
SUS_ESTADUAL_id_estadual_uf:int(FK)
)

CREATE TABLE ESTOQUE_VACINAS (
id_estoque_vacina int PRIMARY KEY AUTOINCREMENT NOT NULL,
qte_vacina_PFIZER int,
qte_vacina_CORONAVAC int,
data_compra_pfizer date,
data_compra_coronavac date,
data_da_compra date,
tempo_max_condicion time,
tempo_condicion_vacina time,
qte_insumos int,
DISTRIBUICAO_VACINA_id_distribuicao_vacina:int(FK)
)

CREATE TABLE DISTRIBUICAO_VACINA (
id_distribuicao_vacina int PRIMARY KEY AUTOINCREMENT NOT NULL,
data_validade_vacina date,
qte_total_vacinas int,
qte_total_vacina1 int,
qte_total_vacina2 int,
laboratorio_vacina varchar(15),
SUS_ESTADUAL_id_estadual_uf:int(FK),
VACINA_id_vacina:int(FK),
SUS_MUNICIPAL_id_sus_MU:int(FK),
MSF_id_sus_federal: int(FK),
ESTOQUE_VACINAS_id_estoques_vacinas:int(FK),
FARMACEUTICA_id_farmaceutica: int(FK),
unidade_de_vacinacao_id_unidade_vacinacao:int(FK),
CAMPANHA_id_campanha:int(FK)
)

CREATE TABLE MSF (
id_susfederal int PRIMARY KEY AUTOINCREMENT NOT NULL,
descricao varchar(15),
SUS_ESTADUAL_id_estadual_uf:int(FK),
VACINA_id_vacina:int(FK),
CAMPANHA_id_campanha:int(FK),
CAMPANHA_ATENDIDA_id_campanha_atendida:int(FK),
DISTRIBUICAO_VACINA_id_distribuicao_vacina:int(FK)
)

CREATE TABLE GRUPO_CRITERIO_UF (
id_grupo_uf int PRIMARY KEY AUTOINCREMENT NOT NULL,
prof_risco_saude varchar(15),
idosos_60 varchar(15),
crianca_ate_05 varchar(15),
pes_comorbidade varchar(15),
qte_imunizada_uf int,
contagem_total_grupo_uf int,
TIPO_LOCALIDADE_id_tipo_localidade:int(FK),
SUS_ESTADUAL_id_estadual_uf:int(FK)
)

CREATE TABLE SELECIONADOS (
id_selecionados int PRIMARY KEY AUTOINCREMENT NOT NULL,
nro_cartao_sus int,
cpf int,
municipio_usuario varchar(15),
uf_usuario varchar(15),
nome_da_vacina varchar(15),
esta_dentro_criterio varchar(15)
POPULACAO_id_populacao:int(FK),
CAMPANHA_id_campanha:int(FK),
unidade_de_vacinacao_id_unidade_vacinacao:int(FK)
)

CREATE TABLE UNIDADES_DE_VACINACAO (
id_unidade_vacinacao int PRIMARY KEY AUTOINCREMENT NOT NULL,
uf varchar(15),
municipio varchar(15),
atende_qual_criterio varchar(15),
qual_vacina_aplicada varchar(15),
vacina1_ou_vacina2: varchar(15),
POPULACAO_id_populacao: int(FK),
CAMPANHA_id_campanha:int(FK)
)

CREATE TABLE POPULACAO (
id_populacao int PRIMARY KEY AUTOINCREMENT NOT NULL,
qte_pessoas_MU int,
qte_pessoas_UF int,
qte_idosos_UF int,
qte_idosos_MU int,
qte_prof_saude_UF int,
qte_prof_saude_MU int,
qte_grupo_comor_MU int,
qte_pessoas_vacinas_UF,
qte_pessoas_vacinas_MU,
SELECIONADOS_id_selecionados: int(FK),
CAMPANHA_id_campanha:int(FK)
)

CREATE TABLE SUS_ESTADUAL (
id_sus_uf int PRIMARY KEY AUTOINCREMENT NOT NULL,
nome_do_lote varchar(15),
qte_pedido_uf int,
status varchar(15),
data_pedido date,
valor-repasse int,
MSF_id_sus_federal: int(FK),
SUS_MUNICIPAL_id_sus_MU: int(FK),
GRUPO_CRITERIO_UF_id_criterio_uf:int(FK)
)

CREATE TABLE FARMACEUTICA (
id_farmaceutica int PRIMARY KEY AUTOINCREMENT NOT NULL,
qte_vacina_coronavac int,
qte_vacina_pfizer int,
qte_vacina_sublote_vacina1: int,
qte_vacina_sublote_vacina2: int,
qte_envio_vacina_uf: varchar(25),
qte_envio_vacina_MU: varchar(25),
VACINA_id_vacina: int(FK)
)

CREATE TABLE VACINA (
id_vacina int PRIMARY KEY AUTOINCREMENT NOT NULL,
vdade_dose2 date,
nome_da_vacina varchar(15),
vdade_dose1 date,
qte_total int,
MSF_id_sus_federal: int(FK),
FARMACEUTICA_id_farmaceutica:int(FK),
SUBLOTE_VACINA1_id_vacina1:int(FK),
SUBLOTE_VACINA2_id_vacina2:int(FK)
)

CREATE TABLE BRASIL (
id_origem int PRIMARY KEY AUTOINCREMENT NOT NULL,
brasil_descricao varchar(15),
CAMPANHA_ATENDIDA_id_campanha_atendida: int(FK)
)

CREATE TABLE GRUPO_CRITERIO_MU (
id_grupo_criterio_MU int PRIMARY KEY AUTOINCREMENT NOT NULL,
prof_risco_saude_MU varchar(15),
pes_comorbidade_MU varchar(15),
idosos_60_MU varchar(15),
qte_imunizada_MU int,
contagem_total_grupo_MU int,
crianca_ate_05_MU varchar(15),
SUS_ESTADUAL_id_estadual_uf: int(FK),
TIPO_LOCALIDADE_id_tipo_localidade: int(FK)
)

CREATE TABLE CAMPANHA_ATENDIDA (
id_camapnha_atendida int PRIMARY KEY AUTOINCREMENT NOT NULL,
camp_aten_id_orig_lancam int,
camp_aten_qte_liberada int,
camp_atend_dt_reserva date,
camp_aten_qte_liberada_motivo int,
camp_aten_qte_reservada int,
camp_id_camp int,
CAMPANHA_id_campanha: int(FK),
BRASIL_id_origem: int(FK),
MSF_id_sus_federal: int(FK)
)

CREATE TABLE CAMPANHA (
id_campanha int PRIMARY KEY AUTOINCREMENT NOT NULL,
camp_qte_atendida varchar(25),
campanha_nome varchar(15),
camp_qte_solicitada int,
camp_id_solicitante int,
camp_id_origem int,
camp_grau_prioridade varchar(15),
camp_dt_solicitacao date,
CAMPANHA_ATENDIDA_id_campanha_atendida: int(FK),
POPULACAO_id_populacao: int(FK),
unidade_de_vacinacao_id_unidade_vacinacao: int(FK)
)

CREATE TABLE TIPO_LOCALIDADE (
id_tipo_localidade int PRIMARY KEY AUTOINCREMENT NOT NULL
tipo_localidade_desc varchar(25),
estado varchar(25),
municipio varchar(25),
GRUPO_CRITERIO_MU_id_grupo_criterio_MU: int(FK),
GRUPO_CRITERIO_UF_id_criterio_uf: int(FK)
);
