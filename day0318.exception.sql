-- EXCEPTION
--    WHEN ���� �̸�1 [OR ���� �̸�2 -] THEN ���� ó���� ����� ��ɾ�;
--    WHEN ���� �̸�3 [OR ���� �̸�4 -] THEN ���� ó���� ����� ��ɾ�;
--    WHEN OTHERS THEN ���� ó���� ����� ��ɾ�;

DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG FROM DEPT WHERE DEPTNO = 10;
EXCEPTION
    WHEN VALUE_ERROR THEN  -- WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('����ó�� : ���ڰ� �ƴ�');
END;
/