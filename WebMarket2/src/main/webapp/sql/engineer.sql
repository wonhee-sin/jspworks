-- engineer 테이블 생성

CREATE TABLE engineer(
	eid INT PRIMARY KEY AUTO_INCREMENT,
	passwd VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL
);

INSERT INTO engineer VALUES (1, 'm1234', 'Bill');
INSERT INTO engineer VALUES (2, 'm2345', '이강');

select * from engineer;
