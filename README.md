# pgeyes (Postgres天眼通)
pgeyes 是一個 PostgreSQL extension，收集一系列管理工具，透過 Postgres FDW 瞭解遠端資料庫的情況。

## 安裝 Installation
- 以 UBUNTU & PostgreSQL 9.6 為例 (其他版本請自行替換)

```
$ sudo apt install git make postgresql postgresql-server-dev-9.6
$ git clone https://github.com/ycku/pgeyes.git
$ cd pgeyes
$ sudo make install
$ sudo su - postgres
$ psql
```

- 開始在 psql 中操作
```
postgres=# CREATE SCHEMA pgeyes;
postgres=# REVOKE ALL ON SCHEMA pgeyes FROM PUBLIC;
postgres=# CREATE EXTENSION pgeyes WITH SCHEMA pgeyes;
postgres=# SELECT pgeyes.pgeyes();
```

- 應該會出現這樣的結果，表示安裝成功。
```
 pgeyes
--------
 t
(1 row)
```
