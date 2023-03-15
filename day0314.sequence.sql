-- SEQUENCE : ��Ģ�� ���� ������ ����(��ȣ ������) / �ߺ��� ���ϱ� ���� ���
-- CREATE SEQUENCE ������ �̸�
-- [INCREMENT BY n]
-- [START WITH n]
-- [MAXVALUE n | NOMAXVALUE]
-- [MINVALUE n | NOMINVALUE]
-- [CYCLE | NOCYCLE]
-- [CACHE n | NOCACHE]

-- DEPT���̺��� ��Ű���� ������ DEPT01 �ۼ�
CREATE TABLE DEPT01 AS SELECT * FROM DEPT WHERE 0=1;
DESC DEPT01;

CREATE SEQUENCE SEQ_DEPT
INCREMENT BY 10
START WITH 10
MAXVALUE 90
MINVALUE 0
NOCYCLE
CACHE 2;

-- ������ ��� : CURRVAL(������ ������ ���� ��ȣ), NEXTVAL(���� ��ȣ ����)
INSERT INTO DEPT01
VALUES(SEQ_DEPT.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT01;
SELECT SEQ_DEPT.CURRVAL FROM DUAL;

-- ������ ���� : ALTER
-- ������ ���� : DROP