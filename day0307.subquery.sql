-- SUBQUERY : SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���� SQL�� ���ο��� ����ϴ� SELECT���� �ǹ�.
-- ������ ��������(SINGLE-ROW SUBQUERY) : ���� ����� �� �ϳ��� ������ ������ ��������(������ �����ڸ� ����Ͽ� ��)
-- Q.JONES���� �޿��� ���� ������ �̸��� �޿��� ���
SELECT SAL FROM EMP WHERE ENAME = 'JONES';
SELECT ENAME, SAL FROM EMP WHERE SAL > 2975;

SELECT ENAME, SAL FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

-- Q.SCOTT�� �μ����� ���
SELECT DNAME FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');

-- Q.��� �޿����� ���� �޴� ����� �̸��� �޿��� ���
SELECT ENAME, SAL FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);

-- Q.'SCOTT'���� ���� �Ի��� ����� ��� �����͸� ���
SELECT * FROM EMP WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');

-- JOIN ���� ����
-- Q.��� �޿����� ���� �޴� ����� �̸��� �μ����� ���
SELECT E.ENAME, D.DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND SAL > (SELECT AVG(SAL) FROM EMP);

-- Q.��� �޿����� ���ų� ���� 20�� �μ� �� �����, �μ���, �޿�
SELECT E.ENAME, D.DNAME, SAL FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO 
AND E.SAL <=(SELECT AVG(SAL) FROM EMP)
AND E.DEPTNO = 20;

-- ������ ��������(MULTIPLE-ROW SUBQUERY) : ���� ��� ���� ���� �� ������ �������� 
-- ������ ������ : IN, ANY, SOME, ALL, EXISTS

-- IN : ���������� ����� ��ġ�ϴ� ���� ���� ���� ���
-- Q.�� �μ��� �ְ� �޿��� ���� �޿��� �޴� ����� �̸��� �޿� ���
SELECT ENAME, SAL FROM EMP 
WHERE SAL IN (SELECT MAX(SAL)FROM EMP GROUP BY DEPTNO);

-- Q.�޿��� 3000�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ����� �̸��� �μ���ȣ ���
SELECT ENAME, DEPTNO, SAL FROM EMP 
WHERE DEPTNO
IN (SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >= 3000);

-- ANY, SOME : ���������� ���� ��� ���� ���������� ���ǽ��� ����, ����� �ϳ��� TRUE�� ���, �������� ���ǽ��� TRUE
-- Q.�μ��� 30���� ������� �޿� �� ���� ���� ������ ���� �޿��� �޴� ����� �̸�, �޿� ���
SELECT ENAME, SAL FROM EMP WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- Q.�μ��� 30���� ������� �޿� �� ���� ū ������ ���� �޿��� �޴� ����� �̸�, �޿�
SELECT ENAME, SAL FROM EMP WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- EXISTS : ���������� ����� ������ ��, TRUE. FALSE�� �������� ����X / NOT EXISTS
SELECT * FROM EMP WHERE EXISTS (SELECT EMPNO FROM EMP WHERE EMPNO = 9999);

-- ���߿� ��������(MULTIPLE-COLUMN SUBQUERY) : ���������� SELECT���� ���ҵ����͸� ���� �� �����ϴ� ���.
SELECT * FROM EMP WHERE (DEPTNO, SAL) IN (
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- FROM���� ����ϴ� �������� : ��Ī�� �����Ͽ� ���̺�ó�� ���
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM
(SELECT * FROM EMP WHERE DEPTNO = 10) E10,
(SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

-- WITH�� : �������� ��� �� ���� �̸��� �Բ� �ۼ�
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM DEPT)
SELECT * FROM E10, D WHERE E10.DEPTNO = D.DEPTNO;

-- ROWNUM : �����ȣ
SELECT EMPNO, ENAME, SAL, ROWNUM FROM EMP ORDER BY SAL DESC; -- ���ĵǱ� �� ROWNUM�� ����
SELECT EMPNO, ENAME, SAL, ROWNUM FROM (SELECT * FROM EMP ORDER BY SAL DESC) 
WHERE ROWNUM <= 5; 

SELECT * 
FROM (SELECT EMPNO, ENAME, SAL, ROWNUM R
FROM (SELECT * FROM EMP ORDER BY SAL DESC)
ORDER BY SAL DESC) WHERE R >= 6 AND R <= 10; -- Ư�� ���������� ���� �ִ� ��� �� �� �� ���Ѵ�.

-- SELECT���� ����ϴ� �������� (��Į�� ��������) : �ϳ��� �� �������μ� ��� ���
SELECT EMPNO, ENAME, JOB, SAL, 
(SELECT GRADE FROM SALGRADE 
    WHERE E.SAL BETWEEN LOSAL AND HISAL) SALGRADE, 
DEPTNO, (SELECT DNAME FROM DEPT D WHERE E.DEPTNO = D.DEPTNO) DNAME FROM EMP E;


-- 1. EMP���� �̸��� 'L'�ڸ� ���� ����� �̸�, ����, �μ���, �޿��� ���
SELECT ENAME, JOB, D.DNAME, SAL FROM EMP E NATURAL JOIN DEPT D WHERE ENAME LIKE '%L%';
-- 2. �̸��� F�� �����ϴ� ����� �̸�, �μ��� ��� 
SELECT ENAME, DNAME FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
WHERE ENAME LIKE 'F%';
-- 3. ��ġ ��� ���� �̸� �߿� A�� ����ִ� ��� 
SELECT ENAME FROM EMP WHERE ENAME LIKE '%A%';
SELECT ENAME FROM EMP WHERE INSTR(ENAME,'A') >0;
-- 4. �̸��� N���� ������ ���
SELECT ENAME FROM EMP WHERE ENAME LIKE '%N';
SELECT ENAME FROM EMP WHERE SUBSTR(ENAME,-1,1)='N';
-- 5. SCOTT�� ������ �μ����� ���ϴ� ������� �̸� ���
SELECT E.ENAME FROM EMP E, EMP M 
WHERE E.DEPTNO = M.DEPTNO
AND M.ENAME = 'SCOTT'
AND E.ENAME <> 'SCOTT';
-- 6. �̸��� A�� �������� �ʴ� ���
SELECT * FROM EMP WHERE INSTR(ENAME, 'A') =0;
SELECT * FROM EMP WHERE ENAME NOT LIKE '%A%';
-- 7. ���� ��¥�� ���ϴ� ����
SELECT SYSDATE FROM DUAL;
-- 8. ������� �Ի��Ͽ��� �Ի� �⵵�� �Ի� ���� ���
SELECT ENAME, SUBSTR(HIREDATE,1,2) �⵵, SUBSTR(HIREDATE,4,2) �� FROM EMP;
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY-MM') FROM EMP;
-- 9. 9���� �Ի��� ���
SELECT ENAME FROM EMP WHERE SUBSTR(HIREDATE,4,2) = 09;
-- 10. �׷� �Լ��� �̿��ؼ� ����� �� �޿�
SELECT SUM(SAL) FROM EMP;
-- 11. Ŀ�̼�(COMM) �Ѿ� 
SELECT SUM(COMM) FROM EMP;
-- 12. ACCOUNTING�μ� �Ҽӻ���� �̸��� �Ի����� ���
SELECT ENAME, HIREDATE FROM EMP E NATURAL JOIN DEPT D WHERE DNAME = 'ACCOUNTING';
select ename, hiredate from emp where deptno = 
(select deptno from dept where dname ='ACCOUNTING');
-- 13. �Ҽ� �μ��� �޿� �Ѿװ� ��� �޿�
SELECT DEPTNO, SUM(SAL), AVG(SAL) FROM EMP GROUP BY DEPTNO;
-- 14. Ŀ�̼��� �޴� ����� �̸��� �޿��� ���
SELECT ENAME, SAL FROM EMP WHERE COMM IS NOT NULL;
-- 15. �̸��� SCOTT�� ����� �μ����� ���
SELECT DNAME FROM DEPT NATURAL JOIN EMP WHERE ENAME = 'SCOTT';
-- 16. SALESMAN�� �����ȣ, �̸�, �޿�, �μ���� �ٹ����� ���
SELECT EMPNO, ENAME, SAL, DNAME, LOC FROM EMP NATURAL JOIN DEPT WHERE JOB ='SALESMAN';
-- 17. �� ����� �����, �޿�, �޿� ����� ���
SELECT ENAME, SAL, GRADE FROM EMP INNER JOIN SALGRADE ON SAL BETWEEN LOSAL AND HISAL;
-- 18. NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�, ����, �޿�, �μ����� ���
SELECT ENAME, JOB, SAL, DNAME FROM EMP NATURAL JOIN DEPT WHERE LOC = 'NEW YORK';






