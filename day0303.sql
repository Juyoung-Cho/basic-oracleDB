-- ���̺� ���� ���� desc ���̺��;
desc dept;
desc emp;

select * from dept;
select * from emp;

select empno, ename, deptno from emp;

select distinct deptno, ename from emp;
select ALL job, deptno from emp;
--scott ȸ�翡 � ���޵��� �ִ��� �˰� �ʹ�.
select distinct job from emp;

select ename "Ename", job "Job" from emp;

select empno, sal*12 from emp;
select empno, sal*12 annsal from emp;

select empno, ename from emp order by empno asc;
select empno, ename from emp order by empno desc;

-- emp���� ��� ��ȣ, �̸�, �޿��� �޿��� ���� ������� ����ϱ�
select empno, ename, sal from emp order by sal desc;
-- emp���� ��� ��ȣ, �̸�, �Ի����� �Ի��� ������� ����ϱ�
select empno, ename, hiredate from emp order by hiredate;

select * from emp order by deptno asc, sal desc;

-- Q3
select empno EMPLOYEE_NO, ename employee_name,job, mgr MANAGER, hiredate, sal SALARY,
comm COMMISSION, deptno DEPARTMENT_NO from emp 
order by deptno desc, ename asc;

