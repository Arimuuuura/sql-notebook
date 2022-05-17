# データの更新

## データの追加(insert)

```
// 構文
// column, value の数は一致している必要がある
insert into
	[table] ([column1], [column2], [column3] ...)
value
	([value1], [value2], [value3] ...);

// 複数行を一度に挿入する
insert into
	[table] ([column1], [column2], [column3] ...)
value
	([value1], [value2], [value3] ...),
	([value4], [value5], [value6] ...),
	([value7], [value8], [value9] ...),;

// 列名を省略して値を挿入
// テーブルの全カラムに対して値を指定
insert [table] value ([value1], [value2], [value3] ...);
```

Q. 新商品を一件追加

```
insert into
	products (name, price)
value
	('新商品A', 1000);
```

Q. 新商品３件をデータベースに追加する。

```
insert into
	products (name, price)
value
	('新商品C', 3000),
	('新商品D', 4000),
	('新商品E', 5000);
```

## データの更新(update)

```
// 構文
update
	[table]
set
	[column1] = [value1],
	[column2] = [value2],
	[column3] = [value3] ...
where ...;

```

Q. 全商品の価格を 10％引きに設定。

```
// 大量のレコードを更新する際は safe_mode 解除。実務では要注意。
set sql_safe_updates = 0;

update
	products
set
	price = price * 0.9;
```

Q. 商品 ID = 3 の商品名を [ SQL 入門 ]に変更。

```
update
	products
set
	name = 'SQL入門'
where
	id = 3;
```

// 更新条件にサブクエリを用いる
Q. 累計販売数が 10 を超える商品の価格を 5% UP。

```
set sql_safe_updates = 0;
update
	products
set
	price = price * 1.05
where
	id in
	(
		select
			order_id
		from
			order_details
		group by
			order_id
		having
			sum(product_qty) >= 10
	);

```

## データの削除(delete)

```
// 構文
delete from [table] where ...;

```
