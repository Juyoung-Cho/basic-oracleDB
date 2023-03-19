-- ���� ����
-- NOT NULL : NULL ��� X, NULL �� ������ �ߺ��� ���
-- UNIQUE : �ߺ��� X, NULL�� ����
-- PRIMARY KEY : �⺻��. ���ڵ� ���п�. NOT NULL + UNIQUE. �ڵ����� �ε��� ����
-- FOREIGN KEY : ������. �����ϰ� �ִ� �÷��� ����� �� �߿����� ������ �� ����.
-- >> ������ ���Ἲ ���� ����
-- CHECK : ������ ��/������ �߿����� ���� ����.
-- GENDER CHAR(1) CHECK (GENDER IN ('M','F'))

-- DEFAULT : �⺻��
-- ���̺� ������ �������� ���� 1) �÷� ����, 2) ���̺� ���� or ALTER ���� ���� �߰�

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME FROM USER_CONSTRAINTS;

CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20)NOT NULL,
    TEL VARCHAR2(20)
);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 
FROM USER_CONSTRAINTS WHERE TABLE_NAME='TABLE_NOTNULL';

INSERT INTO TABLE_NOTNULL VALUES('TEST01',NULL,'010-2222-2222');
INSERT INTO TABLE_NOTNULL VALUES('TEST01','1234',NULL);
SELECT * FROM TABLE_NOTNULL;

UPDATE TABLE_NOTNULL SET LOGIN_PWD = NULL WHERE LOGIN_ID = 'TEST01';

DROP TABLE TABLE_NOTNULL PURGE;

-- �������� �̸� �ɱ� CONSTRAINT ���̺���_�÷���_��������
CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN_ID_NN NOT NULL,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN_PWD_NN NOT NULL,
    TEL VARCHAR2(20)
);

ALTER TABLE TABLE_NOTNULL MODIFY (TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);
ALTER TABLE TABLE_NOTNULL DROP CONSTRAINT TBLNN_TEL_NN;

CREATE TABLE TABLE_UNIQUE (
    LOGIN_ID VARCHAR2(20)UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 
FROM USER_CONSTRAINTS WHERE TABLE_NAME='TABLE_UNIQUE';

INSERT INTO TABLE_UNIQUE VALUES('TEST01','TEST',NULL);
-- ALTER TABLE ���̺��� MODIFY(�÷��� �������Ǹ�);
-- ALTER TABLE ���̺��� ADD CONSTRAINT �������Ǹ� UNIQUE(�÷���);
ALTER TABLE TABLE_UNIQUE ADD CONSTRAINT U_TBLU_ID UNIQUE (TEL);

CREATE TABLE TABLE_PK(
    LOGIN_ID VARCHAR2(20),
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20),
    PRIMARY KEY(LOGIN_ID)
);

INSERT INTO EMP VALUES (9999,'TEST','TEST',7788,SYSDATE,1200,NULL,50); -- ����

-- FOREIGN KEY ���� �� ������ ����
-- ON DELETE CASCADE / ON DELETE SET NULL
CREATE TABLE DEPT_FK (
    DEPTNO NUMBER(2) CONSTRAINT DEPT_FK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMP_FK_EMPNO_PK PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) REFERENCES DEPT_FK(DEPTNO) -- �÷� ������ ����
    );
    
CREATE TABLE EMP_FK2(
    EMPNO NUMBER(4) CONSTRAINT EMP_FK2_EMPNO_PK PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2),
    FOREIGN KEY (DEPTNO) REFERENCES DEPT_FK(DEPTNO) -- ���̺� ������ ����
    );    

SELECT * FROM DEPT_FK;
SELECT * FROM EMP_FK;

INSERT INTO DEPT_FK SELECT * FROM DEPT;
INSERT INTO EMP_FK SELECT * FROM EMP;

INSERT INTO EMP_FK VALUES (9999,'TEST','TEST',7788,SYSDATE,1200,NULL,50);
DELETE FROM DEPT_FK WHERE DEPTNO = 10;

INSERT INTO EMP_FK VALUES (9999,'TEST','TEST',7788,SYSDATE,1200,NULL,10);
INSERT INTO EMP_FK VALUES (9999,'TEST','TEST',7788,SYSDATE,1200,NULL,20);

CREATE TABLE DEPT_CASCADE (
    DEPTNO NUMBER(2) CONSTRAINT DEPT_CASCADE_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

CREATE TABLE EMP_CASCADE(
    EMPNO NUMBER(4) CONSTRAINT EMP_CASCADE_EMPNO_PK PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) REFERENCES DEPT_CASCADE(DEPTNO) ON DELETE CASCADE -- UPDATE�� ����
    );
    
INSERT INTO DEPT_CASCADE SELECT * FROM DEPT;
INSERT INTO EMP_CASCADE SELECT * FROM EMP;   

DELETE FROM DEPT_CASCADE WHERE DEPTNO=30;
SELECT * FROM DEPT_CASCADE;
SELECT * FROM EMP_CASCADE;
DROP TABLE TABLE_CHECK PURGE;
CREATE TABLE TABLE_CHECK(
    LOGIN_ID VARCHAR2(20),
    LOGIN_PWD VARCHAR2(20) CHECK(LENGTH(LOGIN_PWD)>5),
    TEL VARCHAR2(20),
    GENDER CHAR(1) CHECK(GENDER IN('M','F')),
    PRIMARY KEY(LOGIN_ID)
);

INSERT INTO TABLE_CHECK VALUES ('TEST01','123456','010-2222-2222','M');
INSERT INTO TABLE_CHECK VALUES ('TEST01','123456','010-2222-2222','A');

CREATE TABLE TABLE_D(
    LOGIN_ID VARCHAR2(20),
    LOGIN_PWD VARCHAR2(20) CHECK(LENGTH(LOGIN_PWD)>5),
    TEL VARCHAR2(20),
    BIRTH DATE DEFAULT SYSDATE,
    PRIMARY KEY(LOGIN_ID)
);

INSERT INTO TABLE_D VALUES ('TEST01','123456','010-2222-2222',NULL);

SELECT * FROM TABLE_D;

INSERT INTO TABLE_D (LOGIN_ID, LOGIN_PWD,TEL) VALUES('TEST02','123456','010-2222-2222');

CREATE TABLE DEPT_CONST(
    DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
    LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL
);

CREATE TABLE EMP_CONST(
    EMPNO NUMBER(4) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
    JOB VARCHAR2(9),
    TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
    HIREDATE DATE,
    SAL NUMBER(7,2) CONSTRAINT EMPCONST_SAL_CHECK CHECK(SAL BETWEEN 1000 AND 9999),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST(DEPTNO) ON DELETE CASCADE
);

SELECT TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE 
FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DEPT_CONST' OR TABLE_NAME = 'EMP_CONST'
ORDER BY CONSTRAINT_NAME;
