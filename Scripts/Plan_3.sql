ALTER SYSTEM FLUSH BUFFER_CACHE;
ALTER SYSTEM FLUSH SHARED_POOL;

EXPLAIN PLAN FOR
SELECT u.login, MIN(p.DATE_CREATION), MAX(p.DATE_CREATION)
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID
             JOIN SUBSCRIBERS s ON s.USER_ID  = u.ID AND s.COMMUNITY_ID = (SELECT c.ID FROM COMMUNITY c WHERE c.NAME = 'Это мое превое сообщетсво')
WHERE EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY) >= 20 AND
      (SELECT COUNT(*) FROM FRIENDS f WHERE f.STATUS = 3 AND (f.FRIEND_ID = u.ID OR f.USER_ID = u.ID)) > 3
GROUP BY u.login, u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC
ORDER BY u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC ;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

ALTER SYSTEM FLUSH BUFFER_CACHE;
ALTER SYSTEM FLUSH SHARED_POOL;

EXPLAIN PLAN FOR
WITH com AS (
    SELECT c.ID
    FROM COMMUNITY c WHERE c.NAME = 'Это мое превое сообщетсво'
),
    frined AS (
        SELECT u.ID
        FROM (SELECT u.id, u.SURNAME, u.NAME, u.PATRONYMIC
              FROM USERS u JOIN FRIENDS F on u.ID = F.USER_ID AND F.STATUS = 3
              WHERE (EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)) > 20
              UNION ALL
              SELECT u.id, u.SURNAME, u.NAME, u.PATRONYMIC
              FROM USERS u JOIN FRIENDS F on u.ID = F.FRIEND_ID AND F.STATUS = 3
              WHERE (EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)) > 20) u
        GROUP BY u.ID
        HAVING COUNT(*) > 3
    )
SELECT u.ID, u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as ФИО, MIN(p.DATE_CREATION), MAX(p.DATE_CREATION)
FROM USERS u JOIN frined f ON f.ID = u.ID
             JOIN POSTS p ON p.CREATOR_ID = u.ID
             JOIN SUBSCRIBERS s ON s.USER_ID = u.id AND s.COMMUNITY_ID = (SELECT c.ID FROM com c)
GROUP BY u.ID, u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC;
ORDER BY u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC ;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
