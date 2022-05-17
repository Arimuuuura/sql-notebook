# csv ファイルの利用

## csv 出力

```
// output できるパス確認
# show variables like "secure_file_priv";

// パスを指定して csv export (,区切り)
# select * from [table] limit 10 into outfile '/var/lib/mysql-files/export/export_test.csv' fields terminated by ',';

# select * from [table] limit 10 into outfile '/var/lib/mysql-files/export/export_test.csv' fields terminated by ',' OPTIONALLY ENCLOSED BY '"';

// パスを指定して csv export (タブ区切り)
# select * from [table] limit 10 into outfile '/var/lib/mysql-files/export/export_test.csv' fields terminated by '\t';

// データ型変換後 csv export (タブ区切り)
# select CAST(birthday as DATE) from [table] into outfile '/var/lib/mysql-files/export/export_test.csv' fields terminated by ',';
```

## csv import

```
// import 権限の確認
# select @@local_infile;

// 権限を有効にする
# SET GLOBAL local_infile=on;

// import 実行
# LOAD DATA LOCAL INFILE "/var/lib/mysql-files/import/import_test.csv" INTO TABLE [table] FIELDS TERMINATED BY ",";
```
