-- DDL : ������ ���Ǿ�
-- CREATE : ��ü ����
-- CREATE TABLE ���̺�� (
--    �÷��� Ÿ�� �������� DEFAULT �⺻��,
--    �÷��� Ÿ�� �������� DEFAULT �⺻��, ...
-- );
-- ���̺� : ���ڷ� ����, ���� ���� �� ���̺�� �ߺ� �Ұ�.
CREATE TABLE EMP_DDL AS SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO = 10;

SELECT * FROM EMP_DDL;
DELETE FROM EMP_DDL;
COMMIT;
-- ALTER : ���̺� ����
-- �÷� �߰�(ALTER-ADD)
-- ALTER TABLE ���̺�� ADD(�߰��� �÷���� Ÿ��);
-- ���ڵ尡 �ϳ��� ������ NOT NULL�� �� �� ����. 
ALTER TABLE EMP_DDL ADD (CREDATE DATE);
DESC EMP_DDL;

-- �÷������� Ÿ�� ���� (ALTER-MODIFY)
-- ALTER TABLE ���̺�� MODIFY (�÷��� Ÿ��);
ALTER TABLE EMP_DDL MODIFY(EMPNO NUMBER(5)); -- �̹� �����Ͱ� ����� ��� : Ÿ�� ����X, ũ�⸦ ���� �� ����.

-- �÷��� ����(ALTER-RENAME) 
-- ALTER TABLE ���̺�� RENAME COLUMN �÷��� TO ������ �̸�;
ALTER TABLE EMP_DDL RENAME COLUMN CREDATE TO HIREDATE;

-- �÷� ����(ALTER-DROP)  
-- ALTER TABLE ���̺�� DROP COLUMN �÷���; 
ALTER TABLE EMP_DDL DROP COLUMN HIREDATE;

-- DROP : ��ü ����
-- ���̺� ���� ��, �ش� ���̺��� �����ϰ� �ִ� (�ڽ�)���̺��� �ִٸ� ���� �Ұ�.
-- RENAME : ���̺�(��ü) �̸��� ����
-- RENAME ���� ���̺�� TO ������ �̸�.
RENAME EMP_DDL TO EMP_RENAME;
SELECT * FROM TAB;
-- TRUNCATE : ���̺��� �����͸� ����
-- TRUNCATE TABLE ���̺��; : ROLLBACK �Ұ�
TRUNCATE TABLE EMP_RENAME;