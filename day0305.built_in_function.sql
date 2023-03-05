-- ���� �����͸� �����ϴ� ���� �Լ�
desc emp;
select ename, job from emp;
-- UPPER : ���ڿ� �빮�ڷ�, LOWER : ���ڿ� �ҹ��ڷ�, INICAP : ù ���ڸ� �빮�ڷ�
-- ������ �ٲ��� �ʴ´�.
select ename, upper(ename), lower(ename), initcap(ename) from emp;
SELECT * FROM EMP WHERE ENAME = UPPER('SCOTT');
SELECT * FROM EMP WHERE LOWER(ENAME) = LOWER('SCOTT');
SELECT * FROM EMP WHERE UPPER(ENAME) LIKE UPPER('%SCOTT%');

-- LENGTH : ���ڿ��� ���� LENGTHB : Byteũ�⸦ �˷���.
SELECT ENAME, LENGTH(ENAME) FROM EMP;
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;

-- ���� �̸��� 6���� �̻��� ������ ���
SELECT * FROM EMP WHERE LENGTH(JOB) >=6;

-- SUBSTR : ���ڿ� �Ϻκ� ���� 
-- ���ڸ��� ���� ��, �������� -1�ε����� ���̸� -1,-2,-3�� ���� �ں��� �������� �о��.
SELECT 'DATABASE', SUBSTR('DATABASE',1,4), SUBSTR('DATABASE',5), SUBSTR('DATABASE',-1) FROM DUAL;

-- ����� �̸��� 'S'�� �����ϴ� ����� �̸� ���(LIKE���� ����)
SELECT ENAME FROM EMP WHERE SUBSTR(ENAME,1,1) = 'S';
-- ����� �̸��� 'S'�� ������ ����� �̸� ���(LIKE���� ����)
SELECT ENAME FROM EMP WHERE SUBSTR(ENAME,-1,1) = 'S';

SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)), SUBSTR(JOB, -LENGTH(JOB),2), SUBSTR(JOB,-3) FROM EMP;

-- INSTR('���ڵ�����','ã�� ����',���� ��ġ,N��°) : ���ڿ� ������ �� Ư�� ���� ��ġ ã��(�ε���) >> �ش� ���� ���Կ���(������ 0) Ȯ�ο����� ��밡��
SELECT INSTR('hello','Z') FROM DUAL;
SELECT INSTR('HELLO,HELL',1,4) FROM DUAL;

-- Q. �̸��� 'A'�� ���Ե� ������ ���� ���
SELECT * FROM EMP WHERE INSTR(ENAME,'A') > 0;

-- REPLACE : Ư�� ���ڸ� �ٸ� ���ڷ� ��ü
SELECT REPLACE('010-1234-5678','-',' ') REPLACE1,REPLACE('010-1234-5678','-') REPLACE2 FROM DUAL;

-- LPAD / RPAD : �������� ä���(���� ä���� ������ �� ����)
SELECT 'ORACLE', LPAD('ORACLE',10,'#') LPAD1 FROM DUAL;
SELECT 'ORACLE', LPAD('ORACLE',10) LPAD1, RPAD('ORACLE',10,'*') RPAD1 FROM DUAL;
SELECT RPAD('950504-2',14,'*') �ֿ� FROM DUAL;
SELECT RPAD(SUBSTR(ENAME,1,2),LENGTH(ENAME),'*') "ENAME**" FROM EMP;

-- CONCAT / || : ���ڿ� ��ġ��
SELECT CONCAT('HELLO','ORACLE') "CONCAT" FROM DUAL;
SELECT 'HELLO' || 'ORACLE' "CONCAT2" FROM DUAL;
SELECT 'MY NAME IS ' ||ENAME FROM EMP;

-- TRIM / LTRIM / RTRIM : Ư�� ���� �����(�ȿ� �ִ� ������ ������ ����)
-- TRIM(�����ɼ� ������ ���ڿ� FROM '���� ������')
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

-- Q. 'SCOTT ' ������ ���� �� �˻��� ����� ������ ���
SELECT * FROM EMP WHERE UPPER(ENAME) = UPPER(TRIM('SCOTT '));

-- ���� �����͸� �����ϰ� ��ġ �����ϴ� �����Լ�

-- ROUND : �ݿø�(�Ҽ��� ù °�ڸ� �ε����� 0)
SELECT 1234.5678, ROUND(1234.5678)
, ROUND(1234.5678, 0) 
, ROUND(1234.5678, 1) 
, ROUND(1234.5678, 2) 
, ROUND(1234.5678, -1) 
FROM DUAL;

-- TRUNC : ����
SELECT 1234.5678, TRUNC(1234.5678)
, TRUNC(1234.5678, 0) 
, TRUNC(1234.5678, 1) 
, TRUNC(1234.5678, 2) 
, TRUNC(1234.5678, -1) 
FROM DUAL;

-- CEIL : ������ ���ڿ� ���� ����� ū ���� / FLOOR : ������ ���ڿ� ���� ����� ���� ����
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14) FROM DUAL;

-- MOD : ���ڸ� ���� ������
SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM DUAL;

-- ��¥ �����͸� �ٷ�� ��¥ �Լ�
-- ��¥ �����Ϳ� ���ڰ��� +, - ��� ������, ��¥ ������ + ��¥ �����ʹ� �Ұ���.
-- SYSDATE : ���� �ð� ���
SELECT SYSDATE-1 ����, SYSDATE ����, SYSDATE+1 ���� FROM DUAL;

-- ADD_MONTHS : �� ���� ���� ��¥
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM DUAL;
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE,240) ANNIVERSARY FROM EMP; 
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE ADD_MONTHS(HIREDATE, 450) < SYSDATE;

-- MONTHS_BETWEEN : �� ��¥���� ������ ����
SELECT EMPNO, ENAME, HIREDATE, ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) ���� FROM EMP;

-- NEXT_DAY(���� ��¥, ���� ����) : ���ƿ��� ���� ���� / LAST_DAY : ���� ������ ��¥
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 4) FROM DUAL; -- �Ͽ����� �ε����� 1

SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

-- �ݿø� / ����
SELECT HIREDATE, ROUND(HIREDATE, 'MONTH') FROM EMP WHERE DEPTNO = 10;
SELECT HIREDATE, TRUNC(HIREDATE, 'MONTH') FROM EMP WHERE DEPTNO = 10;

-- �ڷ����� ��ȯ�ϴ� �� ��ȯ �Լ�
-- TO_NUMBER(����, '��������') : ���� �����͸� ���� �����ͷ�
SELECT 10000+20000 FROM DUAL;
SELECT '10000'+'20000' FROM DUAL;
SELECT TO_NUMBER('10,000','999,999')+ TO_NUMBER('20,000','999,999') FROM DUAL;

-- TO_CHAR(��¥|����, '�������') : ���� �Ǵ� ��¥ �����͸� ���� �����ͷ�
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DY') FROM DUAL; -- ��
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL; -- �Ͽ���
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DY HH24:MI:SS') FROM DUAL;
SELECT ENAME, SAL, TO_CHAR(SAL, 'L999,999') FROM EMP WHERE DEPTNO = 10;

-- TO_DATE(����, '��������') : ���� �����͸� ��¥ �����ͷ�
SELECT TRUNC(SYSDATE - TO_DATE('2023/01/01','YYYY/MM/DD')) FROM DUAL;

-- Q. 81�� 10�� 15�� ���Ŀ� �Ի��� ����� �̸��� �Ի��� ���
select ename, hiredate from emp where hiredate > to_date('1981/10/15','YYYY/MM/DD');


-- NULL ó�� �Լ�
-- NVL(������(�÷�), null�� ��� ����� ��) : NULL�� �ƴϸ� �״��, NULL�̸� ������ ��
SELECT ENAME, SAL, COMM, NVL(COMM, 0) FROM EMP;
SELECT ENAME, SAL, SAL*12 + NVL(COMM, 0) ANNSAL FROM EMP;

-- NVL2(������(�÷�),null�� �ƴ� ��� ����� ����|��, null�� ��� ����� ����|��) : NULL�� �ƴ� ���� NULL�� �� ���� ������ ��
SELECT ENAME, SAL, NVL2(COMM, SAL*12+COMM, SAL*12) ANNSAL FROM EMP;
SELECT ENAME, SAL, NVL2(COMM, 'O', 'X') ANNSAL FROM EMP;
SELECT ENAME, SAL, NVL2(COMM, TO_CHAR(COMM), 'X') ANNSAL FROM EMP; -- Ÿ�� ��ġ ���Ѿ� ��.

-- Q. ��� ����� ��簡 �ִµ� �����ϰ� ��簡 ���� ���ڵ尡 �ִ�. ��簡 ���� ����� ����ϵ� mgr�÷� �� ��� ceo�� ���
SELECT EMPNO, ENAME, NVL('MGR', 'CEO') FROM EMP WHERE MGR IS NULL;

-- DECODE (�÷�, ����1, ���1, ����2, ���2, �⺻��) : ���� �����͸� ����, �׿� ���� ��ȯ�� ������ ����
SELECT ENAME, DEPTNO, DECODE(DEPTNO, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 'OPERATIONS') DNAME
FROM EMP;

-- CASE WHEN ����1 then ���1        
--      WHEN ����2 then ���2
--      else ���
--      end
SELECT ENAME, DEPTNO, CASE WHEN DEPTNO = 10 THEN 'ACCOUNTING'
                           WHEN DEPTNO = 20 THEN 'RESEARCH'
                           WHEN DEPTNO = 30 THEN 'SALES'
                           ELSE 'OPERATIONS' END DNAME
FROM EMP;

-- ���޿� ���� �޿� �λ� (�����ȣ, �����, ����, �λ�� �޿�)
-- ANALYST >> 5%, SALESMAN >> 10%, MANAGER >> 15%, CLERK >> 20%
SELECT EMPNO, ENAME, JOB, SAL, CASE WHEN JOB = 'ANALYST' THEN SAL*1.05
                               WHEN JOB = 'SALESMAN' THEN SAL*1.1
                               WHEN JOB = 'MANAGER' THEN SAL*1.15
                               WHEN JOB = 'CLERK' THEN SAL*1.2 
                               ELSE SAL END SAL
FROM EMP;