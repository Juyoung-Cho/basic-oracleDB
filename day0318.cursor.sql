-- CURSOR : SQL문을 실행했을 때 해당 SQL문 처리 정보를 저장한 메모리 공간
-- SELECT INTO : 조회되는 행이 하나일 때, 커서는 조회되는 행의 수와 상관없이 사용
-- 명시적 커서 : declaration -> open ->fetch(커서에서 읽어온 데이터 사용) ->close
-- DECLARE
--      CURSOR 커서 이름 IS SQL문;
-- BEGIN
--      OPEN 커서 이름;
--      FETCH 커서이름 INTO 변수
--      CLOSE 커서이름;
-- END;

-- 커서이름%NOTFOUND, FOUND, ROWCOUNT, ISOPEN
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










