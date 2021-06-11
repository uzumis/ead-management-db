--Atividade Avaliativa III – Banco de Dados I

--Professora: Fabíola Pantoja Oliveira Araújo;

--Discentes: Andrey Radanny Santos Andrade (201711140047) ; Jhoylan Gonçalves dos Santos (201711140034); Thiago Calado Sosinho (201504040037)

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
    constraint pk_professor primary key (funcionario_cd_funcionario),
	constraint uk_professor unique (cd_professor)
    );
create table tutor(
    funcionario_cd_funcionario number(2),
    cd_tutor number(2),
    constraint pk_tutor primary key (funcionario_cd_funcionario),
	constraint uk_tutor unique (cd_tutor)
    );
create table gerente(
    funcionario_cd_funcionario number (2),
    cd_gerente number(2),
    constraint pk_gerente primary key (funcionario_cd_funcionario),
	constraint uk_gerente unique  (cd_gerente)
    );
create table funcionario_telefone(
    funcionario_cd_funcionario number (2),
    cd_telefone number (5),
    telefone number (11),
    constraint pk_funcionario_telefone primary key (funcionario_cd_funcionario,cd_telefone)
    );
	
create table gerente_coordena (
    gerente_cd_gerente number(2),
    tutor_cd_tutor number(2),
    professor_cd_professor number(2),
    aluno_matricula_aluno number (2)
    );
	
create table aula (
    professor_cd_professor number (2),
    link_aula char(60),
    data_aula date,
    link_material_apoio char (60),
    cd_aula number (5),
    constraint pk_aula primary key (cd_aula)
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
create table tutor_gerencia_forum(
    tutor_cd_tutor number (2),
    forum_id_forum number (5)
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

--Forum
alter table forum
add constraint fk_forum
foreign key(tutor_cd_tutor)
references tutor(cd_tutor);

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

--tutor_gerencia_forum
alter table tutor_gerencia_forum
add constraint fk_tutor_tutor_gerencia_forum 
foreign key (tutor_cd_tutor)
references tutor(cd_tutor);

alter table tutor_gerencia_forum
add constraint fk_forum_tutor_gerencia_forum
foreign key (forum_id_forum)
references forum(id_forum);
--Questão 3 
--a)

alter table turma modify turno varchar(1);


--b)

alter table aula drop column link_material_apoio;

-- como ficou a tabela aula após esse drop

select * from aula;

--c)

drop table gerente_coordena;

-- O modelo relacional ficou sem o relacionamento quaternario.


--Questãio 4

--a) 

--Funcionario  1

insert into funcionario (cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func) 
values ('01','1111111111','Jorge',date '1966-05-19','jorge@email.com','rua.laranja','belem','para','66044141','jorgeger','123456');

insert into funcionario (cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func) 
values ('02','1111111222','Rosana',date '1980-08-21','rosana@email.com','rua.marrom','ananindeua','para','66014277','rosanatut','654321');

insert into funcionario (cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func) 
values ('03','1111111333','Chimira',date '1985-02-28','chimira@email.com','rua.cinza','belem','para','66017577','chimiratut','123oliveira4');

insert into funcionario (cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func) 
values ('04','1111111444','Mutema',date '1972-06-21','mutema@email.com','Av.Augusto Montenegro','belem','para','66017741','mutetmal','salvadordapatria123');

insert into funcionario (cd_funcionario,cpf_do_funcionario,nome_do_funcionario,data_nasc_func,email_func,nomenumlogradouro,cidade,estado,cep,login_func,senha_func) 
values ('05','1111111555','Sasá',date '1979-01-28','sasa@email.com','R.Quintino Bocaiuva','belem','para','66017741','sasaprof','noveladasnove123');


--gerente_coordena

--Não existe mais.

-- as ramificações do funcionario. 2,3,4

-- gerente

insert into gerente (funcionario_cd_funcionario,cd_gerente) values ((select cd_funcionario from funcionario where cd_funcionario = '01'), '01');

-- professor 
insert into professor (funcionario_cd_funcionario,cd_professor) values ((select cd_funcionario from funcionario where cd_funcionario = '02'), '02');
insert into professor (funcionario_cd_funcionario,cd_professor) values ((select cd_funcionario from funcionario where cd_funcionario = '03'), '03');
--tutor
insert into tutor (funcionario_cd_funcionario,cd_tutor) values ((select cd_funcionario from funcionario where cd_funcionario = '04'), '04');
insert into tutor (funcionario_cd_funcionario,cd_tutor) values ((select cd_funcionario from funcionario where cd_funcionario = '05'), '05');

--Aula 5
insert into aula (professor_cd_professor,link_aula,data_aula,cd_aula) 
values ((select cd_professor from professor where cd_professor = '02'),'http://ead.com.br/professor01/modulo001/aula01',date'21-08-06','00001');

insert into aula (professor_cd_professor,link_aula,data_aula,cd_aula) 
values ((select cd_professor from professor where cd_professor = '02'),'http://ead.com.br/professor02/modulo002/aula01',date'21-08-07','00002');

insert into aula (professor_cd_professor,link_aula,data_aula,cd_aula) 
values ((select cd_professor from professor where cd_professor = '03'),'http://ead.com.br/professor01/modulo003/aula01',date'21-08-08','00003');

insert into aula (professor_cd_professor,link_aula,data_aula,cd_aula) 
values ((select cd_professor from professor where cd_professor = '03'),'http://ead.com.br/professor02/modulo004/aula01',date'21-08-09','00004');

insert into aula (professor_cd_professor,link_aula,data_aula,cd_aula) 
values ((select cd_professor from professor where cd_professor = '02'),'http://ead.com.br/professor01/modulo005/aula01',date'21-08-12','00005');
 
--Modulo 6


insert into modulo (professor_cd_professor,cd_modulo,nome_modulo,carga_horaria) 
values ((select cd_professor from professor where cd_professor = '02'),'001','Quimica Organica','60');

insert into modulo (professor_cd_professor,cd_modulo,nome_modulo,carga_horaria) 
values ((select cd_professor from professor where cd_professor = '02'),'002','Física Teórica','44');

insert into modulo (professor_cd_professor,cd_modulo,nome_modulo,carga_horaria) 
values ((select cd_professor from professor where cd_professor = '03'),'003','Raciocínio Lógico','40');

insert into modulo (professor_cd_professor,cd_modulo,nome_modulo,carga_horaria) 
values ((select cd_professor from professor where cd_professor = '03'),'004','Álgebra Linear','50');

insert into modulo (professor_cd_professor,cd_modulo,nome_modulo,carga_horaria) 
values ((select cd_professor from professor where cd_professor = '02'),'005','Matemática Concreta','35');

-- Aluno -- adicionar a turma depois (turma_cd_turma) 7

insert into aluno (matricula_aluno,cpf_aluno ,nome_aluno ,data_nasc_aluno ,email_aluno,nomenumlogradouro,cidade,estado,cep,login_aluno,senha_aluno) 
values ('12345678910','0321247852','Hugo',date'1992-05-12','hugoplaystation@email.com','Rod.Mario Covas','Ananindeua','Pará','66347114','huguinho','tiopatinhas123');

insert into aluno (matricula_aluno,cpf_aluno ,nome_aluno ,data_nasc_aluno ,email_aluno,nomenumlogradouro,cidade,estado,cep,login_aluno,senha_aluno) 
values ('12345678911','0323412445','José',date'1993-04-04','joseelias@email.com','R.Boaventura da Silva','Belém','Pará','66053098','zezinho','patodonald123');

insert into aluno (matricula_aluno,cpf_aluno ,nome_aluno ,data_nasc_aluno ,email_aluno,nomenumlogradouro,cidade,estado,cep,login_aluno,senha_aluno) 
values ('12345678912','0343412425','Luiz',date'1992-05-21','luizinhofreefire@email.com','Av.Presidente Vargas','Belém','Pará','66066033','luizinho','ducktalesuhul');

insert into aluno (matricula_aluno,cpf_aluno ,nome_aluno ,data_nasc_aluno ,email_aluno,nomenumlogradouro,cidade,estado,cep,login_aluno,senha_aluno) 
values ('12345678913','0453412425','Charles',date'1990-02-28','charlinho@email.com','R.Tupinambás','Belém','Pará','66033040','charles123','eugostodebatata');

insert into aluno (matricula_aluno,cpf_aluno ,nome_aluno ,data_nasc_aluno ,email_aluno,nomenumlogradouro,cidade,estado,cep,login_aluno,senha_aluno) 
values ('12345678914','0453412345','Ronaldo',date'1993-07-22','ronaldinho@email.com','Av.Visc. Souza Franco','Belém','Pará','66055032','ronaldo64','futebolbrasilenho');



-- Aluno Telefone  8

insert into aluno_telefone (aluno_matricula_aluno,cd_telefone_aluno,telefone_aluno) 
values ((select matricula_aluno from aluno where nome_aluno = 'Hugo'),'91','44428922');

insert into aluno_telefone (aluno_matricula_aluno,cd_telefone_aluno,telefone_aluno) 
values ((select matricula_aluno from aluno where nome_aluno = 'José'),'92','40028922');

insert into aluno_telefone (aluno_matricula_aluno,cd_telefone_aluno,telefone_aluno) 
values ((select matricula_aluno from aluno where nome_aluno = 'Luiz'),'93','961410009');

insert into aluno_telefone (aluno_matricula_aluno,cd_telefone_aluno,telefone_aluno) 
values ((select matricula_aluno from aluno where nome_aluno = 'Charles'),'94','33952222');

insert into aluno_telefone (aluno_matricula_aluno,cd_telefone_aluno,telefone_aluno) 
values ((select matricula_aluno from aluno where nome_aluno = 'Ronaldo'),'95','40034144');

--funcionario_telefone 9

insert into funcionario_telefone (funcionario_cd_funcionario,cd_telefone,telefone) 
values ((select cd_funcionario from funcionario where cd_funcionario = '01'), '01','990045235');

insert into funcionario_telefone (funcionario_cd_funcionario,cd_telefone,telefone) 
values ((select cd_funcionario from funcionario where cd_funcionario = '02'), '02','33622214');

insert into funcionario_telefone (funcionario_cd_funcionario,cd_telefone,telefone) 
values ((select cd_funcionario from funcionario where cd_funcionario = '03'), '03','985412412');

insert into funcionario_telefone (funcionario_cd_funcionario,cd_telefone,telefone) 
values ((select cd_funcionario from funcionario where cd_funcionario = '04'), '04','987254121');

insert into funcionario_telefone (funcionario_cd_funcionario,cd_telefone,telefone) 
values ((select cd_funcionario from funcionario where cd_funcionario = '05'), '05','40084444');

-- Turma 10
insert into turma (cd_turma,gerente_cd_gerente,aluno_matricula_aluno,data_criacao_turma,turno,data_encerramento_turma)
values ('0001',(select cd_gerente from gerente where cd_gerente = '01'),(select matricula_aluno from aluno where matricula_aluno='12345678910'),date'21-06-10','m',date'21-12-21');

insert into turma (cd_turma,gerente_cd_gerente,aluno_matricula_aluno,data_criacao_turma,turno,data_encerramento_turma)
values ('0002',(select cd_gerente from gerente where cd_gerente = '01'),(select matricula_aluno from aluno where matricula_aluno='12345678913'),date'21-06-10','m',date'21-12-21');

insert into turma (cd_turma,gerente_cd_gerente,aluno_matricula_aluno,data_criacao_turma,turno,data_encerramento_turma)
values ('0003',(select cd_gerente from gerente where cd_gerente = '01'),(select matricula_aluno from aluno where matricula_aluno='12345678911'),date'21-06-10','t',date'21-12-21');

insert into turma (cd_turma,gerente_cd_gerente,aluno_matricula_aluno,data_criacao_turma,turno,data_encerramento_turma)
values ('0004',(select cd_gerente from gerente where cd_gerente = '01'),(select matricula_aluno from aluno where matricula_aluno='12345678912'),date'21-06-10','t',date'21-12-21');

insert into turma (cd_turma,gerente_cd_gerente,aluno_matricula_aluno,data_criacao_turma,turno,data_encerramento_turma)
values ('0005',(select cd_gerente from gerente where cd_gerente = '01'),(select matricula_aluno from aluno where matricula_aluno='12345678914'),date'21-06-10','n',date'22-01-21');

-- ao adicinar a turma, eu preciso atualizar a tabela aluno com as turmas criadas

update aluno set turma_cd_turma='0001' 
where matricula_aluno = '12345678910';

update aluno set turma_cd_turma='0002' 
where matricula_aluno = '12345678913';

update aluno set turma_cd_turma='0003' 
where matricula_aluno = '12345678911';

update aluno set turma_cd_turma='0004' 
where matricula_aluno = '12345678912';

update aluno set turma_cd_turma='0005' 
where matricula_aluno = '12345678914';

-- Forum 11

insert into forum (id_forum,tutor_cd_tutor) 
values ('00123',(select cd_tutor from tutor where cd_tutor = '04'));

insert into forum (id_forum,tutor_cd_tutor) 
values ('00456',(select cd_tutor from tutor where cd_tutor = '05'));

insert into forum (id_forum,tutor_cd_tutor) 
values ('00145',(select cd_tutor from tutor where cd_tutor = '04'));

insert into forum (id_forum,tutor_cd_tutor) 
values ('00678',(select cd_tutor from tutor where cd_tutor = '05'));

insert into forum (id_forum,tutor_cd_tutor) 
values ('00999',(select cd_tutor from tutor where cd_tutor = '04'));

-- forum_m_aluno 12

insert into forum_m_aluno (forum_id_forum,cd_m_aluno,mensagens_aluno) 
values ((select id_forum from forum where id_forum = '00123'),'001','Professor eu tenho uma duvida!');

insert into forum_m_aluno (forum_id_forum,cd_m_aluno,mensagens_aluno) 
values ((select id_forum from forum where id_forum = '00456'),'001','Professor eu tenho uma duvida!');

insert into forum_m_aluno (forum_id_forum,cd_m_aluno,mensagens_aluno) 
values ((select id_forum from forum where id_forum = '00145'),'001','Professor eu tenho uma duvida!');

insert into forum_m_aluno (forum_id_forum,cd_m_aluno,mensagens_aluno) 
values ((select id_forum from forum where id_forum = '00678'),'001','Professor eu tenho uma duvida!');

insert into forum_m_aluno (forum_id_forum,cd_m_aluno,mensagens_aluno) 
values ((select id_forum from forum where id_forum = '00999'),'001','Resolvi aqui, obrigado!');


-- forum_m_tutores 13

insert into forum_m_tutores (forum_id_forum,cd_m_tutores,mensagens_tutores) 
values ((select id_forum from forum where id_forum = '00123'),'001','Estou aqui para te responder as duvidas da aula');

insert into forum_m_tutores (forum_id_forum,cd_m_tutores,mensagens_tutores) 
values ((select id_forum from forum where id_forum = '00456'),'001','Estou aqui para te responder as duvidas da aula');

insert into forum_m_tutores (forum_id_forum,cd_m_tutores,mensagens_tutores) 
values ((select id_forum from forum where id_forum = '00145'),'001','Estou aqui para te responder as duvidas da aula');

insert into forum_m_tutores (forum_id_forum,cd_m_tutores,mensagens_tutores) 
values ((select id_forum from forum where id_forum = '00678'),'001','Estou aqui para te responder as duvidas da aula');

insert into forum_m_tutores (forum_id_forum,cd_m_tutores,mensagens_tutores) 
values ((select id_forum from forum where id_forum = '00999'),'001','Por nada! Irei remover em seguida a mensagem respondida');

-- tutor_gerencia_forum 14

insert into tutor_gerencia_forum (tutor_cd_tutor,forum_id_forum) 
values ((select cd_tutor from tutor where cd_tutor='04'),(select id_forum from forum where id_forum = '00123'));

insert into tutor_gerencia_forum (tutor_cd_tutor,forum_id_forum) 
values ((select cd_tutor from tutor where cd_tutor='05'),(select id_forum from forum where id_forum = '00456'));

insert into tutor_gerencia_forum (tutor_cd_tutor,forum_id_forum) 
values ((select cd_tutor from tutor where cd_tutor='04'),(select id_forum from forum where id_forum = '00145'));

insert into tutor_gerencia_forum (tutor_cd_tutor,forum_id_forum) 
values ((select cd_tutor from tutor where cd_tutor='05'),(select id_forum from forum where id_forum = '00678'));

insert into tutor_gerencia_forum (tutor_cd_tutor,forum_id_forum) 
values ((select cd_tutor from tutor where cd_tutor='04'),(select id_forum from forum where id_forum = '00999'));

--aluno assiste aula 15

insert into aluno_assiste_aula (aula_cd_aula,aluno_matricula_aluno)
values ((select cd_aula from aula where cd_aula = '01'),(select matricula_aluno from aluno where matricula_aluno = '12345678911'));

insert into aluno_assiste_aula (aula_cd_aula,aluno_matricula_aluno)
values ((select cd_aula from aula where cd_aula = '01'),(select matricula_aluno from aluno where matricula_aluno = '12345678912'));

insert into aluno_assiste_aula (aula_cd_aula,aluno_matricula_aluno)
values ((select cd_aula from aula where cd_aula = '02'),(select matricula_aluno from aluno where matricula_aluno = '12345678913'));

insert into aluno_assiste_aula (aula_cd_aula,aluno_matricula_aluno)
values ((select cd_aula from aula where cd_aula = '01'),(select matricula_aluno from aluno where matricula_aluno = '12345678914'));

insert into aluno_assiste_aula (aula_cd_aula,aluno_matricula_aluno)
values ((select cd_aula from aula where cd_aula = '01'),(select matricula_aluno from aluno where matricula_aluno = '12345678910'));


--aula modulo 16

insert into aula_modulo (aula_cd_aula,modulo_cd_modulo)
 values ((select cd_aula from aula where cd_aula ='01'),(select cd_modulo from modulo where cd_modulo = '001'));
 
 
insert into aula_modulo (aula_cd_aula,modulo_cd_modulo)
 values ((select cd_aula from aula where cd_aula ='01'),(select cd_modulo from modulo where cd_modulo = '002'));
 
 
insert into aula_modulo (aula_cd_aula,modulo_cd_modulo)
 values ((select cd_aula from aula where cd_aula ='01'),(select cd_modulo from modulo where cd_modulo = '003'));
 
 
insert into aula_modulo (aula_cd_aula,modulo_cd_modulo)
 values ((select cd_aula from aula where cd_aula ='01'),(select cd_modulo from modulo where cd_modulo = '004'));
 
 
insert into aula_modulo (aula_cd_aula,modulo_cd_modulo)
 values ((select cd_aula from aula where cd_aula ='01'),(select cd_modulo from modulo where cd_modulo = '005'));

--dashboard 17 

insert into dashboard (id_dashboard,aluno_matricula_aluno,ch_realizada)
values ('12345',(select matricula_aluno from aluno where matricula_aluno = '12345678910'),'6');

insert into dashboard (id_dashboard,aluno_matricula_aluno,ch_realizada)
values ('12346',(select matricula_aluno from aluno where matricula_aluno = '12345678911'),'5');

insert into dashboard (id_dashboard,aluno_matricula_aluno,ch_realizada)
values ('12347',(select matricula_aluno from aluno where matricula_aluno = '12345678912'),'4');

insert into dashboard (id_dashboard,aluno_matricula_aluno,ch_realizada)
values ('12348',(select matricula_aluno from aluno where matricula_aluno = '12345678913'),'10');

insert into dashboard (id_dashboard,aluno_matricula_aluno,ch_realizada)
values ('12349',(select matricula_aluno from aluno where matricula_aluno = '12345678914'),'3');


--modulo-concluido 18

insert into modulo_concluido (dashboard_id_dashboard,cd_mod_concluido,modulo_concluido)
values ((select id_dashboard from dashboard where id_dashboard = '12345'), '00001', '0');

insert into modulo_concluido (dashboard_id_dashboard,cd_mod_concluido,modulo_concluido)
values ((select id_dashboard from dashboard where id_dashboard = '12346'), '00002', '0');

insert into modulo_concluido (dashboard_id_dashboard,cd_mod_concluido,modulo_concluido)
values ((select id_dashboard from dashboard where id_dashboard = '12347'), '00003', '0');

insert into modulo_concluido (dashboard_id_dashboard,cd_mod_concluido,modulo_concluido)
values ((select id_dashboard from dashboard where id_dashboard = '12348'), '00004', '0');

insert into modulo_concluido (dashboard_id_dashboard,cd_mod_concluido,modulo_concluido)
values ((select id_dashboard from dashboard where id_dashboard = '12349'), '00005', '0');

--aula-dashboard 19

insert into aula_dashboard (dashboard_id_dashboard,cd_aula_c,aula_concluida) 
values ((select id_dashboard from dashboard where id_dashboard = '12345'), '0001','1');

insert into aula_dashboard (dashboard_id_dashboard,cd_aula_c,aula_concluida) 
values ((select id_dashboard from dashboard where id_dashboard = '12346'), '0002','1');

insert into aula_dashboard (dashboard_id_dashboard,cd_aula_c,aula_concluida) 
values ((select id_dashboard from dashboard where id_dashboard = '12347'), '0003','1');

insert into aula_dashboard (dashboard_id_dashboard,cd_aula_c,aula_concluida) 
values ((select id_dashboard from dashboard where id_dashboard = '12348'), '0004','1');

insert into aula_dashboard (dashboard_id_dashboard,cd_aula_c,aula_concluida) 
values ((select id_dashboard from dashboard where id_dashboard = '12349'), '0005','1');

-- b) Comando atualiza a carga horária das disciplinas para 45, caso a carga horária atual dela não seja 60 ou 40 horas.
update modulo set carga_horaria = '45' 
where carga_horaria not in ('60','40');

--c) Comando deleta a linha ao qual o aluno tenha digitado a palvra "Resolvi" dentro de uma mensagem no fórum.

delete from forum_m_aluno 
where mensagens_aluno like 'Resolvi%';

--d) Select mostra em qual código de turma os alunos estão matriculados pela ordem dos seus respectivos nomes.

select nome_aluno, cd_turma 
from aluno join turma on matricula_aluno = aluno_matricula_aluno
order by nome_aluno;

--e) Select mostra qual dos professores tem pelo menos mais de  2 módulos  e códigos de aula vinculados a ele. 

select nome_do_funcionario, count(nome_modulo), count(cd_aula) 
from funcionario  join modulo  on cd_funcionario  = professor_cd_professor
join aula on  cd_funcionario=cd_aula 
group by nome_do_funcionario having count(*) >2;
