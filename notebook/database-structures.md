# データベース構造の操作

## データベースの作成

```
// 構文
create database [DB name];
```

Q. book_store という名前の DB を作成

```
create database book_store;
```

## テーブルの追加

```
create table
	[table]
	(
		id int not null auto_increment primary key,
		title varchar(255) not null
	)
```

## テーブル構造の変更

```
// column の追加
alter table
	[table]
add
	[column] [型]
after
	[other_column];

// column 名の変更
alter table
	[table]
change
	[old_column]
	[new_column] [型];

// column の削除
alter table
	[table]
drop
	[column];

// table の削除
drop table [table];

// database の削除
drop database [DB name];
```
