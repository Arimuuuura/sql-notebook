# sql-notebook

```
// コンテナ立ち上げ
$ docker-compose up

// コンテナに入る
$ docker-compose exec db sh

// 管理者ユーザーでログイン ログアウト
# mysql -u root -p

// csv import する場合は下記コマンドでログイン
# mysql -u root -p --enable-local-infile
# exit

// コンテナ停止
$ docker-compose down
```

[SQL 基本構文](/notebook/basic.md)

[データの並び替え](/notebook/sorting-data.md)

[関数と演算子](/notebook/functions-operators.md)

[テーブルの結合](/notebook/joining-tables.md)

[ビュー](/notebook/view.md)

[サブクエリ](/notebook/sub-query.md)

[条件分岐](/notebook/case.md)

[データの更新](/notebook/crud.md)

[データベース構造の操作](/notebook/database-structures.md)

[応用問題](/question/question.md)

[csv ファイルの利用](/notebook/csv.md)

[外部ファイルの実行](/notebook/external-file.md)
