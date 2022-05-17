# ビュー

## ビューとは

- データそのものを保存するのではなく、データを取り出す SELECT 文だけを保存する
- データベースユーザーの利便性を高める道具
- SQL の観点から見ると、テーブルと同じもの
- ビューを使うと必要なデータが複数のテーブルにまたがる場合などの複雑な集約を行いやすくなる
- よく使う select 文は、ビューにして使い回すことができる

## テーブルとビューの違い

### テーブル

- 実際のデータを保存

### ビュー

- ビューの中には select 文が保存されている
- ビュー自体はデータを持たない

## ビューの制限

- order by 句が使えない
- ビューに対する更新は不可能ではないが制限がある
- 幾つかの条件を満たす場合のみビューに対する更新が可能
  1.  select 句に distinct が含まれていない
  2.  from 句に含まれるテーブルがひとつだけ
  3.  group by 句を使用していない
  4.  having 句を使用していない

* ビューとテーブルの更新は連動して行われる。集約されたビューは更新不可。

## ビューのメリット

- データを保存しないので、記憶装置の容量を節約できる
- よく使う select 文をビューにしておくことで、使い回しができる

## ビューのデメリット

- パフォーマンス低下を招く場合がある

## ビューの作成

```
// 構文
create view [view name] ([column1], [column2], ...) as select文 ...;
```

Q. 都道府県別のユーザー数を表示

// 通常の select 文

```
# select
  prefectures.name,
  count(*)
from
  users
inner join
  prefectures
on
  users.prefecture_id = prefectures.id
group by
  prefectures.name;
```

// create view

```
# create view
  prefecture_user_counts (name, count) as select prefectures.name,
  count(*)
from
  users
inner join
  prefectures
on
  users.prefecture_id = prefectures.id
group by
  prefectures.name;
```

// use view

```
# select name, count from prefecture_user_counts;
```

## ビューの削除

```
// 構文
drop view [view name];
```
