-- 테이블 구성 보기 desc 테이블명;
desc dept;
desc emp;

select * from dept;
select * from emp;

select empno, ename, deptno from emp;

select distinct deptno, ename from emp;
select ALL job, deptno from emp;
--scott 회사에 어떤 직급들이 있는지 알고 싶다.
select distinct job from emp;

select ename "Ename", job "Job" from emp;

select empno, sal*12 from emp;
select empno, sal*12 annsal from emp;

select empno, ename from emp order by empno asc;
select empno, ename from emp order by empno desc;

-- emp에서 사원 번호, 이름, 급여를 급여가 높은 순서대로 출력하기
select empno, ename, sal from emp order by sal desc;
-- emp에서 사원 번호, 이름, 입사일을 입사한 순서대로 출력하기
select empno, ename, hiredate from emp order by hiredate;

select * from emp order by deptno asc, sal desc;

-- Q3
select empno EMPLOYEE_NO, ename employee_name,job, mgr MANAGER, hiredate, sal SALARY,
comm COMMISSION, deptno DEPARTMENT_NO from emp 
order by deptno desc, ename asc;

