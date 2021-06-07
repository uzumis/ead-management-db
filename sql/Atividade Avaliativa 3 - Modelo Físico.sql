-- 2)
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
    constraint pk_professor primary key (funcionario_cd_funcionario,cd_professor)
    );
create table tutor(
    funcionario_cd_funcionario number(2),
    cd_tutor number(2),
    constraint pk_tutor primary key (funcionario_cd_funcionario,cd_tutor)
    );
create table gerente(
    funcionario_cd_funcionario number (2),
    cd_gerente number(2),
    constraint pk_gerente primary key (funcionario_cd_funcionario,cd_gerente)
    );
create table funcionario_telefone(
    funcionario_cd_funcionario number (2),
    cd_telefone number (5),
    telefone number (11),
    constraint pk_funcionario_telefone primary key (funcionario_cd_funcionario,cd_telefone)
    );
create table tutor_gerencia_forum(
tutor_cd_tutor number (2),
id_forum number (5),
constraint pk_tutor_gerencia_forum primary key (tutor_cd_tutor,id_forum)
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
    data_auka date,
    link_material_apoio char (60),
    cd_aula number (5),
    constraint pk_aula primary key (professor_cd_professor,cd_aula)
    );
create table modulo(
    professor_cd_professor number(2),
    cd_modulo number(3),
    nome_modulo char(20),
    carga_horaria number(3),
    constraint pk_modulo primary key (professor_cd_professor, cd_modulo)
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
    data_criacao_turma date default sysdate,
    turno number(3),
    data_encerramento_turma date,
    constraint pk_turma primary key (cd_turma,aluno_matricula_aluno)
    );
create table aluno_assiste_aula(
    aula_cd_aula number (5),
    aluno_matricula_aluno number(11),
    constraint pk_aluno_assiste_aula primary key (aula_cd_aula,aluno_matricula_aluno)
    );
create table aula_modulo(
    aula_cd_aula number(5),
    modulo_cd_modulo number(5),
    constraint pk_aula_modulo primary key (aula_cd_aula,modulo_cd_modulo)
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