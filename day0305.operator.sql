-- 연산자
-- emp에서 사원 번호가 7788인 사원의 모든 정보를 조회
select * from emp where empno = 7788;

-- emp에서 30번 부서의 'salesman'인 사원의 이름과 부서번호, 직급 조회
select ename, deptno, job from emp where deptno = 30 and job = 'SALESMAN';

-- emp에서 10번 부서 사원이거나 직급이 'CLERK'인 사원의 이름, 직급, 부서번호 출력
select ename, job, deptno from emp where deptno = 10 or job = 'CLERK';

-- emp에서 사원번호가 7844나 7876이거나 7900인 사원의 사원번호와 이름 출력
select deptno, ename from emp where empno = 7844 or empno = 7876 or empno = 7900;
select deptno, ename from emp where empno in(7844, 7876, 7900);

-- emp에서 1981년도에 입사한 사원의 이름과 입사일을 조회
select  ename, hiredate from emp where hiredate > '81/01/01' and hiredate <= '81/12/31';
select  ename, hiredate from emp where hiredate between '81/01/01' and '81/12/31';

-- 연봉이 40000이상인 직원의 모든 정보를 검색
select * from emp where sal*12 >= 40000;

-- 급여가 2500이상이고 직급이 'ANALYST'인 직원의 이름, 급여, 직급 검색
select ename, sal, job from emp where sal >=2500 and job = 'ANALYST';

-- 부서 번호가 30번이 아닌 직원의 이름과 부서번호를 검색
select ename, deptno from emp where deptno <> 30;
select ename, deptno from emp where NOT deptno = 30;

-- 사원의 이름이 'SCOTT'인 직원의 사원번호와 이름 출력
select empno, ename from emp where ename = 'SCOTT';
select empno, ename from emp where ename LIKE 'SCOTT';

-- like 패턴
select * from emp where ename like 'S%';
select * from emp where ename like '%E';
select * from emp where ename like '_L%';
select * from emp where ename like '%A%';
select * from emp where ename NOT like '%A%';

select * from dept;
select * from emp where deptno = 30;

-- null : 알 수 없는 값.
select null +100 from dual;-- 연산이나 가상 데이터를 셀렉해아하는 경우에 사용하는 테이블
select * from dual;

-- 아래처럼 null은 구할 수 없고, is null과 is not null을 사용
select ename, job from emp where comm = null;
select ename, job from emp where comm is null;
select ename, job from emp where comm is not null;

select empno, ename, sal*12+comm annsal from emp where comm is not null;
select empno, ename, sal*12 annsal from emp where comm is null;

-- 집합 연산자
-- UNION(중복제거합집합)
select empno, ename, sal, deptno from emp where ename like '%S%'
UNION
select empno, ename, sal, deptno from emp where ename like '%A%';
-- UNION ALL(중복허용 합집합)
select empno, ename, sal, deptno from emp where ename like '%S%'
UNION ALL
select empno, ename, sal, deptno from emp where ename like '%A%';
-- MINUS(차집합)
select empno, ename, sal, deptno from emp where ename like '%S%'
MINUS
select empno, ename, sal, deptno from emp where ename like '%A%';
-- INTERSECT(교집합)
select empno, ename, sal, deptno from emp where ename like '%S%'
INTERSECT
select empno, ename, sal, deptno from emp where ename like '%A%';

-- Q1. EMP테이블에서 사원의 이름이 S로 끝나는 사원 데이터를 모두 출력
select * from emp where ename like '%S';
-- Q2. 30번 부서에서 근무하는 사원 중 직급이 salesman인 사원의 사원번호, 이름, 직급, 급여
select empno, ename, job, sal from emp where deptno = 30 and job ='SALESMAN';
-- Q3. 20, 30번 부서에서 근무하는 사원 중 급여가 2000초과인 사원의 사원번호, 이름, 급여, 부서번호
select empno, ename, sal, deptno from emp where deptno in(20,30) and sal > 2000;
-- Q4. 급여가 2000이상 3000이하 범위의 직원 데이터를 모두 출력
select * from emp where sal >= 2000 and sal <=3000;
-- Q5. 사원 이름에 E가 포함되어있는 30번 부서의 사원중 급여가 1000~2000사이가 아닌 사원 이름,사원번호, 급여,부서번호
select ename, empno, sal, deptno from emp where ename like '%E%' and deptno=30 and sal not between 1000 and 2000;
-- Q6. 추가수당(COMM)이 존재하지 않고, 상급자가 있고 직책이 manager,clerk인 사원중 이름의 두번째 글자가 L이 아닌 사원
select * from emp where comm is null and mgr is not null and job in ('MANAGER','CLERK') and ename not like '_L%';
