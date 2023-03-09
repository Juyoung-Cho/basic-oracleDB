-- DDL : 데이터 정의어
-- CREATE : 객체 생성
-- CREATE TABLE 테이블명 (
--    컬럼명 타입 제약조건 DEFAULT 기본값,
--    컬럼명 타입 제약조건 DEFAULT 기본값, ...
-- );
-- 테이블 : 문자로 시작, 같은 계정 안 테이블명 중복 불가.
CREATE TABLE EMP_DDL AS SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO = 10;

SELECT * FROM EMP_DDL;
DELETE FROM EMP_DDL;
COMMIT;
-- ALTER : 테이블 변경
-- 컬럼 추가(ALTER-ADD)
-- ALTER TABLE 테이블명 ADD(추가할 컬럼명과 타입);
-- 레코드가 하나라도 있으면 NOT NULL을 쓸 수 없다. 
ALTER TABLE EMP_DDL ADD (CREDATE DATE);
DESC EMP_DDL;

-- 컬럼데이터 타입 수정 (ALTER-MODIFY)
-- ALTER TABLE 테이블명 MODIFY (컬럼명 타입);
ALTER TABLE EMP_DDL MODIFY(EMPNO NUMBER(5)); -- 이미 데이터가 저장된 경우 : 타입 변경X, 크기를 줄일 수 없다.

-- 컬럼명 수정(ALTER-RENAME) 
-- ALTER TABLE 테이블명 RENAME COLUMN 컬럼명 TO 수정할 이름;
ALTER TABLE EMP_DDL RENAME COLUMN CREDATE TO HIREDATE;

-- 컬럼 삭제(ALTER-DROP)  
-- ALTER TABLE 테이블명 DROP COLUMN 컬럼명; 
ALTER TABLE EMP_DDL DROP COLUMN HIREDATE;

-- DROP : 객체 삭제
-- 테이블 삭제 시, 해당 테이블을 참조하고 있는 (자식)테이블이 있다면 삭제 불가.
-- RENAME : 테이블(객체) 이름을 변경
-- RENAME 원래 테이블명 TO 변경할 이름.
RENAME EMP_DDL TO EMP_RENAME;
SELECT * FROM TAB;
-- TRUNCATE : 테이블의 데이터를 삭제
-- TRUNCATE TABLE 테이블명; : ROLLBACK 불가
TRUNCATE TABLE EMP_RENAME;