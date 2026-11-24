# Tema 17 — Controle de Prazos Jurídicos

## 1. Sobre o projeto

Projeto acadêmico desenvolvido com o objetivo de propor uma solução para o controle de prazos processuais em um escritório de advocacia, utilizando PostgreSQL 17.

O sistema busca facilitar a organização das informações jurídicas e auxiliar na identificação de prazos próximos do vencimento e processos sem movimentação recente.

## 2. Tecnologias utilizadas

- PostgreSQL 17
- pgAdmin 4
- SQL

## 3. Estrutura do banco de dados

O banco de dados foi organizado no schema `juridico`, contendo as seguintes tabelas:

- `advogado`: cadastro dos advogados.
- `parte`: cadastro das partes envolvidas nos processos.
- `processo`: informações dos processos judiciais.
- `processo_parte`: relacionamento entre processos e partes.
- `andamento`: histórico de movimentações processuais.
- `prazo`: registro dos prazos processuais.

## 4. Funcionalidades e consultas

O projeto contempla consultas SQL para:

- Identificar prazos com vencimento nos próximos sete dias.
- Identificar processos ativos sem andamento há pelo menos 90 dias.
- Consultar a quantidade de processos ativos por advogado.
- Identificar prazos pendentes já vencidos.

Também foram implementadas restrições de integridade, como `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE` e `CHECK`, além de índices para auxiliar na execução das consultas.

## 5. Testes e evidências

Foram realizados testes de integridade dos dados, consultas SQL e análise do plano de execução com `EXPLAIN (ANALYZE, BUFFERS)`.

O arquivo `tema17_completo.sql` contém o backup do banco de dados.

## 6. Metodologia de desenvolvimento

O acompanhamento das atividades foi organizado utilizando a metodologia ágil Kanban, por meio de um quadro no GitHub com as etapas:

- A Fazer
- Em andamento
- Concluído

## 7. Limitações

O projeto utiliza dados fictícios e não possui integração com o sistema PJe. Também não contempla regras completas de contagem de prazos jurídicos ou uma interface gráfica para usuários.

## 8. Autor

Projeto desenvolvido individualmente como atividade acadêmica.
