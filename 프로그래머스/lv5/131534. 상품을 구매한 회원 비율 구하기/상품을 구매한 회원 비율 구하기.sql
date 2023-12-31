-- 코드를 입력하세요
# SELECT YEAR(SALES_DATE)AS YEAR, MONTH(SALES_DATE) AS MONTH, SUM(CU) AS PUCHASED_USERS, ROUND(PUCHASED_USERS/ ) AS PUCHASED_RATIO
# FROM (
# SELECT  *
# FROM (SELECT USER_ID, COUNT(*) AS T FROM USER_INFO WHERE YEAR(JOINED) = '2021')AS U JOIN ONLINE_SALE AS O ON U.USER_ID = O.USER_ID
# GROUP BY U.USER_ID
    # ) AS U_I
SELECT YEAR, MONTH, COUNT(*) AS PUCHASED_USERS, ROUND(COUNT(*)/(SELECT COUNT(*) FROM USER_INFO WHERE YEAR(JOINED) = '2021'),1) AS PUCHASED_RATIO 
FROM (SELECT DISTINCT YEAR(SALES_DATE)AS YEAR, MONTH(SALES_DATE) AS MONTH, O.USER_ID
      FROM ONLINE_SALE  AS O
      JOIN USER_INFO AS U ON U.USER_ID = O.USER_ID AND YEAR(JOINED) = '2021'
     ) AS F
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH