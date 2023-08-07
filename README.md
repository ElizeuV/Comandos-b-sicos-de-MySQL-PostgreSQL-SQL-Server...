# SQL
Comandos básicos MySQL, PostgreSQL...

1. CREATE:
   
O comando CREATE é usado para criar uma tabela, esquema ou índice.

                  CREATE TABLE table_name (
                         column1 datatype,
                         column2 datatype,
                         ....);
2. ALTER:
   
O comando ALTER é usado para adicionar, modificar ou excluir colunas ou restrições da tabela do banco de dados.

         ALTER TABLE Table_name ADD column_name datatype;
3. TRUNCATE:
   
O comando TRUNCATE é usado para excluir os dados presentes na tabela, mas isso não excluirá a tabela.

         TRUNCATE table table_name;
4. DROP:
   
O comando DROP é usado para excluir a tabela junto com seus dados.

         DROP TABLE table_name;
5. RENAME:
    
O comando RENAME é usado para renomear o nome da tabela.

         ALTER TABLE table_name1 RENAME to new_table_name1; 
6. INSERT:
    
A instrução INSERT é usada para inserir novos registros na tabela do banco de dados.

         INSERT INTO table_name (column1, column2, column3, ...) 
         VALUES (value1, value2, value3, ...);
7. SELECT:
    
A instrução Select é usada para selecionar dados das tabelas do banco de dados.

         SELECT column1, column2, ...
         FROM table_name; 
8. UPDATE:
    
A instrução UPDATE é usada para modificar os valores existentes dos registros presentes na tabela do banco de dados.

         UPDATE table_name
         SET column1 = value1, column2 = value2, ...
         WHERE condition; 
9. DELETE:
    
A instrução DELETE é usada para excluir os registros existentes presentes na tabela do banco de dados.

         DELETE FROM table_name where condition;
