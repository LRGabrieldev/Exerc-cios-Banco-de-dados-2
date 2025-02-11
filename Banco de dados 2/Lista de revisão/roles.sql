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

GRANT ALL PRIVILEGES ON cliente TO administrador;
SELECT has_table_privilege('administrador','cliente', 'SELECT');
SELECT has_table_privilege('administrador','cliente', 'INSERT');

/*4. Conceda às roles do grupo intermediários acesso de inserção e seleção na tabela produto.
Teste o funcionamento via consulta e inserção.
*/

GRANT SELECT, INSERT ON TABLE cliente TO intermediarios;
SELECT has_table_privilege('intermediarios','produto','SELECT');
SELECT has_table_privilege('intermediarios','produto','INSERT');

/*5. Conceda o privilégio de consulta e inserção na tabela cliente para o usuário vendedor. Logo
após teste os privilégios.*/

GRANT SELECT, INSERT ON cliente TO vendedor;
SELECT has_table_privilege('vendedor', 'cliente', 'SELECT');
SELECT has_table_privilege('vendedor', 'cliente', 'INSERT');

/*6. Conceda o privilégio de consulta somente nos atributos produto_nome e produto_preco da
tabela produto para o usuário externo; Teste os privilégios.
*/

GRANT SELECT (produto_nome, produto_preco) ON produto TO externo;
SELECT grantee, privilege_type, table_name, column_name
FROM information_schema.role_column_grants
WHERE grantee = 'externo'
AND table_name = 'produto'
AND column_name = 'produto_nome';

/*7. Dê permissão de leitura para a view clientes_produtos_parana para o papel vendedor. Teste
os privilégios.
*/

CREATE OR REPLACE VIEW clientes_produtos_parana AS
SELECT produto_codigo, produto_nome, produto_preco 
FROM produto;
SELECT * FROM clientes_produtos_parana;
GRANT SELECT ON clientes_produtos_parana TO vendedor;
SELECT has_table_privilege('vendedor', 'clientes_produtos_parana', 'SELECT');

/*8. Revogar o privilégio de seleção (concedido) na tabela clientes do usuário vendedor. Teste a
remoção através de consulta de privilégio às procedures do sistema PostgreSQL.
*/

REVOKE SELECT ON TABLE cliente FROM vendedor;
SELECT grantee, privilege_type, table_name, column_name
FROM information_schema.role_column_grants
WHERE grantee = 'vendedor'
AND table_name = 'cliente';

/*9. Faça a remoção da role externo do servidor de banco de dados. Verifique se a remoção foi
efetivada.*/

REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA PUBLIC FROM externo;
DROP ROLE IF EXISTS externo;
SELECT rolname FROM pg_roles
WHERE rolname = 'externo';

/*10. Remova o grupo intermediarios do servidor de banco de dados. Verifique se a remoção foi
efetivada*/

REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA PUBLIC FROM intermediarios;
DROP GROUP intermediarios;
SELECT rolname FROM pg_roles
WHERE rolname = 'intermediarios';
