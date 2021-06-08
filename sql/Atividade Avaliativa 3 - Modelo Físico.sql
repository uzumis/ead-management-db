-- Questão 2)
--a) Definição das Tabelas conforme modelo relacional

create table funcionario(
    cd_funcionario number (2),
    cpf_do_funcionario number (11),
    nome_do_funcionario char (50),
    data_nasc_func date,
    email_func char(40),
    nomenumlogradouro char(40),
    cidade char(15),
    estado char(15),
    cep number (8),
    login_func char(10),
    senha_func char(30),
    constraint pk_funcionario primary key (cd_funcionario)
);
create table professor(
    funcionario_cd_funcionario number(2),
    cd_professor number(2),
    constraint pk_professor primary key (cd_professor)
    );
create table tutor(
    funcionario_cd_funcionario number(2),
    cd_tutor number(2),
    constraint pk_tutor primary key (cd_tutor)
    );
create table gerente(
    funcionario_cd_funcionario number (2),
    cd_gerente number(2),
    constraint pk_gerente primary key (cd_gerente)
    );
create table funcionario_telefone(
    funcionario_cd_funcionario number (2),
    cd_telefone number (5),
    telefone number (11),
    constraint pk_funcionario_telefone primary key (funcionario_cd_funcionario,cd_telefone)
    );
create table tutor_gerencia_forum(
tutor_cd_tutor number (2),
forum_id_forum number (5),
constraint pk_tutor_gerencia_forum primary key (tutor_cd_tutor,forum_id_forum)
);
create table gerente_coordena (
    gerente_cd_gerente number(2),
    tutor_cd_tutor number(2),
    professor_cd_professor number(2),
    aluno_matricula_aluno number (2),
    constraint pk_gerente_coordena primary key (gerente_cd_gerente,tutor_cd_tutor,professor_cd_professor,aluno_matricula_aluno)
    );
create table aula (
    professor_cd_professor number (2),
    link_aula char(60),
    data_aula date,
    link_material_apoio char (60),
    cd_aula number (5),
    constraint pk_aula primary key (cd_aula,professor_cd_professor)
    );
create table modulo(
    professor_cd_professor number(2),
    cd_modulo number(3),
    nome_modulo char(20),
    carga_horaria number(3),
    constraint pk_modulo primary key (cd_modulo)
    );
create table forum(
    id_forum number (5),
    tutor_cd_tutor number (2),
    constraint pk_forum primary key (id_forum)
    );
create table forum_m_aluno(
    forum_id_forum number(5),
    cd_m_aluno number(5),
    mensagens_aluno char(280),
    constraint pk_forum_m_aluno primary key (forum_id_forum,cd_m_aluno)
    );
create table forum_m_tutores(
    forum_id_forum number(5),
    cd_m_tutores number(5),
    mensagens_tutores char(280),
    constraint pk_forum_m_tutores primary key (forum_id_forum,cd_m_tutores)
    );
create table turma (
    cd_turma number(4),
    gerente_cd_gerente number(4),
    aluno_matricula_aluno number(11),
    data_criacao_turma date not null,
    turno number(3),
    data_encerramento_turma date,
    constraint pk_turma primary key (cd_turma,aluno_matricula_aluno)
    );
create table aluno_assiste_aula(
    aula_cd_aula number (5),
    aluno_matricula_aluno number(11)
    );
create table aula_modulo(
    aula_cd_aula number(5),
    modulo_cd_modulo number(5)
    );
create table aluno(
    matricula_aluno number(11),
    turma_cd_turma number(4),
    cpf_aluno number(11),
    nome_aluno char(50),
    data_nasc_aluno date,
    email_aluno char(40),
    nomenumlogradouro char(40),
    cidade char(15),
    estado char(15),
    cep number(8),
    login_aluno char(10),
    senha_aluno char(30),
    constraint pk_aluno primary key (matricula_aluno)
    );
create table dashboard(
    id_dashboard number(5),
    aluno_matricula_aluno number(11),
    ch_realizada number(4),
    constraint pk_dashboard primary key (id_dashboard)
    );
create table aluno_telefone(
    aluno_matricula_aluno number(11),
    cd_telefone_aluno number(5),
    telefone_aluno number(11),
    constraint pk_aluno_telefone primary key (cd_telefone_aluno)
    );
create table modulo_concluido(
    dashboard_id_dashboard number(5),
    cd_mod_concluido number(5),
    modulo_concluido number(3),
    constraint pk_modulo_concluido primary key (dashboard_id_dashboard,cd_mod_concluido)
    );
create table aula_dashboard(
    dashboard_id_dashboard number(5),
    cd_aula_c number(5),
    aula_concluida number(5),
    constraint pk_aula_dashboard primary key (dashboard_id_dashboard, cd_aula_c)
    );
	
--b) Inserções das chaves estrangeiras por tabela
-- Professor:
alter table professor 
add constraint fk_funcionario_professor 
foreign key (funcionario_cd_funcionario) 
references funcionario (cd_funcionario);
--Tutor:
alter table tutor
add constraint fk_funcionario_tutor
foreign key (funcionario_cd_funcionario) 
references funcionario (cd_funcionario);
--Gerente:
alter table gerente
add constraint fk_funcionario_gerente
foreign key (funcionario_cd_funcionario) 
references funcionario (cd_funcionario);
--funcionario_telefone
alter table funcionario_telefone
add constraint fk_funcionario_funcionario_telefone
foreign key (funcionario_cd_funcionario) 
references funcionario (cd_funcionario);
--gerente_coordena
alter table gerente_coordena
add constraint fk_gerente_gerente_coordena 
foreign key (gerente_cd_gerente)
references gerente (cd_gerente);

alter table gerente_coordena
add constraint fk_tutor_gerente_coordena
foreign key (tutor_cd_tutor)
references tutor(cd_tutor);

alter table gerente_coordena
add constraint fk_professor_gerente_coordena
foreign key (professor_cd_professor)
references professor(cd_professor);

alter table gerente_coordena
add constraint fk_aluno_gerente_coordena
foreign key (aluno_matricula_aluno)
references aluno (matricula_aluno);

--Tutor Gerencia Forum:
alter table tutor_gerencia_forum
add constraint fk_tutor_tutor_gerencia_forum
foreign key (tutor_cd_tutor)
references tutor (cd_tutor);

alter table tutor_gerencia_forum
add constraint fk_forum_tutor_gerencia_forum
foreign key (forum_id_forum)
references forum(id_forum);

--forum_m_aluno
alter table forum_m_aluno
add constraint fk_forum_forum_m_aluno
foreign key(forum_id_forum)
references forum (id_forum);

--forum_m_tutores
alter table forum_m_tutores
add constraint fk_forum_forum_m_tutores
foreign key (forum_id_forum)
references forum (id_forum);

--Aula
alter table aula 
add constraint fk_professor_aula 
foreign key (professor_cd_professor)
references professor (cd_professor);

--Modulo
alter table modulo
add constraint fk_professor_modulo
foreign key (professor_cd_professor)
references professor(cd_professor);

--Turma 
alter table turma 
add constraint fk_gerente_turma
foreign key (gerente_cd_gerente)
references gerente(cd_gerente);

--aluno_assiste_aula

alter table aluno_assiste_aula
add constraint fk_aluno_aluno_assiste_aula
foreign key (aluno_matricula_aluno)
references aluno (matricula_aluno);

--aula modulo

alter table aula_modulo
add constraint fk_modulo_aula_modulo
foreign key (modulo_cd_modulo)
references modulo (cd_modulo);

--Dashboard
alter table dashboard
add constraint fk_aluno_dashboard
foreign key(aluno_matricula_aluno)
references aluno(matricula_aluno);

-- modulo_concluido
alter table modulo_concluido
add constraint fk_dashboard_modulo_concluido
foreign key (dashboard_id_dashboard)
references dashboard (id_dashboard);

-- Aula_dashboard
alter table aula_dashboard
add constraint fk_dashboard_aula_dashboard
foreign key (dashboard_id_dashboard)
references dashboard(id_dashboard);

--aluno_telefone

alter table aluno_telefone
add constraint fk_aluno_aluno_telefone
foreign key (aluno_matricula_aluno)
references aluno(matricula_aluno);



--Questão 3 
--a)

alter table turma modify turno varchar(1);

--b)

alter table aula drop column link_material_apoio;

--c)

drop table funcionario_telefone;


--Questãio 4

--a) 
--Funcionario 

insert into funcionario (cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func) 
values ('01','1111111111','Jorge',date '1981-05-19','jorge@email.com','rua.laranja','belem','para','66044141','jorgeger','123456');

insert into funcionario (cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func) 
values ('02','1111111222','Rosana',date '1990-08-21','rosana@email.com','rua.marrom','ananindeua','para','66014277','rosanatut','654321');

insert into funcionario (cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func) 
values ('03','1111111333','Chimira',date '1985-02-28','chimira@email.com','rua.cinza','belem','para','66017577','chimiratut','123oliveira4');

insert into funcionario (cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func) 
values ('04','1111111444','Mutema',date '1992-06-21','mutema@email.com','Av.Augusto Montenegro','belem','para','66017741','mutetmal','salvadordapatria123');

insert into funcionario (cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func) 
values ('05','1111111555','Sasá',date '1979-01-28','sasa@email.com','R.Quintino Bocaiuva','belem','para','66017741','sasaprof','noveladasnove123');

--verificador após insert, funcionario:
select cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func from funcionario

-- as ramificações do funcionario.
-- gerente
insert into gerente (funcionario_cd_funcionario,cd_gerente) values ((select cd_funcionario from funcionario where cd_funcionario = '01'), '01');
-- professor 
insert into professor (funcionario_cd_funcionario,cd_professor) values ((select cd_funcionario from funcionario where cd_funcionario = '02'), '01');
insert into professor (funcionario_cd_funcionario,cd_professor) values ((select cd_funcionario from funcionario where cd_funcionario = '03'), '02');
--tutor
insert into tutor (funcionario_cd_funcionario,cd_tutor) values ((select cd_funcionario from funcionario where cd_funcionario = '04'), '01');
insert into tutor (funcionario_cd_funcionario,cd_tutor) values ((select cd_funcionario from funcionario where cd_funcionario = '05'), '02');

--Aula
insert into aula (professor_cd_professor,link_aula,data_aula,cd_aula) 
values ((select cd_professor from professor where cd_professor = '01'),'http://ead.com.br/aula01',date'21-08-06','00001');

insert into aula (professor_cd_professor,link_aula,data_aula,cd_aula) 
values ((select cd_professor from professor where cd_professor = '02'),'http://ead2.com.br/aula01',date'21-08-08','00002');
