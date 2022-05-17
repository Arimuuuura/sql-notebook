## データの並び替え

- `order by` 列名や式 並び順 ...
- カンマ区切りで複数の並び替え条件を指定できる
- 並び順の指定

  1.  asc: 昇順(ascending)。＊デフォルト。省略できる。
  2.  desc: 降順(descending)。

### 日本語の並び替え

- 商品名で並び替える場合、アルファベットであれば、アルファベット順に並び変わる。
- 日本語(全角文字)の場合、文字コード順になる。
  ※ 代替案としてヨミガナの列を新規に作成し使用する。

- Q. 商品一覧を価格が高い順に並べる

```
# select * from products order by price desc;
```

- Q. 商品一覧を価格が低い順に並べる

```
# select * from products order by price asc;
```

- Q. 商品一覧を価格が高い順に並べ、価格が同じ場合は登録順で並び替える

```
# select * from products order by price desc, id asc;
```

- Q. ユーザー一覧を出力。生年月日が古い順に並べる。生年月日が一緒の場合は都道府県 ID(昇順)に並べる

```
# select * from users order by birthday, prefecture_id;
```
