-- ������
-- emp���� ��� ��ȣ�� 7788�� ����� ��� ������ ��ȸ
select * from emp where empno = 7788;

-- emp���� 30�� �μ��� 'salesman'�� ����� �̸��� �μ���ȣ, ���� ��ȸ
select ename, deptno, job from emp where deptno = 30 and job = 'SALESMAN';

-- emp���� 10�� �μ� ����̰ų� ������ 'CLERK'�� ����� �̸�, ����, �μ���ȣ ���
select ename, job, deptno from emp where deptno = 10 or job = 'CLERK';

-- emp���� �����ȣ�� 7844�� 7876�̰ų� 7900�� ����� �����ȣ�� �̸� ���
select deptno, ename from emp where empno = 7844 or empno = 7876 or empno = 7900;
select deptno, ename from emp where empno in(7844, 7876, 7900);

-- emp���� 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ��ȸ
select  ename, hiredate from emp where hiredate > '81/01/01' and hiredate <= '81/12/31';
select  ename, hiredate from emp where hiredate between '81/01/01' and '81/12/31';

-- ������ 40000�̻��� ������ ��� ������ �˻�
select * from emp where sal*12 >= 40000;

-- �޿��� 2500�̻��̰� ������ 'ANALYST'�� ������ �̸�, �޿�, ���� �˻�
select ename, sal, job from emp where sal >=2500 and job = 'ANALYST';

-- �μ� ��ȣ�� 30���� �ƴ� ������ �̸��� �μ���ȣ�� �˻�
select ename, deptno from emp where deptno <> 30;
select ename, deptno from emp where NOT deptno = 30;

-- ����� �̸��� 'SCOTT'�� ������ �����ȣ�� �̸� ���
select empno, ename from emp where ename = 'SCOTT';
select empno, ename from emp where ename LIKE 'SCOTT';

-- like ����
select * from emp where ename like 'S%';
select * from emp where ename like '%E';
select * from emp where ename like '_L%';
select * from emp where ename like '%A%';
select * from emp where ename NOT like '%A%';

select * from dept;
select * from emp where deptno = 30;

-- null : �� �� ���� ��.
select null +100 from dual;-- �����̳� ���� �����͸� �����ؾ��ϴ� ��쿡 ����ϴ� ���̺�
select * from dual;

-- �Ʒ�ó�� null�� ���� �� ����, is null�� is not null�� ���
select ename, job from emp where comm = null;
select ename, job from emp where comm is null;
select ename, job from emp where comm is not null;

select empno, ename, sal*12+comm annsal from emp where comm is not null;
select empno, ename, sal*12 annsal from emp where comm is null;

-- ���� ������
-- UNION(�ߺ�����������)
select empno, ename, sal, deptno from emp where ename like '%S%'
UNION
select empno, ename, sal, deptno from emp where ename like '%A%';
-- UNION ALL(�ߺ���� ������)
select empno, ename, sal, deptno from emp where ename like '%S%'
UNION ALL
select empno, ename, sal, deptno from emp where ename like '%A%';
-- MINUS(������)
select empno, ename, sal, deptno from emp where ename like '%S%'
MINUS
select empno, ename, sal, deptno from emp where ename like '%A%';
-- INTERSECT(������)
select empno, ename, sal, deptno from emp where ename like '%S%'
INTERSECT
select empno, ename, sal, deptno from emp where ename like '%A%';

-- Q1. EMP���̺��� ����� �̸��� S�� ������ ��� �����͸� ��� ���
select * from emp where ename like '%S';
-- Q2. 30�� �μ����� �ٹ��ϴ� ��� �� ������ salesman�� ����� �����ȣ, �̸�, ����, �޿�
select empno, ename, job, sal from emp where deptno = 30 and job ='SALESMAN';
-- Q3. 20, 30�� �μ����� �ٹ��ϴ� ��� �� �޿��� 2000�ʰ��� ����� �����ȣ, �̸�, �޿�, �μ���ȣ
select empno, ename, sal, deptno from emp where deptno in(20,30) and sal > 2000;
-- Q4. �޿��� 2000�̻� 3000���� ������ ���� �����͸� ��� ���
select * from emp where sal >= 2000 and sal <=3000;
-- Q5. ��� �̸��� E�� ���ԵǾ��ִ� 30�� �μ��� ����� �޿��� 1000~2000���̰� �ƴ� ��� �̸�,�����ȣ, �޿�,�μ���ȣ
select ename, empno, sal, deptno from emp where ename like '%E%' and deptno=30 and sal not between 1000 and 2000;
-- Q6. �߰�����(COMM)�� �������� �ʰ�, ����ڰ� �ְ� ��å�� manager,clerk�� ����� �̸��� �ι�° ���ڰ� L�� �ƴ� ���
select * from emp where comm is null and mgr is not null and job in ('MANAGER','CLERK') and ename not like '_L%';
