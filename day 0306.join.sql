-- CROSS JOIN : 조건 없이 조인(하면 안됨)

-- EQUI JOIN : 특정 컬럼이 같은 값을 가지고 있는 레코드끼리 조인(INNER JOIN) 
SELECT ENAME, DNAME, E.DEPTNO 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO 
AND ENAME = 'SCOTT'
ORDER BY E.ENAME; -- WHERE절 사용 안하고 그냥 JOIN하면 문제. 조건의 개수 : 테이블 개수 - 1

-- NOT EQUI JOIN : =를 제외한 다른 연산자를 사용하는 경우
SELECT EMPNO, SAL FROM EMP;
SELECT * FROM SALGRADE;

SELECT EMPNO, ENAME, SAL, GRADE, LOSAL, HISAL
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- SELF JOIN
SELECT * FROM EMP;

SELECT E.EMPNO, E.ENAME,E.MGR, M.EMPNO, M.ENAME
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO;

-- INNER JOIN (컬럼명이 같다면 USING으로 축약해서 쓸 수 있다.) ON : 조인 조건 직접 명시
SELECT EMPNO, ENAME, DNAME FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO 
WHERE ENAME = 'SCOTT';

-- JOIN ~ USING : 조인에 사용할 기준열 명시
SELECT EMPNO, ENAME, DNAME FROM EMP E INNER JOIN DEPT D
USING (DEPTNO)
WHERE ENAME = 'SCOTT';

-- NATURAL JOIN : 두 테이블의 같은 열 기준
SELECT EMPNO, ENAME, DNAME FROM EMP NATURAL JOIN DEPT WHERE ENAME = 'SCOTT';

-- OUTER JOIN : 조인이 되지 않는 레코드(+)도 출력
SELECT D.DEPTNO, E.DEPTNO, E.ENAME
FROM DEPT D, EMP E
WHERE D.DEPTNO = E.DEPTNO(+);

SELECT EMPNO, ENAME, DNAME FROM EMP FULL OUTER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

SELECT EMPNO, ENAME, DNAME FROM EMP LEFT OUTER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

SELECT EMPNO, ENAME, DNAME FROM EMP RIGHT OUTER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

select *
from dept d, emp e, salgrade s where d.deptno = e.deptno and e.sal between s.losal and s.hisal;

-- Q1.'ACCOUNTING'부서 소속 사원의 이름과 입사일을 출력
SELECT ENAME, HIREDATE, D.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND DNAME = 'ACCOUNTING';
-- Q2.커미션을 받는 사원의 이름과 그가 속한 부서명을 출력
SELECT ENAME, DNAME, COMM
FROM EMP E
INNER JOIN DEPT D USING(DEPTNO) 
WHERE COMM IS NOT NULL;
-- Q3.'NEW YORK'에서 근무하는 사원의 이름과 급여를 출력
SELECT ENAME, SAL
FROM EMP E NATURAL JOIN DEPT D
WHERE LOC = 'NEW YORK';
-- Q4.'SCOTT'과 동일한 부서에서 근무하는 사원의 이름을 출력
SELECT M.ENAME
FROM EMP E, EMP M
WHERE E.DEPTNO = M.DEPTNO 
AND E.ENAME = 'SCOTT' 
AND M.ENAME <> 'SCOTT';




