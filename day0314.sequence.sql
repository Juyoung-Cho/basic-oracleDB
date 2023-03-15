-- SEQUENCE : 규칙에 따라 순번을 생성(번호 생성기) / 중복값 피하기 위해 사용
-- CREATE SEQUENCE 시퀀스 이름
-- [INCREMENT BY n]
-- [START WITH n]
-- [MAXVALUE n | NOMAXVALUE]
-- [MINVALUE n | NOMINVALUE]
-- [CYCLE | NOCYCLE]
-- [CACHE n | NOCACHE]

-- DEPT테이블의 스키마를 복사한 DEPT01 작성
CREATE TABLE DEPT01 AS SELECT * FROM DEPT WHERE 0=1;
DESC DEPT01;

CREATE SEQUENCE SEQ_DEPT
INCREMENT BY 10
START WITH 10
MAXVALUE 90
MINVALUE 0
NOCYCLE
CACHE 2;

-- 시퀀스 사용 : CURRVAL(시퀀스 마지막 생성 번호), NEXTVAL(다음 번호 생성)
INSERT INTO DEPT01
VALUES(SEQ_DEPT.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT01;
SELECT SEQ_DEPT.CURRVAL FROM DUAL;

-- 시퀀스 수정 : ALTER
-- 시퀀스 삭제 : DROP