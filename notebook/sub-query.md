# サブクエリ

## サブクエリとは

- ある問い合わせの結果に基づきとなる問い合わせを行う仕組み
- 複雑な問合せができる
- where 句の中で使うことが多い
- where 句以外にも、select, from, having など様々な場所で利用できる

```
// 構文
select [column1] from [table1] where [処理] ( select [column2] from [table2] ... );
```

Q. 2017 年 12 月に商品を購入していないユーザーの一覧。[ ID, 苗字, email ]

```
# select
	id,
	last_name,
	email
from
	users
where
	id not in
	(
		select
			user_id
		from
			orders
		where
			order_time >= '2017-12-01 00:00:00'
		and
			order_time < '2018-01-01 00:00:00'
	);
```

Q. 全商品の平均単価より単価が高い商品の一覧

```
# select
	*
from
	products
where
	price >
	(
		select
			avg(price)
		from
			products
	);
```

Q. 全商品の平均単価より単価が高い商品の一覧。単価の高い順に並び替え。単価が同じ場合は登録順。

```
# select
	*
from
	products
where
	price >
	(
		select
			avg(price)
		from
			products
	)
order by
	price desc,
	id asc;
```
