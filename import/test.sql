USE `sql-notebook`;

DROP TABLE IF EXISTS test;

CREATE TABLE test
(
	id int
(11) NOT NULL
	AUTO_INCREMENT,
  name varchar
	(32) NOT NULL,
  gender varchar
	(32) NOT NULL,
  today date DEFAULT NULL,
  birthday datetime DEFAULT NULL,
  PRIMARY KEY
	(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES test WRITE;

	INSERT INTO test
		(
		id,
		name,
		gender,
		today,
		birthday
		)
	VALUES
		(1, '柴咲', '1', '2019/11/16', '20220224163127'),
		(2, '沢村', '2', '20121202', '20220224163127'),
		(3, '阿部', '2', '20121202', '20220224163127'),
		(4, '佐古', '1', '20121202', '20220224163127'),
		(5, '宮里', '1', '20121202', '20220224163127'),
		(6, '梅沢', '2', '20121202', '20220224163127'),
		(7, '松村', '2', '20121202', '20220224163127'),
		(8, '高岡', '1', '20121202', '20220224163127'),
		(9, '大下', '2', '20121202', '20220224163127'),
		(10, '西岡', '2', '20121202', '20220224163127');

	UNLOCK TABLES;