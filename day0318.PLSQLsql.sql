-- PL/SQL
-- DECLARE [���࿡ �ʿ��� ���� ��� ����]����;
-- BEGIN [�۾��� ���� ���� �����ϴ� ��ɾ�]�ʼ�;
-- EXCEPTION [PL/SQL ���� ���� �߻��ϴ� ���� ó��]����;
-- END;

SET SERVEROUTPUT ON; -- CTRL + SHIFT + O
BEGIN 
    DBMS_OUTPUT.PUT_LINE('HELLO, PL/SQL');
END;
/

-- ���� : �����͸� �Ͻ������� ����, ����Ǵ� �� ���� ����. 
-- ���� �̸� �ڷ��� := �� �Ǵ� ���� ����Ǵ� ���� ǥ����;
DECLARE
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- ��� : �� �� ������ ���� ���α׷� ����ñ��� ����
-- ���� �̸� CONSTANT �ڷ��� := �� �Ǵ� ���� �����ϴ� ���� ǥ����;

DECLARE
    V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/

-- ������ �⺻�� ����
-- ���� �̸� �ڷ��� DEFAULT �� �Ǵ� �� ����Ǵ� ���� ǥ����;

-- ������ NULL�� ���� ����
-- ���� �̸� �ڷ��� NOT NULL := DEFAULT �� �Ǵ� ���� ����Ǵ� ���� ǥ����;

DECLARE
    V_DEPTNO NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
    V_DEPTNO := 20;
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- ������ �ڷ���
-- 1) ��Į���� : ���� ���� ��Ұ� ���� ���� ��(NUMBER ��� �����ϳ�, BOOLEAN�� PL/SQL������ ����-T/F/NULL)
-- 2) ������ : Ư�� ���̺��� ��, �� ������ ����(%TYPE-������, %ROWTYPE-������)
-- ���� �̸� ���̺� �̸�.���̸�%TYPE; / ���� �̸� ���̺� �̸�%ROWTYPE;
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/


DECLARE
    V_DEPT_40 DEPT%ROWTYPE;
BEGIN
    SELECT * INTO V_DEPT_40 FROM DEPT WHERE DEPTNO=40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_40.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_40.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_40.LOC);
END;
/
-- 3) ������ : �÷���(TABLE), ���ڵ�(RECORD)
-- 4) LOB�� : LARGE OBJECT

-- IF-THEN-ELSE OR ELSIF ���� �� END IF;
DECLARE
    V_NUMBER NUMBER := 10;
BEGIN
    IF mod(V_NUMBER, 2) = 1 
    THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER' || '�� Ȧ���Դϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('V_NUMBER' || '�� ¦���Դϴ�.');
    END IF;
END;
/

DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    IF V_SCORE >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A����');
    ELSIF V_SCORE >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B����');
    ELSE DBMS_OUTPUT.PUT_LINE('C����');
    END IF;
END;
/
-- CASE ���ǹ�(������)
-- �ݺ��� : �⺻LOOP, WHILE LOOP, FOR LOOP, Cursor FOR LOOP
-- �ݺ� ���� ���� : EXIT, EXIT-WHEN, CONTINUE, CONTINUE-WHEN
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(V_NUM);
        V_NUM := V_NUM +1;
        EXIT WHEN V_NUM > 4;
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 5 LOOP
        DBMS_OUTPUT.PUT_LINE(V_NUM);
        V_NUM := V_NUM+1;
    END LOOP;
END;
/

DECLARE
    V_STAR VARCHAR2(10) := '*';
    V_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 5 LOOP
        DBMS_OUTPUT.PUT_LINE(V_STAR);
        V_STAR := V_STAR||'*';
        V_NUM := V_NUM+1;
    END LOOP;
END;
/

BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

BEGIN
    FOR i IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

BEGIN
    FOR i IN REVERSE 0..4 LOOP
        CONTINUE WHEN MOD(i,2) = 1;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- ���ڵ� : �ڷ����� �ٸ� �����͵��� �ϳ��� ������ ����
-- TYPE ���ڵ� �̸� IS RECORD(���� �̸� �ڷ��� NOT NULL := (�Ǵ� DEFAULT)�� �Ǵ� ���� ����Ǵ� ���� ǥ����)

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 10,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE   
    );
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 99;
    DEPT_REC.DNAME := 'DATABASE';
    DEPT_REC.LOC := 'SEOUL';
    DBMS_OUTPUT.PUT_LINE(DEPT_REC.DEPTNO);
    DBMS_OUTPUT.PUT_LINE(DEPT_REC.DNAME);
    DBMS_OUTPUT.PUT_LINE(DEPT_REC.LOC);
END;
/

CREATE TABLE DEPT_RECORD AS SELECT * FROM DEPT;
SELECT * FROM DEPT_RECORD;

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 10,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE   
    );
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 99;
    DEPT_REC.DNAME := 'DATABASE';
    DEPT_REC.LOC := 'SEOUL';
    INSERT INTO DEPT_RECORD VALUES DEPT_REC;
END;
/

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 10,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE   
    );
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 55;
    DEPT_REC.DNAME := 'DB';
    DEPT_REC.LOC := 'SEOUL';
    UPDATE DEPT_RECORD SET ROW = DEPT_REC WHERE DEPTNO=99;
END;
/

DECLARE
    TYPE REC_DEPT IS RECORD (
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    TYPE REC_EMP IS RECORD(
        EMPNO EMP.EMPNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        DINFO REC_DEPT
    );
    EMP_REC REC_EMP;
BEGIN
    SELECT EMPNO, ENAME, D.DEPTNO, DNAME, LOC
    INTO EMP_REC.EMPNO, EMP_REC.ENAME, 
    EMP_REC.DINFO.DEPTNO, EMP_REC.DINFO.DNAME, EMP_REC.DINFO.LOC
    FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND EMPNO = 7788;
    
    DBMS_OUTPUT.PUT_LINE(EMP_REC.EMPNO);
    DBMS_OUTPUT.PUT_LINE(EMP_REC.ENAME);
    DBMS_OUTPUT.PUT_LINE(EMP_REC.DINFO.DEPTNO);
    DBMS_OUTPUT.PUT_LINE(EMP_REC.DINFO.DNAME);
    DBMS_OUTPUT.PUT_LINE(EMP_REC.DINFO.LOC);
END;
/

-- COLLECTION : Ư�� �ڷ����� �����͸� ���� �� �����ϴ� ���� �ڷ���
-- �����迭(ASSOCIATTIVE ARRAY (OR INDEX BY TABLE))
-- TYPE ���� �迭 �̸� IS TABLE OF �ڷ���[NOT NULL] INDEX BY �ε�����;
DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
    INDEX BY PLS_INTEGER;
    
    TEXT_ARR ITAB_EX;
BEGIN
    TEXT_ARR(1) := '1ST DATA';
    TEXT_ARR(2) := '2ND DATA';
    TEXT_ARR(3) := '3RD DATA';
    TEXT_ARR(4) := '4TH DATA';
    FOR i IN 1..4 LOOP
        DBMS_OUTPUT.PUT_LINE(TEXT_ARR(i));
    END LOOP;
END;
/

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE
    );
    TYPE ITAB_DEPT IS TABLE OF REC_DEPT
    INDEX BY PLS_INTEGER;
    
    DEPT_ARR ITAB_DEPT;
    IDX PLS_INTEGER :=0;
BEGIN
    FOR i IN (SELECT DEPTNO, DNAME FROM DEPT) LOOP
        IDX := IDX +1;
        DEPT_ARR(IDX).DEPTNO := i.DEPTNO;
        DEPT_ARR(IDX).DNAME := i.DNAME;
    END LOOP;
    
    FOR r IN 1..IDX LOOP
        DBMS_OUTPUT.PUT_LINE(DEPT_ARR(r).DEPTNO||' : '|| DEPT_ARR(r).DNAME);
    END LOOP;
END;
/

-- �÷��� �޼��� : EXISTS(n), COUNT, LIMIT, FIRST, LAST, PRIOR(n), NEXT(n), DELETE, EXTEND, TRIM
-- ��ø ���̺� (NESTED TABLE)
-- VARRAY(VARIABLE-SIZE ARRAY)
