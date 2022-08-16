-- product 테이블 생성

CREATE TABLE product(
	p_id VARCHAR(10) PRIMARY KEY,
	p_name VARCHAR(20),
	p_unitPrice INTEGER,
	p_description TEXT,
	p_category VARCHAR(20),
	p_manufacturer VARCHAR(20),
	p_unitsInStock LONG,
	p_condition VARCHAR(20),
	p_fimename VARCHAR(20)
);

INSERT INTO product VALUES ('P1234', 'iPhone 6s', 800000, '4.7-inch 1334X750 Renia
	HD display 8-magapixel iSight Camera', 'Smart Phone', 'APPLE', 1000, 'New', 'P1234.png');

select * from product;