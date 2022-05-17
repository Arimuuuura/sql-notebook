## SQL の基本

```
// DB一覧
# show databases;

// DBを指定
# use [DBname];

// table 一覧
# show tables;

// table 削除
# DROP TABLE [table];

// table を指定して columns 一覧
# show columns from [table];

// テーブルを指定して全データを取得
# select * from [table];

// テーブルを指定して全データ削除
# truncate table [table];

// 列を指定してデータを取得
# select [column], [column] from [table];

// 列に別名をつける(as は無くても良い)
# select [old_column] as [new_column], [old_column] as [new_column] from [table];

// 値に対して演算を行う ex.
# select name as 名前, price as 価格, price * 1.08 as 税込価格 from products;

// 条件を指定して値を取得 ex.
# select name, price from products where price >= 9800;

// パターンマッチングによる絞り込み
# select * from [table] where [column] like [条件];

// 取得件数を制限する ex.
# select * from products limit 10;

// 10番目から10件
select * from products limit 10, 10;
```

## select 文の記述順序/実行順序

```
- select ・・・ カラムの指定
- from ・・・ テーブルの指定
- where ・・・ 絞り込み条件の指定
- group ・・・ グループ化の条件を指定
- having ・・・ グループ化した後の絞り込み条件を指定
- order ・・・ 並び替え条件を指定
- limit ・・・ 取得する行数の制限

1. select / from
2. from / where
3. where / group by
4. group by / having
5. having / select
6. order by / order by
7. limit / limit
```

## 代表的な演算子

```
- [=] 等しい
- [>] より大きい
- [>=] 以上
- [<] より小さい
- [<=] 以下
- [<>], [!=] 等しくない
- [in] 値がセットした値内に含まれている
- [not in] 値がセットした値内に含まれていない
- [is null] 値がnull
- [is not null] 値がnullでない
- [like] パターンマッチング(曖昧検索)
- [between ... and ...] 値が値の範囲内に含まれているか
```

## ワイルドカード文字

```
// 文字列のパターンを指定
- '%' ・・・ 0文字以上の任意の文字列
- '_' ・・・ 任意の1文字

// ex.
- '中%' -> '中'で始まる文字列
- '%中%' -> '中'を含む文字列
- '%子' -> '子'で終わる文字列
- '__子' -> 何かしらの2文字で始まり'子'で終わる文字列
```
