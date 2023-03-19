-- EXCEPTION
--    WHEN 예외 이름1 [OR 예외 이름2 -] THEN 예외 처리에 사용할 명령어;
--    WHEN 예외 이름3 [OR 예외 이름4 -] THEN 예외 처리에 사용할 명령어;
--    WHEN OTHERS THEN 예외 처리에 사용할 명령어;

DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG FROM DEPT WHERE DEPTNO = 10;
EXCEPTION
    WHEN VALUE_ERROR THEN  -- WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 : 숫자가 아님');
END;
/