# 条件分岐

```
// 構文
case
	when 条件1 then 値1  // 条件1が true なら値1
	when 条件2 then 値2  // 条件2が true なら値2
	else 値3
end
```

Q. ユーザーを累計注文回数でランク分け[ ID, 注文回数, ランク ]。ランクが高い順に並べる。
A: 5 回以上
B: 2 回以上
C: 1 回
※ 0 回のユーザーは出力しない

```
select
	users.id user_id,
	count(*) num,
	case
		when count(*) >= 5 then 'A'
		when count(*) >= 2 then 'B'
		else 'C'
	end user_runk
from
	users
inner join
	orders
on
	users.id = orders.user_id
group by
	users.id
order by
	user_runk;
```

Q. 取得値 null を 0 に置き換える

```
select
	products.id,
	products.name,
	case
		when sum(order_details.product_qty) is null then 0
		else sum(order_details.product_qty)
	end num
from
	products
left outer join
	order_details
on
	products.id = order_details.product_id
group by
	products.id;
```

Q. 全商品を累計販売個数でランク分け。ランクが高い順に並び替え。[ ID, 商品名, 販売個数, ランク ]
A: 20 個以上
B: 10 個以上
C: 10 個未満

```
select
	products.id product_id,
	products.name product_name,
	sum(order_details.product_qty) num,
	case
		when sum(order_details.product_qty) >= 20 then 'A'
		when sum(order_details.product_qty) >= 10 then 'B'
		else 'C'
	end product_rank
from
	products
left outer join
	order_details
on
	products.id = order_details.product_id
group by
	products.id
order by
	sum(order_details.product_qty) desc;
```
