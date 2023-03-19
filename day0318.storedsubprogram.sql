-- ���� �������α׷� : �̸��� �����Ͽ� �����صδ� PL/SQL ���α׷�
-- PROCEDURE / FUNCTION / PACKAGE / TRIGGER

-- �Ķ���� ������� ���� ���ν���
-- CREATE [OR REPLACE] PROCEDURE ���ν��� �̸�
-- IS | AS
--     �����
-- BEGIN
--     �����
-- EXCEPTION
--     ���� ó����
-- END [���ν��� �̸�];

CREATE OR REPLACE PROCEDURE PRO_EMP
IS
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : '||V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : '||V_ENAME);
END;
/

-- EXEC ���ν�����;
EXECUTE PRO_EMP;

SELECT * FROM USER_SOURCE WHERE NAME='PRO_EMP';
DROP PROCEDURE PRO_EMP;

-- �Ķ���� ����ϴ� ���ν���
-- CREATE [OR REPLACE] PROCEDURE ���ν��� �̸�
-- [(�Ķ���� �̸� 1[MODES] �ڷ��� [ := | DEFAULT �⺻��],
--  �Ķ���� �̸� 2[MODES] �ڷ��� [ := | DEFAULT �⺻��])]
-- IS | AS
--     �����
-- BEGIN
--     �����
-- EXCEPTION
--     ���� ó����
-- END [���ν��� �̸�];

-- MODES : IN / OUT / IN OUT

CREATE OR REPLACE PROCEDURE PRO_NUM_IN(
    P1 in NUMBER,
    P2 NUMBER,
    P3 NUMBER := 3,
    P4 NUMBER DEFAULT 4
)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('P1 : '||P1);
    DBMS_OUTPUT.PUT_LINE('P2 : '||P2);
    DBMS_OUTPUT.PUT_LINE('P3 : '||P3);
    DBMS_OUTPUT.PUT_LINE('P4 : '||P4);
END;
/

EXEC PRO_NUM_IN(10,20,30,40);
EXEC PRO_NUM_IN(10,20);

-- �����ȣ�� �Է¹޾�(IN) ����̸�, �޿� ���
CREATE OR REPLACE PROCEDURE PRO_EMP_OUT(
    IN_EMPNO IN EMP.EMPNO%TYPE,
    OUT_ENAME OUT EMP.ENAME%TYPE,
    OUT_SAL OUT EMP.SAL%TYPE
)
IS
BEGIN
    SELECT ENAME, SAL INTO OUT_ENAME, OUT_SAL FROM EMP WHERE EMPNO = IN_EMPNO;
END;
/

DECLARE
    ENAME EMP.ENAME%TYPE;
    SAL EMP.SAL%TYPE;
BEGIN
    PRO_EMP_OUT(7788,ENAME,SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME : '||ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : '||SAL);
END;
/

CREATE OR REPLACE PROCEDURE PRO_NUM_INOUT(
    INOUT_NUM IN OUT NUMBER
)
IS 
BEGIN
    INOUT_NUM := INOUT_NUM*2;
END;
/

DECLARE
    NO NUMBER;
BEGIN
    NO := 5;
    PRO_NUM_INOUT(NO);
    DBMS_OUTPUT.PUT_LINE('NO : '||NO);
END;
/

-- CREATE [OR REPLACE] FUNCTION �Լ� �̸�
-- [(�Ķ���� �̸� 1[IN] �ڷ���,
--  �Ķ���� �̸� 2[IN] �ڷ���)]
-- RETURN �ڷ���
-- IS | AS
--     �����
-- BEGIN
--     �����
--     RETURN (��ȯ��);
-- EXCEPTION
--     ���� ó����
-- END [�Լ� �̸�];

CREATE OR REPLACE FUNCTION FUNC_AFTERTAX(
    SAL NUMBER
) RETURN NUMBER
IS
    TAX NUMBER := 0.05;
BEGIN 
   RETURN ROUND( SAL - (SAL*0.05));
END;
/

SELECT FUNC_AFTERTAX(3000) FROM DUAL;
SELECT EMPNO, ENAME, SAL, FUNC_AFTERTAX(SAL) AFTERTAX FROM EMP;

-- ��Ű�� : ���� �������α׷��� ����,����
-- ��Ű�� ��
-- CREATE [OR REPLACE] PACKAGE ��Ű�� �̸�
-- IS | AS
--    �������α׷��� ������ �پ��� ��ü ����
-- END [��ĳ�� �̸�]';

-- ��Ű�� �ٵ�
-- CREATE [OR REPLACE] PACKAGE BODY ��Ű�� �̸�
-- IS | AS
--    ��Ű�� ������ ������ �������α׷��� ������ ���� ��ü�� ����
--    ��쿡 ���� ��Ű�� ���� �������� �ʴ� ��ü �� �������α׷��� ���� ����
-- END [��Ű�� �̸�];

-- Ʈ���� : �����ͺ��̽� �� �̺�Ʈ �߻��� �ڵ� ����� ����� ����
-- DML TRIGGER
-- CREATE [OR REPLACE] TRIGGER Ʈ���� �̸�
-- BEFORE | AFTER
-- INSERT | UPDATE | DELETE ON ���̺� �̸�
-- REFERENCING OLD AS OLD | NEW AS NEW
-- FOR EACH ROW WHEN ���ǽ�
-- FOLLOWS Ʈ���� �̸�2, Ʈ���� �̸�3 ...
-- ENABLE | DISABLE
--
-- DECLARE �����
-- BEGIN �����
-- EXCEPTION ���ܺ�
-- END;

SELECT * FROM EMP01;
DROP TABLE EMP01 PURGE;
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(20),
    JOB VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER TRI_01
AFTER INSERT
ON EMP01
BEGIN
    DBMS_OUTPUT.PUT_LINE('���Ի���� �Ի���');
END;
/

INSERT INTO EMP01 VALUES(1,'JAVA','PROGRAMMER');

-- ���Ի���� �Ի��ϸ� �޿����̺� ���ο� �����͸� �ڵ����� �߰�
CREATE TABLE SAL01(
    SALNO NUMBER(4) PRIMARY KEY,
    SAL NUMBER(7,2),
    EMPNO NUMBER(4) REFERENCES EMP01(EMPNO)
);

CREATE SEQUENCE SAL01_SEQ;
CREATE OR REPLACE TRIGGER TRI02
AFTER INSERT
ON EMP01
FOR EACH ROW
BEGIN 
    INSERT INTO SAL01 VALUES(SAL01_SEQ.NEXTVAL, 100,:NEW.EMPNO);
END;
/

INSERT INTO EMP01 VALUES(2,'DD','DESIGNER');
SELECT * FROM EMP01;
SELECT * FROM SAL01;
INSERT INTO EMP01 VALUES(3,'GG','PRESIDENT');

-- ��� ���� ���� �� �޿� ������ ���� ����
CREATE OR REPLACE TRIGGER TRI03
AFTER DELETE
ON EMP01
FOR EACH ROW
BEGIN
    DELETE FROM SAL01 WHERE EMPNO= :OLD.EMPNO;
END;
/

DELETE FROM EMP01 WHERE EMPNO = 2;
SELECT * FROM EMP01;
SELECT * FROM SAL01;





