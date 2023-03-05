-- 문자 데이터를 가공하는 문자 함수
desc emp;
select ename, job from emp;
-- UPPER : 문자열 대문자로, LOWER : 문자열 소문자로, INICAP : 첫 글자만 대문자로
-- 원본은 바뀌지 않는다.
select ename, upper(ename), lower(ename), initcap(ename) from emp;
SELECT * FROM EMP WHERE ENAME = UPPER('SCOTT');
SELECT * FROM EMP WHERE LOWER(ENAME) = LOWER('SCOTT');
SELECT * FROM EMP WHERE UPPER(ENAME) LIKE UPPER('%SCOTT%');

-- LENGTH : 문자열의 길이 LENGTHB : Byte크기를 알려줌.
SELECT ENAME, LENGTH(ENAME) FROM EMP;
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

-- 직급 이름이 6글자 이상인 데이터 출력
SELECT * FROM EMP WHERE LENGTH(JOB) >=6;

-- SUBSTR : 문자열 일부분 추출 
-- 끝자리를 읽을 때, 시작점에 -1인덱스를 붙이면 -1,-2,-3과 같이 뒤부터 역순으로 읽어옴.
SELECT 'DATABASE', SUBSTR('DATABASE',1,4), SUBSTR('DATABASE',5), SUBSTR('DATABASE',-1) FROM DUAL;

-- 사원의 이름이 'S'로 시작하는 사원의 이름 출력(LIKE쓰지 말고)
SELECT ENAME FROM EMP WHERE SUBSTR(ENAME,1,1) = 'S';
-- 사원의 이름이 'S'로 끝나는 사원의 이름 출력(LIKE쓰지 말고)
SELECT ENAME FROM EMP WHERE SUBSTR(ENAME,-1,1) = 'S';

SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)), SUBSTR(JOB, -LENGTH(JOB),2), SUBSTR(JOB,-3) FROM EMP;

-- INSTR('문자데이터','찾을 문자',시작 위치,N번째) : 문자열 데이터 내 특정 문자 위치 찾기(인덱스) >> 해당 글자 포함여부(없으면 0) 확인용으로 사용가능
SELECT INSTR('hello','Z') FROM DUAL;
SELECT INSTR('HELLO,HELL',1,4) FROM DUAL;

-- Q. 이름에 'A'가 포함된 직원의 정보 출력
SELECT * FROM EMP WHERE INSTR(ENAME,'A') > 0;

-- REPLACE : 특정 문자를 다른 문자로 대체
SELECT REPLACE('010-1234-5678','-',' ') REPLACE1,REPLACE('010-1234-5678','-') REPLACE2 FROM DUAL;

-- LPAD / RPAD : 공백으로 채우기(뭘로 채울지 지정할 수 있음)
SELECT 'ORACLE', LPAD('ORACLE',10,'#') LPAD1 FROM DUAL;
SELECT 'ORACLE', LPAD('ORACLE',10) LPAD1, RPAD('ORACLE',10,'*') RPAD1 FROM DUAL;
SELECT RPAD('950504-2',14,'*') 주영 FROM DUAL;
SELECT RPAD(SUBSTR(ENAME,1,2),LENGTH(ENAME),'*') "ENAME**" FROM EMP;

-- CONCAT / || : 문자열 합치기
SELECT CONCAT('HELLO','ORACLE') "CONCAT" FROM DUAL;
SELECT 'HELLO' || 'ORACLE' "CONCAT2" FROM DUAL;
SELECT 'MY NAME IS ' ||ENAME FROM EMP;

-- TRIM / LTRIM / RTRIM : 특정 문자 지우기(안에 있는 공백은 지우지 않음)
-- TRIM(삭제옵션 삭제할 문자열 FROM '문자 데이터')
SELECT '   DATA BASE ORACLE    '
,TRIM('   DATA BASE ORACLE    ')
,TRIM(LEADING FROM'   DATA BASE ORACLE    ') 
,TRIM(TRAILING FROM'   DATA BASE ORACLE    ') 
,TRIM(BOTH FROM'   DATA BASE ORACLE    ') 
FROM DUAL;
SELECT '___DATA_BASE_ORACLE____'
,TRIM('___DATA_BASE_ORACLE____')
,TRIM(LEADING '_' FROM'___DATA_BASE_ORACLE____') 
,TRIM(TRAILING '_' FROM'___DATA_BASE_ORACLE____') 
,TRIM(BOTH '_' FROM'___DATA_BASE_ORACLE____') 
FROM DUAL;

-- Q. 'SCOTT ' 공백을 제거 후 검색해 사원의 정보를 출력
SELECT * FROM EMP WHERE UPPER(ENAME) = UPPER(TRIM('SCOTT '));

-- 숫자 데이터를 연산하고 수치 조정하는 숫자함수

-- ROUND : 반올림(소수점 첫 째자리 인덱스가 0)
SELECT 1234.5678, ROUND(1234.5678)
, ROUND(1234.5678, 0) 
, ROUND(1234.5678, 1) 
, ROUND(1234.5678, 2) 
, ROUND(1234.5678, -1) 
FROM DUAL;

-- TRUNC : 버림
SELECT 1234.5678, TRUNC(1234.5678)
, TRUNC(1234.5678, 0) 
, TRUNC(1234.5678, 1) 
, TRUNC(1234.5678, 2) 
, TRUNC(1234.5678, -1) 
FROM DUAL;

-- CEIL : 지정된 숫자와 가장 가까운 큰 정수 / FLOOR : 지정된 숫자와 가장 가까운 작은 정수
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14) FROM DUAL;

-- MOD : 숫자를 나눈 나머지
SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM DUAL;

-- 날짜 데이터를 다루는 날짜 함수
-- 날짜 데이터와 숫자간의 +, - 계산 되지만, 날짜 데이터 + 날짜 데이터는 불가능.
-- SYSDATE : 현재 시간 출력
SELECT SYSDATE-1 어제, SYSDATE 오늘, SYSDATE+1 내일 FROM DUAL;

-- ADD_MONTHS : 몇 개월 이후 날짜
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM DUAL;
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE,240) ANNIVERSARY FROM EMP; 
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE ADD_MONTHS(HIREDATE, 450) < SYSDATE;

-- MONTHS_BETWEEN : 두 날짜간의 개월수 차이
SELECT EMPNO, ENAME, HIREDATE, ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) 개월 FROM EMP;

-- NEXT_DAY(기준 날짜, 무슨 요일) : 돌아오는 무슨 요일 / LAST_DAY : 달의 마지막 날짜
SELECT SYSDATE, NEXT_DAY(SYSDATE, '수') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 4) FROM DUAL; -- 일요일의 인덱스는 1

SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

-- 반올림 / 버림
SELECT HIREDATE, ROUND(HIREDATE, 'MONTH') FROM EMP WHERE DEPTNO = 10;
SELECT HIREDATE, TRUNC(HIREDATE, 'MONTH') FROM EMP WHERE DEPTNO = 10;

-- 자료형을 반환하는 형 변환 함수
-- TO_NUMBER(문자, '포맷형식') : 문자 데이터를 숫자 데이터로
SELECT 10000+20000 FROM DUAL;
SELECT '10000'+'20000' FROM DUAL;
SELECT TO_NUMBER('10,000','999,999')+ TO_NUMBER('20,000','999,999') FROM DUAL;

-- TO_CHAR(날짜|숫자, '출력형식') : 숫자 또는 날짜 데이터를 문자 데이터로
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DY') FROM DUAL; -- 일
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL; -- 일요일
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DY HH24:MI:SS') FROM DUAL;
SELECT ENAME, SAL, TO_CHAR(SAL, 'L999,999') FROM EMP WHERE DEPTNO = 10;

-- TO_DATE(문자, '포맷형식') : 문자 데이터를 날짜 데이터로
SELECT TRUNC(SYSDATE - TO_DATE('2023/01/01','YYYY/MM/DD')) FROM DUAL;

-- Q. 81년 10월 15일 이후에 입사한 사원의 이름과 입사일 출력
select ename, hiredate from emp where hiredate > to_date('1981/10/15','YYYY/MM/DD');


-- NULL 처리 함수
-- NVL(데이터(컬럼), null인 경우 사용할 값) : NULL이 아니면 그대로, NULL이면 지정한 값
SELECT ENAME, SAL, COMM, NVL(COMM, 0) FROM EMP;
SELECT ENAME, SAL, SAL*12 + NVL(COMM, 0) ANNSAL FROM EMP;

-- NVL2(데이터(컬럼),null이 아닐 경우 사용할 수식|값, null인 경우 사용할 수식|값) : NULL이 아닐 때와 NULL일 때 각각 지정한 값
SELECT ENAME, SAL, NVL2(COMM, SAL*12+COMM, SAL*12) ANNSAL FROM EMP;
SELECT ENAME, SAL, NVL2(COMM, 'O', 'X') ANNSAL FROM EMP;
SELECT ENAME, SAL, NVL2(COMM, TO_CHAR(COMM), 'X') ANNSAL FROM EMP; -- 타입 일치 시켜야 함.

-- Q. 모든 사원은 상사가 있는데 유일하게 상사가 없는 레코드가 있다. 상사가 없는 사원만 출력하되 mgr컬럼 값 대신 ceo로 출력
SELECT EMPNO, ENAME, NVL('MGR', 'CEO') FROM EMP WHERE MGR IS NULL;

-- DECODE (컬럼, 조건1, 결과1, 조건2, 결과2, 기본값) : 기준 데이터를 지정, 그에 따라 반환할 데이터 지정
SELECT ENAME, DEPTNO, DECODE(DEPTNO, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 'OPERATIONS') DNAME
FROM EMP;

-- CASE WHEN 조건1 then 결과1        
--      WHEN 조건2 then 결과2
--      else 결과
--      end
SELECT ENAME, DEPTNO, CASE WHEN DEPTNO = 10 THEN 'ACCOUNTING'
                           WHEN DEPTNO = 20 THEN 'RESEARCH'
                           WHEN DEPTNO = 30 THEN 'SALES'
                           ELSE 'OPERATIONS' END DNAME
FROM EMP;

-- 직급에 따라 급여 인상 (사원번호, 사원명, 직급, 인상된 급여)
-- ANALYST >> 5%, SALESMAN >> 10%, MANAGER >> 15%, CLERK >> 20%
SELECT EMPNO, ENAME, JOB, SAL, CASE WHEN JOB = 'ANALYST' THEN SAL*1.05
                               WHEN JOB = 'SALESMAN' THEN SAL*1.1
                               WHEN JOB = 'MANAGER' THEN SAL*1.15
                               WHEN JOB = 'CLERK' THEN SAL*1.2 
                               ELSE SAL END SAL
FROM EMP;