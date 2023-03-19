-- CURSOR : SQL���� �������� �� �ش� SQL�� ó�� ������ ������ �޸� ����
-- SELECT INTO : ��ȸ�Ǵ� ���� �ϳ��� ��, Ŀ���� ��ȸ�Ǵ� ���� ���� ������� ���
-- ����� Ŀ�� : declaration -> open ->fetch(Ŀ������ �о�� ������ ���) ->close
-- DECLARE
--      CURSOR Ŀ�� �̸� IS SQL��;
-- BEGIN
--      OPEN Ŀ�� �̸�;
--      FETCH Ŀ���̸� INTO ����
--      CLOSE Ŀ���̸�;
-- END;

-- Ŀ���̸�%NOTFOUND, FOUND, ROWCOUNT, ISOPEN
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    CURSOR C1 IS SELECT DEPTNO, DNAME, LOC FROM DEPT;
BEGIN
    OPEN C1;
    LOOP
        FETCH C1 INTO V_DEPT_ROW;
        EXIT WHEN C1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '||V_DEPT_ROW.DEPTNO||', 
        DNAME : '||V_DEPT_ROW.DNAME||', LOC : '||V_DEPT_ROW.LOC);
    END LOOP;
    CLOSE C1;
END;
/

DECLARE
    CURSOR C1 IS SELECT * FROM DEPT;
BEGIN
    FOR C1_REC IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '||C1_REC.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : '||C1_REC.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : '||C1_REC.LOC);
    END LOOP;
END;
/

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS SELECT * FROM DEPT WHERE DEPTNO = P_DEPTNO;
BEGIN
    FOR C1_REC IN C1(10) LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '||C1_REC.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : '||C1_REC.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : '||C1_REC.LOC);
    END LOOP;
    FOR C1_REC IN C1(20) LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '||C1_REC.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : '||C1_REC.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : '||C1_REC.LOC);
    END LOOP;
END;
/










