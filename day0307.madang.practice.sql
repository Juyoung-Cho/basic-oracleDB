SELECT * FROM BOOK;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;
-- 1. ��� ������ �̸��� ������ �˻��Ͻÿ�
SELECT BOOKNAME, PRICE FROM BOOK;
-- 2. ��� ������ �̸��� ������ �˻��Ͻÿ�
SELECT PRICE, BOOKNAME FROM BOOK;
-- 3. ��� ������ ������ȣ,  �����̸�, ���ǻ�, ������ �˻��Ͻÿ�
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE FROM BOOK;
-- 4. ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.(�ߺ� ����)
SELECT DISTINCT PUBLISHER FROM BOOK;
-- 5. ������ 20,000�� �̸��� ������ �˻��Ͻÿ�.
SELECT * FROM BOOK WHERE PRICE < 20000;
-- 6. ������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.
SELECT * FROM BOOK WHERE PRICE BETWEEN 10000 AND 20000;
-- 7. ���ǻ簡 ���½������� Ȥ�� �����ѹ̵��� ������ �˻��Ͻÿ�.
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����' OR PUBLISHER = '���ѹ̵��';
SELECT * FROM BOOK WHERE PUBLISHER IN ('�½�����','���ѹ̵��');
-- 8.���౸�� ���硯�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.
SELECT PUBLISHER FROM BOOK WHERE BOOKNAME LIKE '�౸�� ����';
-- 9. �����̸��� ���౸���� ���Ե� ���ǻ縦 �˻��Ͻÿ�.
SELECT PUBLISHER FROM BOOK WHERE BOOKNAME LIKE '%�౸%';
-- 10. �����̸��� ���� �� ��° ��ġ�� ��������� ���ڿ��� ���� ������ �˻��Ͻÿ�.
SELECT * FROM BOOK WHERE BOOKNAME LIKE '_��%';
-- 11. �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
SELECT * FROM BOOK WHERE BOOKNAME LIKE '%�౸%' AND PRICE >= 20000;
-- 12. ���ǻ簡 ���½������� Ȥ�� �����ѹ̵��� ������ �˻��Ͻÿ�.
SELECT * FROM BOOK WHERE PUBLISHER IN ('�½�����','���ѹ̵��');
-- 13. ������ �̸������� �˻��Ͻÿ�.
SELECT * FROM BOOK ORDER BY BOOKNAME;
-- 14. ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�.
SELECT * FROM BOOK ORDER BY PRICE, BOOKNAME;
-- 15. ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ �˻��Ͻÿ� 
SELECT * FROM BOOK ORDER BY PRICE DESC, PUBLISHER ASC;
-- 16. ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT SUM(SALEPRICE) FROM ORDERS;
-- 17. ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������  �� ������ ���Ͻÿ�.  ��, �� �� �̻� ������ ���� ���Ѵ�.
SELECT CUSTID ,COUNT(*) "�ֹ� ����" FROM ORDERS 
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >=2;
-- 19. ���� ���� �ֹ��� ���� �����͸� ����ȣ ������ �����Ͽ� ���̽ÿ�.
SELECT * FROM CUSTOMER NATURAL JOIN ORDERS ORDER BY CUSTID;
-- 20. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
SELECT C.NAME, O.SALEPRICE FROM CUSTOMER C NATURAL JOIN ORDERS O;
-- 21. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
SELECT NAME, SUM(SALEPRICE) FROM CUSTOMER NATURAL JOIN ORDERS 
GROUP BY NAME
ORDER BY NAME;
-- 22. ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�
SELECT NAME, BOOKNAME FROM CUSTOMER C, BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID
AND C.CUSTID = O.CUSTID;
-- 24. ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
SELECT NAME, BOOKNAME FROM CUSTOMER NATURAL JOIN BOOK NATURAL JOIN ORDERS
WHERE PRICE = 20000;
-- 25. ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
SELECT NAME, SALEPRICE FROM CUSTOMER C LEFT OUTER JOIN ORDERS O ON C.CUSTID = O.CUSTID;
-- 26. ���� ��� ������ �̸��� ���̽ÿ�.
SELECT BOOKNAME FROM BOOK WHERE PRICE = (SELECT MAX(PRICE)FROM BOOK);
-- 27. ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
SELECT NAME FROM CUSTOMER WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
-- 28. ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
SELECT NAME FROM CUSTOMER WHERE CUSTID IN
(SELECT CUSTID FROM ORDERS WHERE BOOKID IN
(SELECT BOOKID FROM BOOK WHERE PUBLISHER ='���ѹ̵��'));
-- 29. �������� �߱��� ���Ե� ������ �󱸷� ������ �� ���� ����� ���̽ÿ�.
SELECT BOOKID, REPLACE(BOOKNAME,'�߱�','��'), PUBLISHER, PRICE BOOKNAME FROM BOOK;
-- 30. �½��������� ������ ������ ����� ������ ���� ���� Ȯ���Ͻÿ�
SELECT BOOKNAME, LENGTH(BOOKNAME) ���ڼ� FROM BOOK WHERE PUBLISHER = '�½�����';
-- 31. �� �߿��� ���� ��(��)�� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�.(�ѱ����� ���� ���� ù��° �����̴�.)
SELECT SUBSTR(NAME,1,1) ��, COUNT(*) �ο��� FROM CUSTOMER
GROUP BY SUBSTR(NAME,1,1);
-- 32. �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�
SELECT ORDERDATE �ֹ���, ORDERDATE+10 Ȯ���� FROM ORDERS;
-- 33. 2014�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�. (�� �ֹ����� ��yyyy-mm-dd ���ϡ� ���·� ǥ��)
SELECT ORDERID, TO_CHAR(ORDERDATE, 'yyyy-mm-dd dy'), CUSTID, BOOKID FROM ORDERS WHERE ORDERDATE = TO_DATE('20140707','yyyymmdd');
-- 34. �̸�, ��ȭ��ȣ�� ���Ե� ������� ���̽ÿ�.��, ��ȭ��ȣ�� ���� ���� ������ó������ ���� ǥ���Ѵ�.
SELECT NAME, NVL(PHONE, '����ó����') PHONE FROM CUSTOMER;