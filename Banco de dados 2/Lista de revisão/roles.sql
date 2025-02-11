/*1. Criar os usuários administrador, intermediario1, intermediario2, vendedor e externo. Todos
os usuários deverão ter senha (padronize como postgres123). Os usuários intermediario1 e
intermediário2 tem senha válida por 1 ano. O usuário vendedor por 6 meses e o usuário
externo por 1 mês. */

CREATE ROLE administrador WITH LOGIN PASSWORD 'postgres123';
CREATE ROLE intermediario1 WITH LOGIN PASSWORD 'postgres123' VALID UNTIL '2026-02-10';
CREATE ROLE intermediario2 WITH LOGIN PASSWORD 'postgres123' VALID UNTIL '2026-02-10';
CREATE ROLE vendedor WITH LOGIN PASSWORD 'postgres123' VALID UNTIL '2025-08-10';
CREATE ROLE externo WITH LOGIN PASSWORD 'postgres123' VALID UNTIL '2025-03-10';

/*2. Crie um grupo de usuário chamado intermediarios e coloque os usuário intermediario1 e
intermediario2 neste grupo.*/

CREATE GROUP intermediarios;
ALTER GROUP intermediarios ADD USER intermediario1, intermediario2;

/*3. Atribua todos os privilégios sobre a manipulação de dados da base clientes para o usuário
administrador. Teste o funcionamento via consulta e inserção.*/

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO administrador;	
