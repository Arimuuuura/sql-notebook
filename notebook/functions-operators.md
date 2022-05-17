## 関数と演算子

### SQL で使える演算子

```
- + : 足し算
- - : 引き算
- * : 掛け算
- / : 割り算
- % : 余り
```

### null を含む演算

- null・・・データが存在しないことを表す値

* null を含んだ演算は null になるので注意

### 絶対値

- 絶対値・・・数値の符号を考えない、ゼロからの距離の大きさを表す数値。

```
select abs(10); // 10
select abs(-10); // 10
select abs(0); // 0
```

### 四捨五入

```
round(対象の数値, 小数点からのindex);

小数点からのindex
	- 小数第1位・・・0
	- 小数第2位・・・1
	- 小数第3位・・・2
```

- Q. 税込の商品一覧。小数第一位で四捨五入。

```
# select id, name, round(price * 1.08, 0) from products;
```

### 文字列演算

```
concat(a, b, c)・・・文字列 a, b, c を連結
```

- Q. ユーザー一覧を、[山田 太郎さん]のように、"苗字" + " " + "名前" + "さん"のフォーマットで出力。

```
# select concat(last_name, ' ', first_name, 'さん') from users;
```

- Q. メルマガ送信用の名前とメールアドレスのリストを作成。"苗字" + "さん"のフォーマット。ターゲットは女性のみ。

```
# select concat(last_name, 'さん'), email from users where gender = 2;
```

### 日付と時刻の演算

```
- 現在の日付 ・・・ select current_date();
- 現在の時刻 ・・・ select current_timestamp();
- n日後の日付 ・・・ select current_date() + interval n day;
- n日前の日付 ・・・ select current_date() - interval n day;
- x時間後の時刻 ・・・ select current_time() + interval x hour;
- x時間前の時刻 ・・・ select current_time() - interval x hour;
```

- extract ・・・ 日付や時刻の特定の部分(年や月)までを取り出す

- Q. orders テーブルから注文日時が 2017 年 01 月のレコードを取得

```
# select * from orders where extract(year_month from order_time) = '201701';
```

- Q. orders テーブルから注文日時が 2017 年のレコードを取得

```
# select * from orders where extract(year from order_time) = '2017';
```

- Q. orders テーブルから注文日時が 01 月のレコードを取得

```
# select * from orders where extract(month from order_time) = '01';
```
