-- SYNONYM : 객체 이름 대신 사용할 수 있는 다른 이름(테이블 이름을 감춰두는 용도)
-- CREATE [PUBLIC] SYNONYM 동의어 이름
-- FOR [사용자.][객체 이름]
CREATE SYNONYM E FOR EMP;
SELECT * FROM E;
-- SYNONYM 삭제 : DROP