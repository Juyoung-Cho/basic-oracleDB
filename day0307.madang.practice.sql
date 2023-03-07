SELECT * FROM BOOK;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;
-- 1. 모든 도서의 이름과 가격을 검색하시오
SELECT BOOKNAME, PRICE FROM BOOK;
-- 2. 모든 도서의 이름과 가격을 검색하시오
SELECT PRICE, BOOKNAME FROM BOOK;
-- 3. 모든 도서의 도서번호,  도서이름, 출판사, 가격을 검색하시오
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE FROM BOOK;
-- 4. 도서 테이블에 있는 모든 출판사를 검색하시오.(중복 제거)
SELECT DISTINCT PUBLISHER FROM BOOK;
-- 5. 가격이 20,000원 미만인 도서를 검색하시오.
SELECT * FROM BOOK WHERE PRICE < 20000;
-- 6. 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.
SELECT * FROM BOOK WHERE PRICE BETWEEN 10000 AND 20000;
-- 7. 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’인 도서를 검색하시오.
SELECT * FROM BOOK WHERE PUBLISHER = '굿스포츠' OR PUBLISHER = '대한미디어';
SELECT * FROM BOOK WHERE PUBLISHER IN ('굿스포츠','대한미디어');
-- 8.‘축구의 역사’를 출간한 출판사를 검색하시오.
SELECT PUBLISHER FROM BOOK WHERE BOOKNAME LIKE '축구의 역사';
-- 9. 도서이름에 ‘축구’가 포함된 출판사를 검색하시오.
SELECT PUBLISHER FROM BOOK WHERE BOOKNAME LIKE '%축구%';
-- 10. 도서이름의 왼쪽 두 번째 위치에 ‘구’라는 문자열을 갖는 도서를 검색하시오.
SELECT * FROM BOOK WHERE BOOKNAME LIKE '_구%';
-- 11. 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
SELECT * FROM BOOK WHERE BOOKNAME LIKE '%축구%' AND PRICE >= 20000;
-- 12. 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’인 도서를 검색하시오.
SELECT * FROM BOOK WHERE PUBLISHER IN ('굿스포츠','대한미디어');
-- 13. 도서를 이름순으로 검색하시오.
SELECT * FROM BOOK ORDER BY BOOKNAME;
-- 14. 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오.
SELECT * FROM BOOK ORDER BY PRICE, BOOKNAME;
-- 15. 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 검색하시오 
SELECT * FROM BOOK ORDER BY PRICE DESC, PUBLISHER ASC;
-- 16. 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT SUM(SALEPRICE) FROM ORDERS;
-- 17. 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의  총 수량을 구하시오.  단, 두 권 이상 구매한 고객만 구한다.
SELECT CUSTID ,COUNT(*) "주문 수량" FROM ORDERS 
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >=2;
-- 19. 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오.
SELECT * FROM CUSTOMER NATURAL JOIN ORDERS ORDER BY CUSTID;
-- 20. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT C.NAME, O.SALEPRICE FROM CUSTOMER C NATURAL JOIN ORDERS O;
-- 21. 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT NAME, SUM(SALEPRICE) FROM CUSTOMER NATURAL JOIN ORDERS 
GROUP BY NAME
ORDER BY NAME;
-- 22. 고객의 이름과 고객이 주문한 도서의 이름을 구하시오
SELECT NAME, BOOKNAME FROM CUSTOMER C, BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID
AND C.CUSTID = O.CUSTID;
-- 24. 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
SELECT NAME, BOOKNAME FROM CUSTOMER NATURAL JOIN BOOK NATURAL JOIN ORDERS
WHERE PRICE = 20000;
-- 25. 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오
SELECT NAME, SALEPRICE FROM CUSTOMER C LEFT OUTER JOIN ORDERS O ON C.CUSTID = O.CUSTID;
-- 26. 가장 비싼 도서의 이름을 보이시오.
SELECT BOOKNAME FROM BOOK WHERE PRICE = (SELECT MAX(PRICE)FROM BOOK);
-- 27. 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT NAME FROM CUSTOMER WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
-- 28. 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT NAME FROM CUSTOMER WHERE CUSTID IN
(SELECT CUSTID FROM ORDERS WHERE BOOKID IN
(SELECT BOOKID FROM BOOK WHERE PUBLISHER ='대한미디어'));
-- 29. 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오.
SELECT BOOKID, REPLACE(BOOKNAME,'야구','농구'), PUBLISHER, PRICE BOOKNAME FROM BOOK;
-- 30. 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수를 확인하시오
SELECT BOOKNAME, LENGTH(BOOKNAME) 글자수 FROM BOOK WHERE PUBLISHER = '굿스포츠';
-- 31. 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오.(한국인은 성이 제일 첫번째 글자이다.)
SELECT SUBSTR(NAME,1,1) 성, COUNT(*) 인원수 FROM CUSTOMER
GROUP BY SUBSTR(NAME,1,1);
-- 32. 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오
SELECT ORDERDATE 주문일, ORDERDATE+10 확정일 FROM ORDERS;
-- 33. 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오. (단 주문일은 ‘yyyy-mm-dd 요일’ 형태로 표시)
SELECT ORDERID, TO_CHAR(ORDERDATE, 'yyyy-mm-dd dy'), CUSTID, BOOKID FROM ORDERS WHERE ORDERDATE = TO_DATE('20140707','yyyymmdd');
-- 34. 이름, 전화번호가 포함된 고객목록을 보이시오.단, 전화번호가 없는 고객은 ‘연락처없음’ 으로 표시한다.
SELECT NAME, NVL(PHONE, '연락처없음') PHONE FROM CUSTOMER;