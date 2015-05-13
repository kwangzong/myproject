
/* �����߰� */
CREATE TABLE add_payment (
	pay_no INTEGER NOT NULL, /* �����Ϸù�ȣ */
	group_no INTEGER, /* �׷��Ϸù�ȣ */
	method CHAR(1) NOT NULL, /* �������� */
	receit VARCHAR2(255), /* ������ */
	pay_date DATE NOT NULL, /* ���⳯¥ */
	pay_name VARCHAR2(50) NOT NULL, /* �����ȣ�� */
	amount INTEGER NOT NULL /* ����ݾ� */
);

COMMENT ON TABLE add_payment IS '�����߰�';

COMMENT ON COLUMN add_payment.pay_no IS '�����Ϸù�ȣ';

COMMENT ON COLUMN add_payment.group_no IS '�׷��Ϸù�ȣ';

COMMENT ON COLUMN add_payment.method IS '��������';

COMMENT ON COLUMN add_payment.receit IS '������';

COMMENT ON COLUMN add_payment.pay_date IS '���⳯¥';

COMMENT ON COLUMN add_payment.pay_name IS '�����ȣ��';

COMMENT ON COLUMN add_payment.amount IS '����ݾ�';

CREATE UNIQUE INDEX PK_add_payment
	ON add_payment (
		pay_no ASC
	);

CREATE INDEX IX_add_payment
	ON add_payment (
	);

ALTER TABLE add_payment
	ADD
		CONSTRAINT PK_add_payment
		PRIMARY KEY (
			pay_no
		);

/* ȸ�� */
		
CREATE SEQUENCE seq_tb_user_user_no	 	INCREMENT BY 1 START WITH 10000;
		
		
CREATE TABLE tb_user (
	user_no INTEGER NOT NULL, 
	id VARCHAR2(50) NOT NULL, 
	pw VARCHAR2(50) NOT NULL, 
	email VARCHAR2(40) NOT NULL, 
	user_name VARCHAR2(50) NOT NULL, 
	tel VARCHAR2(30) NOT NULL 
);

COMMENT ON TABLE tb_user IS 'ȸ��';

COMMENT ON COLUMN tb_user.user_no IS 'ȸ���Ϸù�ȣ';

COMMENT ON COLUMN tb_user.id IS '���̵�';

COMMENT ON COLUMN tb_user.pw IS '��й�ȣ';

COMMENT ON COLUMN tb_user.email IS '�̸���';

COMMENT ON COLUMN tb_user.user_name IS '�̸�';

COMMENT ON COLUMN tb_user.tel IS '��ȭ��ȣ';

CREATE UNIQUE INDEX PK_tb_user
	ON tb_user (
		user_no ASC
	);

CREATE UNIQUE INDEX UIX_tb_user
	ON tb_user (
		id ASC
	);

CREATE INDEX IX_tb_user
	ON tb_user (
		user_name ASC
	);

ALTER TABLE tb_user
	ADD
		CONSTRAINT PK_tb_user
		PRIMARY KEY (
			user_no
		);

ALTER TABLE tb_user
	ADD
		CONSTRAINT UK_tb_user
		UNIQUE (
			id
		);

/* �׷� */
CREATE TABLE tb_group (
	group_no INTEGER NOT NULL, /* �׷��Ϸù�ȣ */
	user_no INTEGER NOT NULL, /* �׷�����Ϸù�ȣ */
	group_name VARCHAR2(50) NOT NULL, /* �׷�� */
	group_date DATE NOT NULL /* �׷��¥ */
);

COMMENT ON TABLE tb_group IS '�׷�';

COMMENT ON COLUMN tb_group.group_no IS '�׷��Ϸù�ȣ';

COMMENT ON COLUMN tb_group.user_no IS '�׷�����Ϸù�ȣ';

COMMENT ON COLUMN tb_group.group_name IS '�׷��';

COMMENT ON COLUMN tb_group.group_date IS '�׷��¥';

CREATE UNIQUE INDEX PK_tb_group
	ON tb_group (
		group_no ASC
	);

CREATE UNIQUE INDEX UIX_tb_group
	ON tb_group (
		group_name ASC,
		user_no ASC
	);

ALTER TABLE tb_group
	ADD
		CONSTRAINT PK_tb_group
		PRIMARY KEY (
			group_no
		);

ALTER TABLE tb_group
	ADD
		CONSTRAINT UK_tb_group
		UNIQUE (
			group_name,
			user_no
		);

/* �׷�ȸ�� */
CREATE TABLE group_arr (
	user_no INTEGER NOT NULL, /* ȸ���Ϸù�ȣ */
	group_no INTEGER NOT NULL, /* �׷��Ϸù�ȣ */
	role CHAR(1) DEFAULT 1 NOT NULL /* ���� */
);

COMMENT ON TABLE group_arr IS '�׷�ȸ��';

COMMENT ON COLUMN group_arr.user_no IS 'ȸ���Ϸù�ȣ';

COMMENT ON COLUMN group_arr.group_no IS '�׷��Ϸù�ȣ';

COMMENT ON COLUMN group_arr.role IS '����';

CREATE UNIQUE INDEX PK_group_arr
	ON group_arr (
		user_no ASC,
		group_no ASC
	);

ALTER TABLE group_arr
	ADD
		CONSTRAINT PK_group_arr
		PRIMARY KEY (
			user_no,
			group_no
		);

/* ȸ�� */
CREATE TABLE group_money (
	gm_no INTEGER NOT NULL, /* ȸ���Ϸù�ȣ */
	group_no INTEGER NOT NULL, /* �׷��Ϸù�ȣ */
	gm_name VARCHAR2(50) NOT NULL, /* ȸ��� */
	gm_date DATE NOT NULL /* ȸ��¥ */
);

COMMENT ON TABLE group_money IS 'ȸ��';

COMMENT ON COLUMN group_money.gm_no IS 'ȸ���Ϸù�ȣ';

COMMENT ON COLUMN group_money.group_no IS '�׷��Ϸù�ȣ';

COMMENT ON COLUMN group_money.gm_name IS 'ȸ���';

COMMENT ON COLUMN group_money.gm_date IS 'ȸ��¥';

CREATE UNIQUE INDEX PK_group_money
	ON group_money (
		gm_no ASC
	);

CREATE INDEX IX_group_money
	ON group_money (
		gm_name ASC
	);

ALTER TABLE group_money
	ADD
		CONSTRAINT PK_group_money
		PRIMARY KEY (
			gm_no
		);

/* ȸ�񳳺γ��� */
CREATE TABLE gm_paid (
	group_no INTEGER NOT NULL, /* �׷��Ϸù�ȣ */
	user_no INTEGER NOT NULL, /* ȸ���Ϸù�ȣ */
	gm_no INTEGER NOT NULL, /* ȸ���Ϸù�ȣ */
	paid CHAR(1) NOT NULL, /* �������� */
	rec_date DATE NOT NULL /* ������ */
);

COMMENT ON TABLE gm_paid IS 'ȸ�񳳺γ���';

COMMENT ON COLUMN gm_paid.group_no IS '�׷��Ϸù�ȣ';

COMMENT ON COLUMN gm_paid.user_no IS 'ȸ���Ϸù�ȣ';

COMMENT ON COLUMN gm_paid.gm_no IS 'ȸ���Ϸù�ȣ';

COMMENT ON COLUMN gm_paid.paid IS '��������';

COMMENT ON COLUMN gm_paid.rec_date IS '������';

CREATE UNIQUE INDEX PK_gm_paid
	ON gm_paid (
		group_no ASC,
		user_no ASC,
		gm_no ASC
	);

ALTER TABLE gm_paid
	ADD
		CONSTRAINT PK_gm_paid
		PRIMARY KEY (
			group_no,
			user_no,
			gm_no
		);

ALTER TABLE add_payment
	ADD
		CONSTRAINT FK_tb_group_TO_add_payment
		FOREIGN KEY (
			group_no
		)
		REFERENCES tb_group (
			group_no
		);

ALTER TABLE tb_group
	ADD
		CONSTRAINT FK_tb_user_TO_tb_group
		FOREIGN KEY (
			user_no
		)
		REFERENCES tb_user (
			user_no
		);

ALTER TABLE group_arr
	ADD
		CONSTRAINT FK_tb_group_TO_group_arr
		FOREIGN KEY (
			group_no
		)
		REFERENCES tb_group (
			group_no
		);

ALTER TABLE group_arr
	ADD
		CONSTRAINT FK_tb_user_TO_group_arr
		FOREIGN KEY (
			user_no
		)
		REFERENCES tb_user (
			user_no
		);

ALTER TABLE group_money
	ADD
		CONSTRAINT FK_tb_group_TO_group_money
		FOREIGN KEY (
			group_no
		)
		REFERENCES tb_group (
			group_no
		);

ALTER TABLE gm_paid
	ADD
		CONSTRAINT FK_group_arr_TO_gm_paid
		FOREIGN KEY (
			user_no,
			group_no
		)
		REFERENCES group_arr (
			user_no,
			group_no
		);

ALTER TABLE gm_paid
	ADD
		CONSTRAINT FK_group_money_TO_gm_paid
		FOREIGN KEY (
			gm_no
		)
		REFERENCES group_money (
			gm_no
		);