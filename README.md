# books-db

The books database is just a sandbox database to be used in other code examples and demos.

books.mwb is the MySQL Workbench file fo the database design.

There is a small sample of data provided as insert statements.

books-db-create.sql is the database creation script generated from MySQL Workbench.

<img src="books-data-model.png">


## SQL commands to create the configured database user and grant permissions

```sql
create user 'books_user'@'localhost' identified by 'password';
grant all on books.* to 'books_user'@'localhost';
```