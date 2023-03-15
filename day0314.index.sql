SELECT * FROM DICT;

SELECT * FROM USER_TABLES;
SELECT TABLE_NAME FROM USER_TABLES;
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

-- INDEX
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;

SELECT * FROM EMP WHERE EMPNO=7788;
SELECT * FROM EMP WHERE ENAME = 'SCOTT';

-- INDEX 생성
-- CREATE INDEX 인덱스 이름
--      ON 테이블 이름(열 이름1 ASC OR DESC, 열 이름2 ASC OR DESC ...);
-- INDEX 삭제 : DROP
CREATE INDEX IDX_EMP_SAL
ON EMP(SAL);

SELECT * FROM EMP WHERE SAL=5000;

DROP INDEX IDX_EMP_SAL;




