# books-db

The books database is just a sandbox database to be used in other code examples and demos.

**books.mwb** is the MySQL Workbench file of the database design.

There is a small sample of data provided as insert statements in the model.

**books-db-create.sql** is the database creation script generated from MySQL Workbench.

## Create user and grant permissions

Local access from same machine running MySQL instance:

```sql
create user 'books_user'@'localhost' identified by 'password';
grant all on books.* to 'books_user'@'localhost';
```

Remote access from any machine on network different from machine running MySQL Instance:
```sql
create user 'books_user'@'%' identified by 'password';
grant all on books.* to 'books_user'@'%';
```

## Entity Relationship Diagram
<img src="books-data-model.png">

