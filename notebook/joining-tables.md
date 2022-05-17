# テーブルの結合

## テーブルの正規化

- テーブルを分けて情報の重複をなくす作業

### テーブル正規化のメリット

1. データ管理が容易になる
2. データ容量の削減
   → システムのパフォーマンス向上

## テーブルの結合

- テーブル同士をある条件で結合することにより、正規化なしの状態を作り出すこと

## 主キー、外部キー

- 主キー(Primary Key)・・・一つの行を特定できる列のこと
- 外部キー(Foreign Key)・・・他のテーブルとの関連付けに使う列のこと。外部キーは関連付けされた先のテーブルでは主キーになる

## リレーションシップの種類

- リレーションシップの種類・・・テーブル同士の結びつき・関係性の種類

```
- 1対1
- 1対多
- 多対多
```

## 内部結合でテーブルを結合する

```
// inner join 構文
select table1.column, table2.column from table1 inner join table2 on table1.column = table2.column;
```

Q. 顧客一覧を取得。都道府県 ID ではなく都道府県名で表示したい。[ ID, 苗字, 名前, 都道府県名 ]。

```
# select
   users.id,
   users.last_name,
   users.first_name,
   prefectures.name
from
   users
inner join
   prefectures
on
   users.prefecture_id = prefectures.id;
```

Q. 顧客一覧を取得。都道府県 ID ではなく都道府県名で表示したい。[ ID, 苗字, 名前, 都道府県名 ]。女性のみ。

```
# select
   users.id,
   users.last_name,
   users.first_name,
   prefectures.name
from
   users
inner join
   prefectures
on
   users.prefecture_id = prefectures.id
where
   users.gender = 2;
```

## 記述順序 / 実行順序

```
// 記述順序
1. select・・・カラムの指定
2. from・・・テーブルの指定
3. inner join・・・結合処理
4. where・・・絞り込み条件
5. group by・・・グループ化の条件
6. having・・・グループ化した後の絞り込み条件
7. order by・・・並び替え条件
8. limit・・・取得データの上限

// 実行順序
1. from・・・テーブルの指定
2. inner join・・・結合処理
3. where・・・絞り込み条件
4. group by・・・グループ化の条件
5. having・・・グループ化した後の絞り込み条件
6. select・・・カラムの指定
7. order by・・・並び替え条件
8. limit・・・取得データの上限
```

Q. 2017 年 1 月の東京都に住むユーザーの注文情報一覧。[ 注文 ID, 注文日時, 注文合計金額, ユーザー ID, 苗字, 名前 ]

```
# select
   orders.id order_id,
   orders.order_time order_time,
   orders.amount,
   users.id user_id,
   users.last_name,
   users.first_name
from
   orders
inner join
   users
on
   orders.user_id = users.id
where
   orders.order_time >= '2017-01-01 00:00:00'
and
   orders.order_time < '2017-02-01 00:00:00'
and
   users.prefecture_id = 13
order by
   order_id;
```

## 外部結合でテーブルを結合する

- 片方のテーブルの情報が全て出力されるテーブル結合
- 外部結合は欠落のあるデータ(片方のテーブルにしかないデータ)を取り扱う結合

- left outer join ・・・ from 句の左側のテーブルをマスターとする
- right outer join from 句の右側のテーブルをマスターとする

```
// left outer join 構文
select table1.column, table2.column from table1 left outer join table2 on table1.column = table2.column;

// users, orders の結合
select users.id user_id, users.last_name, orders.id order_id,orders.user_id order_user_id from users left outer join orders on users.id = orders.user_id order by users.id;
```

Q. 全ての商品に対する販売個数一覧

```
# select
   products.id,
   products.name,
   sum(order_details.product_qty) order_qty
from
   products
left outer join
   order_details
on
   products.id = order_details.product_id
group by
   products.id;
```

## 3 つ以上のテーブルの結合

Q. 注文一覧の取得。注文詳細と商品情報も一緒に取得。

```
# select
   orders.id order_id,
   orders.user_id user_id,
   orders.amount amount,
   orders.order_time order_time,
   products.name products_name,
   products.price products_price,
   order_details.product_qty product_qty
from
   orders
inner join
   order_details
on
   orders.id = order_details.order_id
inner join
   products
on
   order_details.product_id = products.id;
```

Q. 注文一覧の取得。注文詳細と商品情報とユーザーの苗字と名前も一緒に取得。

```
# select
   orders.id order_id,
   orders.user_id user_id,
   users.last_name,
   users.first_name,
   orders.amount amount,
   orders.order_time order_time,
   products.name products_name,
   products.price products_price,
   order_details.product_qty product_qty
from
   orders
inner join
   order_details
on
   orders.id = order_details.order_id
inner join
   products
on
   order_details.product_id = products.id
inner join
   users
on
   orders.user_id = users.id;
```

## 多対多の関係を含む結合

Q. 商品 ID3 に紐づく商品カテゴリを出力。[ 商品 ID, 商品名, カテゴリ名 ]

```
# select
   products.id products_id,
   products.name products_name,
   categories.name categories_name
from
   products
inner join
   products_categories
on
   products.id = products_categories.product_id
inner join
   categories
on
   products_categories.category_id = categories.id
where
   products.id = 3;
```

## テーブルの足し算

```
// 集合演算子 union
select column1, ... from table1 union select column2, ... from table2

// 注意点
- table1, table2 で column 数を合わせる必要がある(両方の table にも存在する column のみ出力できる)
- 同じ位置にある column のデータ型は一致している必要がある
```

Q. ユーザーとアドミンユーザーを足し合わせた一覧。[ email, 氏, 名, 性別 ]

```
# select
   email,
   last_name,
   first_name,
   gender
from
   users
union all
select
   email,
   last_name,
   first_name,
   gender
from
   admin_users;
```

Q. ユーザーの男性とアドミンユーザーの女性を足し合わせた一覧を性別順に並べる。[ email, 氏, 名, 性別 ]

```
# select
   email,
   last_name,
   first_name,
   gender
from
   users
where
   users.gender = 1
union all
select
   email,
   last_name,
   first_name,
   gender
from
   admin_users
where
   admin_users.gender = 2
order by
   gender;
```
