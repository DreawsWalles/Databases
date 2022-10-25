--1. Выбрать все данные о пользователях. Результат отсортировать по фамилии в порядке обратном лексикографическому.
SELECT *
FROM USERS u
ORDER BY u.SURNAME DESC;

--2. Выбрать годы рождения пользователей без повторений. Результат отсортировать в порядке возрастания года.
SELECT DISTINCT Date_Birthday as "Дата рождения"
FROM USERS
ORDER BY DATE_BIRTHDAY;

--3. Выбрать фамилию и инициалы пользователей рожденных в 1999, 1997, 2000, 1993, 1990 годах. Результат отсортировать по месяцу рождения от января до декабря.
SELECT u.SURNAME as Фамилия, SUBSTR(u.NAME, 1, 1) || '. '|| SUBSTR(u.PATRONYMIC, 1, 1) as Инициалы
FROM USERS u
WHERE EXTRACT(YEAR FROM u.DATE_BIRTHDAY) IN (1999, 1997, 2000, 1993, 1990);

--4. Выбрать текст публикаций пользователя с id = 1, сделанных в текущем месяце.
SELECT p.DESCRIPTION AS Описание
FROM POSTS p
WHERE p.CREATOR_ID = 1 AND EXTRACT(MONTH FROM p.DATE_CREATION) = EXTRACT(MONTH FROM current_date) AND EXTRACT(YEAR FROM p.DATE_CREATION) = EXTRACT(YEAR FROM current_date);

--5. Выбрать все данные о пользователях, рожденных с 1990 по 2000 годы.
SELECT *
FROM USERS u
WHERE EXTRACT(YEAR FROM u.DATE_BIRTHDAY) BETWEEN 1990 AND 2000;

--6. Выбрать все данные публикаций, текст которых содержит ВГУ или ПММ 50 лет. Результат отсортировать по дате в порядке убывания и по id пользователя в убывающем порядке.
SELECT *
FROM POSTS p
WHERE p.DESCRIPTION LIKE '%ВГУ%' OR p.DESCRIPTION LIKE '%ПММ 50 лет%'
ORDER BY p.DATE_CREATION DESC, p.ID DESC;

--7. Выбрать данные публикаций, текст которых содержит символы - , _, % или &, но не содержат ВГУ.
SELECT *
FROM POSTS p
WHERE p.DESCRIPTION NOT LIKE '%ВГУ%' AND
      (p.DESCRIPTION LIKE '%,%' OR
      p.DESCRIPTION LIKE '%-%' OR
      p.DESCRIPTION LIKE '%_,%' OR
      p.DESCRIPTION LIKE '%!%%' ESCAPE '!');

--8. Выбрать данные сообществ, у которых не указано описание.
SELECT *
FROM COMMUNITY c
WHERE c.DESCRIPTION is null ;

--9. Выбрать фамилию, инициалы и дату рождения пользователя в одном столбце. Результат отсортировать по дате в убывающем порядке, по длине ФИО в возрастающем порядке.
SELECT u.SURNAME || ' ' || SUBSTR(u.NAME, 1, 1) || '. ' || SUBSTR(u.PATRONYMIC, 1, 1) || ' ' || u.DATE_BIRTHDAY as "Фамилия Имя Фамилия Дата Рождения"
FROM USERS u
ORDER BY u.DATE_BIRTHDAY DESC, length(u.SURNAME || u.NAME || u.PATRONYMIC);

--10. Выбрать id и ФИО пользователей, в отдельном столбце результирующей таблицы указать название времени года, в котором пользователь празднует день рождения.
-- Результат отсортировать следующим образом: в первую очередь пользователи рожденные с 1990 года по 2000, во вторую ‒ пользователи, рожденные после 2000,
-- а в последнюю все остальные.

SELECT u.id, u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC AS "ФИО",
       CASE
            WHEN EXTRACT(MONTH FROM u.DATE_BIRTHDAY) IN (1, 2, 12) THEN 'Зима'
            WHEN EXTRACT(MONTH FROM u.DATE_BIRTHDAY) IN (3, 4, 5) THEN 'Весна'
            WHEN EXTRACT(MONTH FROM u.DATE_BIRTHDAY) IN (6, 7, 8) THEN 'Лето'
            WHEN EXTRACT(MONTH FROM u.DATE_BIRTHDAY) IN (9, 10, 11) THEN 'Осень'
       END AS "Время года", u.DATE_BIRTHDAY
FROM USERS u
ORDER BY
    CASE
        WHEN EXTRACT(YEAR FROM u.DATE_BIRTHDAY) BETWEEN 1990 AND 2000 THEN 1
        WHEN EXTRACT(YEAR FROM u.DATE_BIRTHDAY) > 2000
            THEN 2
            ELSE 3
    END ;

--11. Выбрать название сообщества, идущего первым в списке сообществ, упорядоченных по названию в лексикографическом порядке.
SELECT c.NAME
FROM COMMUNITY c
ORDER BY c.NAME
FETCH FIRST 1 ROWS ONLY;

SELECT NAME
FROM (
    SELECT c.NAME, row_number() over (order by c.NAME) rn
    FROM COMMUNITY c
     )
WHERE rn <= 1;

--12. Выбрать средний возраст пользователей.
SELECT TRUNC(AVG(EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY))) as "Средний возраст"
FROM USERS u;

SELECT
    TRUNC(AVG(CASE
        WHEN (EXTRACT(MONTH FROM u.DATE_BIRTHDAY) > EXTRACT(MONTH FROM current_date))
        THEN EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY) - 1
        ELSE EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)
    END)) AS "Средний возраст"
FROM USERS u;

--13. Выбрать общее количество различных годов рождения пользователей.
SELECT COUNT(DISTINCT u.DATE_BIRTHDAY) AS "Количество различных годов рождения"
FROM USERS u;

--14. Выбрать максимальный и минимальный возраст пользователей.
SELECT MIN(a.age) AS "Минимальный возраст", MAX(a.age) AS "Максимальный возраст"
FROM (SELECT CASE
            WHEN (EXTRACT(MONTH FROM u.DATE_BIRTHDAY) > EXTRACT(MONTH FROM current_date))
            THEN EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY) - 1
            ELSE EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)
        END as age
      FROM USERS u) a;

--15. Выбрать год рождения самого молодого пользователя, рожденного весной.
SELECT MIN(CASE
                WHEN (EXTRACT(MONTH FROM u.DATE_BIRTHDAY) > EXTRACT(MONTH FROM current_date))
                THEN EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY) - 1
                ELSE EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)
            END) as "Самый молодой пользователя, рожденный весной"
FROM USERS u
WHERE EXTRACT(MONTH FROM u.DATE_BIRTHDAY) BETWEEN 3 AND 5;

--16. Вывести ФИО пользователя, даты и тексты всех публикаций. Результат отсортировать по ФИО в порядке обратном лексикографическому.
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as "ФИО", p.DATE_CREATION as "Дата создания", p.DESCRIPTION as "Текст публикации"
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID
ORDER BY u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC DESC;

--17. Вывести ФИО пользователя, даты и тексты всех публикаций, названия сообществ, на которые подписан пользователь, тексты сообщений, которые писал пользователь.
-- Результат отсортировать по дате рождения пользователя в убывающем порядке, по фамилии, имени и отчеству в порядке обратном лексикографическому, по дате публикации
-- в возрастающем порядке.
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as ФИО, p.DATE_CREATION as "Дата создания", p.DESCRIPTION as "Текст публикации",
        m.TEXT as "Текст сообщения", com.NAME
FROM USERS u LEFT JOIN POSTS p ON u.ID = p.CREATOR_ID
             LEFT JOIN MESSAGE m ON u.ID = m.PARTICIPANT_CHATROOM_USER_ID
             LEFT JOIN SUBSCRIBERS s on u.ID = s.USER_ID
             LEFT JOIN COMMUNITY com on S.COMMUNITY_ID = com.ID
ORDER BY u.DATE_BIRTHDAY DESC, u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC DESC, p.DATE_CREATION;

--18. Выбрать ФИО всех друзей пользователя Иванова Иван Ивановича.
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as "ФИО"
FROM USERS u JOIN FRIENDS f ON f.USER_ID = u.ID AND f.STATUS = 3 AND f.FRIEND_ID = (SELECT u1.id FROM USERS u1 WHERE u1.LOGIN = 'i.i.ivanov')
UNION ALL
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as "ФИО"
FROM USERS u JOIN FRIENDS f ON f.FRIEND_ID = u.ID AND f.STATUS = 3 AND f.USER_ID = (SELECT u1.id FROM USERS u1 WHERE u1.LOGIN = 'i.i.ivanov');


WITH id_ivanov AS (
    SELECT u.id, u.LOGIN
    FROM USERS u
    WHERE u.LOGIN = 'i.i.ivanov'
)
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as "ФИО"
FROM USERS u JOIN FRIENDS f ON f.USER_ID = u.ID AND f.STATUS = 3 AND f.FRIEND_ID = (SELECT i.id FROM id_ivanov i)
UNION ALL
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as "ФИО"
FROM USERS u JOIN FRIENDS f ON f.FRIEND_ID = u.ID AND f.STATUS = 3 AND f.USER_ID = (SELECT i.id FROM id_ivanov i );


--19. Выбрать ФИО пользователей, которые отправляли сообщения друзьям и получали от них ответные сообщения.
WITH dialogs AS (
SELECT u.id, COUNT(DISTINCT m.PARTICIPANT_CHATROOM_USER_ID)
FROM USERS u JOIN PARTICIPANT_CHATROOM pc ON u.ID = pc.USER_ID
             JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
             JOIN MESSAGE m ON m.CHATROOM_ID = c.ID
WHERE (u.ID, PARTICIPANT_CHATROOM_USER_ID) IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
      OR (PARTICIPANT_CHATROOM_USER_ID, u.ID) IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
      OR PARTICIPANT_CHATROOM_USER_ID = u.ID
GROUP BY u.ID, pc.CHATROOM_ID
HAVING COUNT(m.PARTICIPANT_CHATROOM_USER_ID) >= 2
)
SELECT DISTINCT SURNAME || ' ' || NAME || ' ' || PATRONYMIC as ФИО
FROM users u JOIN dialogs o ON u.ID = o.ID;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

--20. Вывести имя пользователя, дату рождения и количество сообщений им написанных.
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as "ФИО", u.DATE_BIRTHDAY as "Дата рождения", COUNT(*) as "Количество сообщений"
FROM USERS u JOIN MESSAGE m On m.PARTICIPANT_CHATROOM_USER_ID = u.ID
GROUP BY u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC, u.DATE_BIRTHDAY, u.ID;

--21. Выбрать все данные пользователей, которые участвуют, как минимум в двух сообществах
SELECT *
FROM USERS u
WHERE (SELECT COUNT(*) FROM SUBSCRIBERS s WHERE s.USER_ID = u.ID) >= 2;

SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as "ФИО"
FROM USERS u JOIN SUBSCRIBERS s ON s.USER_ID = u.ID
GROUP BY u.ID, u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC
HAVING COUNT(*) >= 2;

--22. Выбрать ФИО несовершеннолетних пользователей и количество их друзей.
-- Результат отсортировать по количеству друзей в убывающем порядке
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as "ФИО", COUNT(*) as "Количество друзей"
FROM USERS u JOIN FRIENDS f ON f.STATUS = 3 AND (f.USER_ID = u.ID OR f.FRIEND_ID = u.ID)
WHERE (EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)) < 18
GROUP BY u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC, u.ID
ORDER BY 2 desc;

--23. Выбрать ФИО несовершеннолетних пользователей, у которых более пяти друзей. Результат отсортировать по ФИО.
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as "ФИО"
FROM USERS u
WHERE (EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)) < 18 AND
      (SELECT COUNT(*) FROM FRIENDS f WHERE f.STATUS = 3 AND (f.FRIEND_ID = u.ID OR f.USER_ID = u.ID)) > 5;

SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC as "ФИО"
FROM (SELECT u.id, u.SURNAME, u.NAME, u.PATRONYMIC
      FROM USERS u JOIN FRIENDS F on u.ID = F.USER_ID AND F.STATUS = 3
      WHERE (EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)) < 18
      UNION ALL
      SELECT u.id, u.SURNAME, u.NAME, u.PATRONYMIC
      FROM USERS u JOIN FRIENDS F on u.ID = F.FRIEND_ID AND F.STATUS = 3
      WHERE (EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)) < 18) u
GROUP BY u.ID, u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC
HAVING COUNT(*) > 5;


--24.Выбрать все данные о пользователях полных тезках (фамилия, имя, отчество совпадают), рожденных в один день, но в разные годы.
SELECT *
FROM USERS u1 INNER JOIN USERS u2 ON u1.NAME LIKE u2.NAME AND u1.SURNAME LIKE u2.SURNAME AND u1.PATRONYMIC LIKE u2.PATRONYMIC AND
                                     EXTRACT(DAY FROM u1.DATE_BIRTHDAY) = EXTRACT(DAY FROM u2.DATE_BIRTHDAY) AND
                                     EXTRACT(MONTH FROM u1.DATE_BIRTHDAY) = EXTRACT(MONTH FROM u2.DATE_BIRTHDAY) AND
                                     (EXTRACT(YEAR FROM u1.DATE_BIRTHDAY) - EXTRACT(YEAR FROM u2.DATE_BIRTHDAY) > 0 OR
                                      EXTRACT(YEAR FROM u2.DATE_BIRTHDAY) - EXTRACT(YEAR FROM u1.DATE_BIRTHDAY) > 0);

--25. Для каждого пользователя указать даты первой и последней публикации. В результат включить пользователей старше 20 лет,
-- входящих в сообщество N (значение подставьте сами), имеющих более трех друзей. Результат отсортировать по ФИО.
SELECT u.login, MIN(p.DATE_CREATION), MAX(p.DATE_CREATION)
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID
             JOIN SUBSCRIBERS s ON s.USER_ID  = u.ID AND s.COMMUNITY_ID = (SELECT c.ID FROM COMMUNITY c WHERE c.NAME = 'Это мое превое сообщетсво')
WHERE EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY) >= 20 AND
      (SELECT COUNT(*) FROM FRIENDS f WHERE f.STATUS = 3 AND (f.FRIEND_ID = u.ID OR f.USER_ID = u.ID)) > 3
GROUP BY u.login, u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC
ORDER BY u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC ;

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




--26. Вывести данные всех пользователей и, если есть сообщения у пользователя, то вывести текст сообщений.
SELECT u.id, u.name as Имя, u.surname as Фамилия, u.patronymic as Отчество, u.email as Email, u.password as пароль, u.login as Логин, u.date_birthday as "Дата рождения",
       u.last_online as "Последний онлайн", u.phone_number as "Номер телефона", u.additional_phone_number as "Дополнительный номер телефона", u.link as "Ссылка", m.TEXT as Текст
FROM USERS u LEFT JOIN MESSAGE m ON m.PARTICIPANT_CHATROOM_USER_ID = u.ID;

--27. Вывести для каждого пользователя количество его сообщений.
SELECT COUNT(m.ID) as "Количество сообщений"
FROM USERS u LEFT JOIN MESSAGE m ON m.PARTICIPANT_CHATROOM_USER_ID = u.ID
GROUP BY u.ID;

--28. Для каждого пользователя, имеющего друзей, вывести названия всех сообществ.
SELECT c.NAME
FROM USERS u JOIN SUBSCRIBERS s ON s.USER_ID = u.ID
             JOIN COMMUNITY c ON c.ID = s.COMMUNITY_ID
WHERE (SELECT COUNT(*) FROM FRIENDS f WHERE f.STATUS = 3 AND (f.USER_ID = u.ID OR f.FRIEND_ID = u.ID)) > 0;

SELECT DISTINCT u.LOGIN, c.NAME
FROM USERS u CROSS JOIN COMMUNITY c
             JOIN FRIENDS F on (u.ID = F.USER_ID OR u.ID = F.FRIEND_ID) AND F.STATUS = 3
ORDER BY u.LOGIN;

--29.Для каждого пользователя вывести названия всех сообществ. И если пользователь является членом сообщества, то вывести в последнем столбце результирующей таблицы +.
SELECT u.LOGIN, c.NAME,
    CASE
        WHEN (SELECT COUNT(*) FROM SUBSCRIBERS s WHERE s.COMMUNITY_ID = c.ID AND s.USER_ID = u.ID) > 0
            THEN '+'
            ELSE '-'
    END as Подписан
FROM USERS u , COMMUNITY c ;

--30. Для каждого пользователя выбрать количество людей, с которыми он обменивался сообщениями.
SELECT u.LOGIN, COUNT(*) as "Количество людей с которыми пользователь обменивался сообщениями"
FROM USERS u JOIN CHATROOM c ON c.NAME = 'privateDialogue'
             JOIN PARTICIPANT_CHATROOM pc ON c.ID = pc.CHATROOM_ID AND u.ID = pc.USER_ID
GROUP BY u.LOGIN;

--31. Выбрать названия сообществ, в которых есть пользователи, сделавшие несколько публикаций в текущем месяце.
-- Результат отсортировать в лексикографическом порядке.
SELECT NAME
FROM COMMUNITY c INNER JOIN (SELECT community_id, COUNT(CREATOR_ID)
                             FROM posts
                             WHERE EXTRACT(MONTH FROM DATE_CREATION) = EXTRACT(MONTH FROM sysdate)
                             AND EXTRACT(year FROM DATE_CREATION) = EXTRACT(year FROM sysdate)
                             AND COMMUNITY_ID IS NOT NULL
                             GROUP BY community_id, CREATOR_ID
                             HAVING COUNT(CREATOR_ID) >= 2) k ON c.ID = k.community_id;

--32. Выбрать пользователей, которые пишут сообщения только своим друзьям.
WITH dialogues AS ( --найти список диалогов для каждого юзера
SELECT USER_ID, CHATROOM_ID
FROM PARTICIPANT_CHATROOM pc JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
),
friend_dialogues AS ( --отобрать диалоги между друзьями
SELECT DISTINCT d1.CHATROOM_ID
FROM dialogues d1 JOIN dialogues d2 ON d1.CHATROOM_ID = d2.CHATROOM_ID
WHERE (d1.USER_ID, d2.USER_ID) IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
      OR (d2.USER_ID, d1.USER_ID) IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
),
not_friend_msgs AS ( --отобрать юзеров с сообщениями, отправленными в чат с не друзьями
SELECT u.ID, COUNT(*)
FROM USERS u JOIN PARTICIPANT_CHATROOM pc ON u.ID = pc.USER_ID
             JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
             JOIN MESSAGE m ON m.CHATROOM_ID = c.ID
WHERE PARTICIPANT_CHATROOM_USER_ID = u.ID AND c.ID NOT IN (SELECT * FROM friend_dialogues)
GROUP BY u.ID
HAVING COUNT(*) >= 1
)
SELECT u.ID, u.NAME, u.SURNAME, u.PATRONYMIC --отобрать юзеров которые отправляли сообщения друзьям, но не отправляли не друзьям
FROM USERS u JOIN PARTICIPANT_CHATROOM pc ON u.ID = pc.USER_ID
             JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
             JOIN MESSAGE m ON m.CHATROOM_ID = c.ID
WHERE PARTICIPANT_CHATROOM_USER_ID = u.ID AND c.ID IN (SELECT * FROM friend_dialogues)
      AND u.ID NOT IN (SELECT u.ID FROM not_friend_msgs);

--33. Выбрать все данные пользователей, у которых более N друзей.
SELECT u.id, u.name as Имя, u.surname as Фамилия, u.patronymic as Отчество, u.email as Email, u.password as пароль, u.login as Логин, u.date_birthday as "Дата рождения",
       u.last_online as "Последний онлайн", u.phone_number as "Номер телефона", u.additional_phone_number as "Дополнительный номер телефона", u.link as "Ссылка"
FROM USERS u
WHERE (SELECT COUNT(*) FROM FRIENDS f WHERE f.STATUS = 3 AND (f.USER_ID = u.ID OR f.FRIEND_ID = u.ID)) > 1;

SELECT u.id, u.name as Имя, u.surname as Фамилия, u.patronymic as Отчество, u.email as Email, u.password as пароль, u.login as Логин, u.date_birthday as "Дата рождения",
       u.last_online as "Последний онлайн", u.phone_number as "Номер телефона", u.additional_phone_number as "Дополнительный номер телефона", u.link as "Ссылка"
FROM (SELECT u.id, u.name, u.surname, u.patronymic, u.email, u.password, u.login, u.date_birthday,
       u.last_online, u.phone_number, u.additional_phone_number, u.link
      FROM USERS u JOIN FRIENDS F on u.ID = F.USER_ID AND F.STATUS = 3
      WHERE (EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)) < 18
      UNION ALL
      SELECT u.id, u.name, u.surname, u.patronymic, u.email, u.password, u.login, u.date_birthday,
       u.last_online, u.phone_number, u.additional_phone_number, u.link
      FROM USERS u JOIN FRIENDS F on u.ID = F.FRIEND_ID AND F.STATUS = 3
      WHERE (EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)) < 18) u
GROUP BY u.id, u.name, u.surname, u.patronymic, u.email, u.password, u.login, u.date_birthday, u.last_online, u.phone_number, u.additional_phone_number, u.link
HAVING COUNT(*) > 5;

--34. Выбрать название сообщества и количество участников сообщества.
-- В результат включить только сообщества, названия которых состоит из двух слов или более, и в которых более N участников.
SELECT c.Name, COUNT(*)
FROM COMMUNITY c JOIN SUBSCRIBERS s ON s.COMMUNITY_ID = c.ID
WHERE INSTR(c.NAME, ' ') > 0 AND (SELECT COUNT(*) FROM SUBSCRIBERS s WHERE s.COMMUNITY_ID = c.ID) > 1
GROUP BY c.Name;

--35. Выбрать всех пользователей, если пользователь участник какого-либо сообщества, то название сообщества.
SELECT u.id, u.name as Имя, u.surname as Фамилия, u.patronymic as Отчество, u.email as Email, u.password as пароль, u.login as Логин, u.date_birthday as "Дата рождения",
       u.last_online as "Последний онлайн", u.phone_number as "Номер телефона", u.additional_phone_number as "Дополнительный номер телефона", u.link as "Ссылка", c.NAME
FROM USERS u LEFT JOIN SUBSCRIBERS s ON s.USER_ID = u.ID
             LEFT JOIN COMMUNITY c ON c.ID = s.COMMUNITY_ID;

--36. Выбрать всех пользователей, количество друзей пользователя, если пользователь участник сообщества или сообществ, то количество сообществ
WITH countCommunity AS (
    SELECT u.id, COUNT(c.ID) as "Количество сообществ"
    FROM USERS u LEFT JOIN SUBSCRIBERS S on u.ID = S.USER_ID
                 LEFT JOIN COMMUNITY C on S.COMMUNITY_ID = C.ID
    GROUP BY u.id
),
countFriend AS (
    SELECT u.id, COUNT(f.FRIEND_ID) AS "Количество друзей"
FROM USERS u LEFT JOIN FRIENDS f ON f.STATUS = 3 AND (f.USER_ID = u.ID OR f.FRIEND_ID = u.ID)
GROUP BY u.id
)
SELECT u.LOGIN, cc."Количество сообществ", cf."Количество друзей"
FROM USERS u JOIN countCommunity cc ON cc.ID = u.ID
             JOIN countFriend cf ON cf.ID = u.ID;

--37. Выбрать фамилию, имя, отчество пользователя, фамилию и инициалы его друзей, тексты сообщений, названия сообществ,
-- членом которых он является. Результат отсортировать по названию сообщества в лексикографическом порядке, по фамилии
-- пользователя в порядке обратном лексикографическому, по имени в прямом порядке, по отчеству в порядке обратном лексикографическому.
-- В результат должны войти все пользователи независимо являются ли они членами сообщества или нет, есть ли у них друзья или нет.
WITH Frnd AS (
SELECT u1.ID, u2.SURNAME || ' ' || SUBSTR(u2.NAME, 1, 1) || '. ' || SUBSTR(u2.PATRONYMIC, 1, 1) as "ФИО"
FROM FRIENDS f JOIN USERS u1 ON u1.ID = f.USER_ID
               JOIN USERS u2 ON u2.ID = f.FRIEND_ID
WHERE f.STATUS = 3
UNION ALL
SELECT u1.ID, u2.SURNAME || ' ' || SUBSTR(u2.NAME, 1, 1) || '. ' || SUBSTR(u2.PATRONYMIC, 1, 1) as "ФИО"
FROM FRIENDS f JOIN USERS u1 ON u1.ID = f.FRIEND_ID
               JOIN USERS u2 ON u2.ID = f.USER_ID
WHERE f.STATUS = 3)
SELECT u.id, u.SURNAME, u.NAME, u.PATRONYMIC, f.ФИО, m.TEXT, c.NAME
FROM USERS u LEFT JOIN Frnd f ON f.ID = u.ID
             LEFT JOIN MESSAGE m ON m.PARTICIPANT_CHATROOM_USER_ID = u.ID
             LEFT JOIN SUBSCRIBERS s ON s.USER_ID = u.ID
             LEFT JOIN COMMUNITY c ON c.ID = s.COMMUNITY_ID
ORDER BY c.NAME, u.PATRONYMIC DESC, u.NAME, u.PATRONYMIC DESC;

--38 Выбрать год и количество рожденных в этот год по временам года
SELECT EXTRACT(year from DATE_BIRTHDAY),
       SUM(CASE WHEN EXTRACT(month from DATE_BIRTHDAY) IN (12, 1, 2) THEN 1 ELSE 0 END) winter,
       SUM(CASE WHEN EXTRACT(month from DATE_BIRTHDAY) IN (3, 4, 5) THEN 1 ELSE 0 END) spring,
       SUM(CASE WHEN EXTRACT(month from DATE_BIRTHDAY) IN (6, 7, 8) THEN 1 ELSE 0 END) summer,
       SUM(CASE WHEN EXTRACT(month from DATE_BIRTHDAY) IN (9, 10, 11) THEN 1 ELSE 0 END) autumn
FROM users
GROUP BY EXTRACT(year from DATE_BIRTHDAY);

--39 Выбрать имя пользователя кол-во сообщений ему написанных и количество сообщения которые он написал
--Результат отсортировать по id пользователя
SELECT u.ID, u.NAME, u.SURNAME, u.PATRONYMIC, "Отправлено", "Получено"
FROM users u JOIN (SELECT u.ID , SUM(CASE WHEN m.ID IS NOT NULL THEN 1 ELSE 0 END) "Отправлено"
                   FROM users u LEFT JOIN message m ON u.ID = m.PARTICIPANT_CHATROOM_USER_ID
                   GROUP BY u.ID) K1 ON u.ID = k1.ID
             JOIN (SELECT u.ID, SUM(CASE WHEN m.ID IS NOT NULL THEN 1 ELSE 0 END) "Получено"
                   FROM USERS u LEFT JOIN PARTICIPANT_CHATROOM pc ON u.ID = pc.USER_ID
                    LEFT JOIN Chatroom c ON pc.CHATROOM_ID = c.ID
                    LEFT JOIN MESSAGE m ON m.CHATROOM_ID = c.ID AND PARTICIPANT_CHATROOM_USER_ID <> u.ID
                    GROUP BY u.ID) K2 ON u.ID = k2.ID
ORDER BY u.ID;

SELECT u.ID, u.NAME, u.SURNAME, u.PATRONYMIC,
    SUM(CASE WHEN m.PARTICIPANT_CHATROOM_USER_ID = u.ID THEN 1 ELSE 0 END) "Отправлено",
    SUM(CASE WHEN m.PARTICIPANT_CHATROOM_USER_ID <> u.ID THEN 1 ELSE 0 END) "Получено"
FROM USERS u LEFT JOIN PARTICIPANT_CHATROOM pc ON u.ID = pc.USER_ID
             LEFT JOIN Chatroom c ON pc.CHATROOM_ID = c.ID
             LEFT JOIN MESSAGE m ON m.CHATROOM_ID = c.ID
GROUP BY u.ID, u.NAME, u.SURNAME, u.PATRONYMIC
ORDER BY u.ID;

--40. Для каждого совершеннолетнего пользователя выбрать среднее количество его постов в месяц.
-- В результат включить только пользователей, являющихся членами какого-либо сообщества.
SELECT u.ID, ROUND(COUNT(*) / 12, 1)
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID AND p.COMMUNITY_ID IS NOT NULL
WHERE u.ID IN (SELECT s.USER_ID FROM SUBSCRIBERS s)
GROUP BY u.ID;

SELECT u.ID, ROUND(COUNT(*) / 12, 1)
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID AND p.COMMUNITY_ID IS NOT NULL
             JOIN SUBSCRIBERS s ON u.ID = s.USER_ID
GROUP BY u.ID;

--41. Для каждого пользователя вывести текст его последнего сообщения.
---Результат отсортировать по id пользователя.
WITH last_msg AS (
SELECT m1.*
FROM message m1 LEFT JOIN message m2 ON m1.PARTICIPANT_CHATROOM_USER_ID = m2.PARTICIPANT_CHATROOM_USER_ID
                                         AND m1.TIME_CREATED < m2.TIME_CREATED
WHERE m2.TIME_CREATED IS NULL
)
SELECT u.ID, u.NAME, u.SURNAME, u.PATRONYMIC, text
FROM users u LEFT JOIN last_msg ON u.id = last_msg.PARTICIPANT_CHATROOM_USER_ID
ORDER BY u.ID;

WITH msg AS (
    SELECT m.PARTICIPANT_CHATROOM_USER_ID,  Max(m.TIME_CREATED) AS time
    FROM MESSAGE m
    GROUP BY  m.PARTICIPANT_CHATROOM_USER_ID
    )
SELECT u.ID, u.NAME, u.SURNAME, u.PATRONYMIC, m1.Text
FROM USERS u LEFT JOIN msg m ON m.PARTICIPANT_CHATROOM_USER_ID = u.ID
             LEFT JOIN MESSAGE m1 ON m1.PARTICIPANT_CHATROOM_USER_ID = u.ID AND m1.TIME_CREATED = m.time
ORDER BY u.ID;

--42. Выбрать данные о пользователях, которые еще не написали ни одного сообщения.
SELECT u.ID, u.NAME, u.SURNAME
FROM users u LEFT JOIN message m ON u.ID = m.PARTICIPANT_CHATROOM_USER_ID
WHERE m.ID IS NULL;

SELECT u.ID, u.NAME, u.SURNAME
FROM USERS u
WHERE NOT EXISTS(SELECT * FROM MESSAGE pc WHERE pc.PARTICIPANT_CHATROOM_USER_ID = u.ID);


--43. Выбрать имя пользователя, у которого больше всего публикаций в одном сообществе.
WITH cnt AS (
SELECT u.ID, COUNT(p.ID) as Количество
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID AND p.COMMUNITY_ID IS NOT NULL
             JOIN COMMUNITY c ON c.ID = p.COMMUNITY_ID
GROUP BY u.ID
)
SELECT u.SURNAME, u.NAME, u.PATRONYMIC
FROM USERS u JOIN cnt ON cnt.ID = u.ID
WHERE Количество = (SELECT MAX(Количество) FROM cnt);

--44. Выбрать названия трех сообществ, в которых меньше всего публикаций.
SELECT  c.NAME, COUNT(p.ID) as Количество
FROM COMMUNITY c  JOIN POSTS p ON p.COMMUNITY_ID = c.ID
GROUP BY c.NAME
ORDER BY Количество
FETCH FIRST 3 ROWS ONLY;

--45. Выбрать имя пользователя с самым коротким паролем, сделавшим публикации в сообществе с наибольшим количеством пользователей.
WITH com AS (
    SELECT c.ID, COUNT(*) AS Количество
    FROM COMMUNITY c JOIN SUBSCRIBERS s on c.ID = s.COMMUNITY_ID
    GROUP BY c.ID
),
    pas AS (
        SELECT u.ID, LENGTH(u.PASSWORD) AS Длина
        FROM USERS u
    )
SELECT DISTINCT u.ID, u.SURNAME, u.NAME, u.PATRONYMIC
FROM USERS u JOIN pas ON pas.ID = u.ID
             JOIN POSTS p ON p.CREATOR_ID = u.ID
             JOIN (SELECT c.ID FROM com c WHERE Количество = (SELECT MAX(Количество) FROM com)) c ON c.Id = p.COMMUNITY_ID
WHERE Длина = (SELECT MIN(Длина) FROM pas);

--46. Выбрать имена пользователей, которые делали публикации, как минимум, в двух сообществах с наибольшим количеством публикаций
--и, как минимум, в двух сообществах с наименьшим количеством публикаций.
WITH comCnt AS (
    SELECT c.ID, COUNT(p.ID) AS Количество
    FROM COMMUNITY c JOIN POSTS p ON p.COMMUNITY_ID = c.ID
    GROUP BY c.ID
), comCntMax AS (
    SELECT c.ID, MAX(Количество)
    FROM comCnt c
    GROUP BY c.ID
), comCntMin AS (
    SELECT c.ID, Min(Количество)
    FROM comCnt c
    GROUP BY c.ID
)
SELECT u.SURNAME, u.NAME, u.PATRONYMIC
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID
WHERE (SELECT COUNT(*) FROM comCntMax c WHERE c.ID = p.COMMUNITY_ID) >= 2 AND
      (SELECT COUNT(*) FROM comCntMin c WHERE c.ID = p.COMMUNITY_ID) >= 2;

WITH comCnt AS (
    SELECT c.ID, COUNT(p.ID) AS Количество
    FROM COMMUNITY c JOIN POSTS p ON p.COMMUNITY_ID = c.ID
    GROUP BY c.ID
), comCntMax AS (
    SELECT c.ID, MAX(Количество)
    FROM comCnt c
    GROUP BY c.ID
), comCntMin AS (
    SELECT c.ID, Min(Количество)
    FROM comCnt c
    GROUP BY c.ID
)
SELECT u.SURNAME, u.NAME, u.PATRONYMIC
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID AND p.COMMUNITY_ID IN (SELECT ID FROM comCntMax) AND p.COMMUNITY_ID IN (SELECT ID FROM comCntMin)
GROUP BY u.SURNAME, u.NAME, u.PATRONYMIC, u.ID, p.COMMUNITY_ID
HAVING COUNT(*) >= 4 AND COUNT(DISTINCT p.COMMUNITY_ID) >= 2;

WITH comCnt AS (
    SELECT c.ID, COUNT(p.ID) AS Количество
    FROM COMMUNITY c JOIN POSTS p ON p.COMMUNITY_ID = c.ID
    GROUP BY c.ID
), comCntMax AS (
    SELECT c.ID, MAX(Количество)
    FROM comCnt c
    GROUP BY c.ID
), comCntMin AS (
    SELECT c.ID, Min(Количество)
    FROM comCnt c
    GROUP BY c.ID
)
SELECT u.SURNAME, u.NAME, u.PATRONYMIC
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID
             JOIN comCntMax cmax ON cmax.ID = p.COMMUNITY_ID
             JOIN comCntMin cmin ON cmin.ID = p.COMMUNITY_ID
GROUP BY u.SURNAME, u.NAME, u.PATRONYMIC, u.ID, p.COMMUNITY_ID
HAVING COUNT(*) >= 2 AND COUNT(DISTINCT p.COMMUNITY_ID) >= 1;

WITH comCnt AS (
    SELECT c.ID, COUNT(p.ID) AS Количество
    FROM COMMUNITY c JOIN POSTS p ON p.COMMUNITY_ID = c.ID
    GROUP BY c.ID
), comCntMax AS (
    SELECT c.ID, MAX(Количество)
    FROM comCnt c
    GROUP BY c.ID
), comCntMin AS (
    SELECT c.ID, Min(Количество)
    FROM comCnt c
    GROUP BY c.ID
)
SELECT u.SURNAME, u.NAME, u.PATRONYMIC
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID AND EXISTS(SELECT ID FROM comCntMax c where c.ID = p.COMMUNITY_ID)
                                                 AND EXISTS(SELECT ID FROM comCntMin c WHERE c.ID = p.COMMUNITY_ID)
GROUP BY u.SURNAME, u.NAME, u.PATRONYMIC, u.ID, p.COMMUNITY_ID
HAVING COUNT(*) >= 2 AND COUNT(DISTINCT p.COMMUNITY_ID) >= 1;


--47. Выбрать тексты публикаций самого пожилого пользователя.
WITH userYear AS (
    SELECT u.ID, u.DATE_BIRTHDAY - current_date AS Возраст
    FROM USERS u
)
SELECT p.DESCRIPTION
FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID
             JOIN userYear uy ON uy.ID = u.ID
WHERE Возраст = (SELECT MAX(Возраст) FROM userYear);

WITH userYear AS (
    SELECT u.ID, CASE
                    WHEN (EXTRACT(MONTH FROM u.DATE_BIRTHDAY) > EXTRACT(MONTH FROM current_date))
                    THEN EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY) - 1
                    ELSE EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)
                END AS Возраст, p.DESCRIPTION
    FROM USERS u JOIN POSTS p ON p.CREATOR_ID = u.ID
)
SELECT uy.DESCRIPTION, uy.ID, uy.Возраст
FROM userYear uy
WHERE Возраст = (SELECT MAX(Возраст) FROM userYear);

WITH userYear AS (
    SELECT u.ID, CASE
                    WHEN (EXTRACT(MONTH FROM u.DATE_BIRTHDAY) > EXTRACT(MONTH FROM current_date))
                    THEN EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY) - 1
                    ELSE EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM u.DATE_BIRTHDAY)
                END AS Возраст, p.DESCRIPTION
    FROM USERS u LEFT JOIN POSTS p ON p.CREATOR_ID = u.ID
)
SELECT uy.DESCRIPTION, uy.ID, uy.Возраст
FROM userYear uy
WHERE Возраст = (SELECT MAX(Возраст) FROM userYear);


--48. Выбрать данные о тех пользователях, которые писали сообщения всем своим друзьям.
WITH dialogues as ( --найти список диалогов для каждого юзера
    SELECT USER_ID, CHATROOM_ID
    FROM PARTICIPANT_CHATROOM pc JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
), friend_dialogues AS ( --отобрать диалоги между друзьями
    SELECT DISTINCT d1.USER_ID AS First, d2.USER_ID AS Second, d1.CHATROOM_ID
    FROM dialogues d1 JOIN dialogues d2 ON d1.CHATROOM_ID = d2.CHATROOM_ID
    WHERE (d1.USER_ID, d2.USER_ID) IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
          OR (d2.USER_ID, d1.USER_ID) IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
    )
SELECT u.SURNAME, u.NAME, u.PATRONYMIC
FROM USERS u
WHERE (SELECT COUNT(*) FROM FRIENDS WHERE STATUS = 3 AND (USER_ID = u.ID OR FRIEND_ID = u.ID)) =
      (SELECT COUNT(*) FROM friend_dialogues WHERE First = u.ID OR Second = u.ID);

--49. Вывести данные о сообществах, в которых нет пользователей.
SELECT *
FROM COMMUNITY c
WHERE NOT EXISTS(SELECT * FROM SUBSCRIBERS s WHERE c.ID = s.COMMUNITY_ID);

--50. Выбрать данные о пользователях, которые еще не написали ни одного сообщения.
SELECT u.SURNAME, u.NAME, u.PATRONYMIC
FROM USERS u
WHERE NOT EXISTS(SELECT * FROM MESSAGE m where m.PARTICIPANT_CHATROOM_USER_ID = u.ID);

--51. Выбрать имя пользователя, который написал наибольшее количество сообщений.
WITH cntMsg AS (
    SELECT u.ID, COUNT(*) as Количество
    FROM USERS u JOIN MESSAGE m ON m.PARTICIPANT_CHATROOM_USER_ID = u.ID
    GROUP BY u.ID
)
SELECT u.SURNAME, u.NAME, u.PATRONYMIC
FROM USERS u JOIN cntMsg ON cntMsg.ID = u.ID
WHERE Количество = (SELECT MAX(Количество) FROM cntMsg);

--52. Выбрать имя пользователя, который написал самое длинное сообщение.
WITH cntMsg AS (
    SELECT u.ID, LENGTH(m.TEXT) as Количество
    FROM USERS u JOIN MESSAGE m ON m.PARTICIPANT_CHATROOM_USER_ID = u.ID
)
SELECT u.SURNAME, u.NAME, u.PATRONYMIC
FROM USERS u JOIN cntMsg ON cntMsg.ID = u.ID
WHERE Количество = (SELECT MAX(Количество) FROM cntMsg);

--53. Выбрать ФИО всех пользователей, которые обменивались сообщениями, но друзьями не являются.
WITH dialogues as ( --найти список диалогов для каждого юзера
SELECT USER_ID, CHATROOM_ID
FROM PARTICIPANT_CHATROOM pc
 JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
),
friend_dialogues AS ( --отобрать диалоги между друзьями
SELECT DISTINCT d1.CHATROOM_ID
FROM dialogues d1 JOIN dialogues d2 ON d1.CHATROOM_ID = d2.CHATROOM_ID
WHERE (d1.USER_ID, d2.USER_ID) IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
      OR (d2.USER_ID, d1.USER_ID) IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
),
not_friend_msgs AS ( --отобрать юзеров с сообщениями, отправленными в чат с не друзьями
SELECT u.ID
FROM USERS u JOIN PARTICIPANT_CHATROOM pc ON u.ID = pc.USER_ID
             JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
             JOIN MESSAGE m ON m.CHATROOM_ID = c.ID
WHERE PARTICIPANT_CHATROOM_USER_ID = u.ID AND c.ID NOT IN (SELECT * FROM friend_dialogues)
)
SELECT u.ID, u.NAME, u.SURNAME, u.PATRONYMIC
FROM USERS u JOIN not_friend_msgs nfm ON u.id = nfm.id;

--54.Выбрать ФИО тех пользователей, которые не отвечали на сообщения
--пользователей, которые не являются друзьями
with dialogues as ( --найти список диалогов для каждого юзера
SELECT USER_ID, CHATROOM_ID
FROM PARTICIPANT_CHATROOM pc
 JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
),
not_friend_dialogues AS ( --отобрать диалоги между не друзьями
SELECT d1.USER_ID USER_ID1, d1.CHATROOM_ID CHATROOM_ID1, d2.USER_ID USER_ID2, d2.CHATROOM_ID CHATROOM_ID2
FROM dialogues d1 JOIN dialogues d2 ON d1.CHATROOM_ID = d2.CHATROOM_ID
WHERE (d1.USER_ID, d2.USER_ID) NOT IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
 AND (d2.USER_ID, d1.USER_ID) NOT IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
 AND d1.USER_ID <> d2.USER_ID
),
not_friend_msgs AS ( --отобрать юзеров с сообщениями, отправленными в чат с не друзьями
SELECT u.ID
FROM USERS u JOIN PARTICIPANT_CHATROOM pc ON u.ID = pc.USER_ID
 JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
     JOIN MESSAGE m ON m.CHATROOM_ID = c.ID
WHERE PARTICIPANT_CHATROOM_USER_ID = u.ID AND c.ID IN (SELECT USER_ID1 FROM not_friend_dialogues)
)
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC AS ФИО
FROM users u JOIN not_friend_dialogues nfd ON u.ID = nfd.USER_ID1
WHERE u.ID NOT IN (SELECT ID FROM not_friend_msgs);

with dialogues as ( --найти список диалогов для каждого юзера
SELECT USER_ID, CHATROOM_ID
FROM PARTICIPANT_CHATROOM pc
 JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
),
not_friend_dialogues AS ( --отобрать диалоги между не друзьями
SELECT d1.USER_ID USER_ID1, d1.CHATROOM_ID CHATROOM_ID1, d2.USER_ID USER_ID2, d2.CHATROOM_ID CHATROOM_ID2
FROM dialogues d1 JOIN dialogues d2 ON d1.CHATROOM_ID = d2.CHATROOM_ID
WHERE (d1.USER_ID, d2.USER_ID) NOT IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
    AND (d2.USER_ID, d1.USER_ID) NOT IN (SELECT USER_ID, FRIEND_ID FROM FRIENDS)
    AND d1.USER_ID <> d2.USER_ID
),
not_friend_msgs AS ( --отобрать юзеров с сообщениями, отправленными в чат с не друзьями
SELECT u.ID, COUNT(*)
FROM USERS u JOIN PARTICIPANT_CHATROOM pc ON u.ID = pc.USER_ID
             JOIN Chatroom c ON pc.CHATROOM_ID = c.ID AND c.NAME = 'privateDialogue'
             JOIN MESSAGE m ON m.CHATROOM_ID = c.ID
WHERE PARTICIPANT_CHATROOM_USER_ID = u.ID AND c.ID IN (SELECT USER_ID1 FROM not_friend_dialogues)
GROUP BY u.ID
HAVING COUNT(*) >= 1
)
SELECT u.SURNAME || ' ' || u.NAME || ' ' || u.PATRONYMIC AS ФИО
FROM users u
WHERE NOT EXISTS(SELECT * FROM not_friend_dialogues nfd WHERE nfd.USER_ID1 = u.ID OR nfd.USER_ID2 = u.ID);

--58. Выбрать все дни текущего года, в которые не делали публикаций.
WITH dates AS(
SELECT TRUNC (SYSDATE - ROWNUM) dt
FROM DUAL CONNECT BY ROWNUM < 366
)
SELECT dates.dt as "Дата"
FROM dates LEFT JOIN posts ON EXTRACT(DAY FROM dates.dt) = EXTRACT(DAY FROM posts.DATE_CREATION)
                            AND EXTRACT(MONTH FROM dates.dt) = EXTRACT(MONTH FROM posts.DATE_CREATION)
                            AND EXTRACT(YEAR FROM dates.dt) = EXTRACT(YEAR FROM posts.DATE_CREATION)
WHERE posts.ID IS NULL AND EXTRACT(YEAR FROM DT) = EXTRACT(YEAR FROM sysdate)
ORDER BY dt DESC;

WITH dates AS(
    SELECT TRUNC (SYSDATE - ROWNUM) dt
    FROM DUAL
    CONNECT BY ROWNUM < 366
),
    datePosts AS (
        SELECT DISTINCT TRUNC(p.DATE_CREATION)
        FROM POSTS p
        WHERE EXTRACT(YEAR FROM p.DATE_CREATION) = EXTRACT(YEAR FROM sysdate)
    )
SELECT *
FROM dates
WHERE EXTRACT(YEAR FROM dates.dt) = EXTRACT(YEAR FROM sysdate)
MINUS
SELECT *
FROM datePosts;


select u.id, surname, c.name, count(p.ID) OVER(PARTITION BY sub.USER_ID, sub.COMMUNITY_ID) "Запостил",
 count(distinct sub.COMMUNITY_ID) OVER(PARTITION BY sub.USER_ID) "Подписок",
 count(u.id) OVER() "Всего постов"
from users u LEFT JOIN subscribers sub ON u.id = sub.USER_ID
             LEFT JOIN COMMUNITY c ON sub.COMMUNITY_ID = c.id
             LEFT JOIN posts p ON u.id = p.CREATOR_ID AND c.id = p.COMMUNITY_ID
ORDER BY u.id;

WITH cte AS (
SELECT u.id, surname, c.name, count(p.ID) OVER(PARTITION BY sub.USER_ID, sub.COMMUNITY_ID) "Запостил",
         count(distinct sub.COMMUNITY_ID) OVER(PARTITION BY sub.USER_ID) "Подписок",
         count(p.id) OVER(PARTITION BY sub.USER_ID) "Всего постов пользователя"
FROM users u LEFT JOIN subscribers sub ON u.id = sub.USER_ID
             LEFT JOIN COMMUNITY c ON sub.COMMUNITY_ID = c.id
             LEFT JOIN posts p on u.id = p.CREATOR_ID and c.id = p.COMMUNITY_ID
ORDER BY u.id
)
SELECT DISTINCT ID,SURNAME,NAME,"Запостил","Подписок","Всего постов пользователя"
FROM cte;

SELECT *
FROM POSTS p;

INSERT INTO subscribers (USER_ID, COMMUNITY_ID)
VALUES (1, 2);

INSERT INTO subscribers (USER_ID, COMMUNITY_ID)
VALUES (2, 2);

UPDATE posts SET
 COMMUNITY_ID = 1
WHERE id = 1;

UPDATE posts SET
 COMMUNITY_ID = 1
WHERE id = 2;

UPDATE posts SET
 COMMUNITY_ID = 1
WHERE id = 3;

UPDATE posts SET
 COMMUNITY_ID = 1
WHERE id = 5;

UPDATE posts SET
 COMMUNITY_ID = 2
WHERE id = 6;

UPDATE posts SET
 COMMUNITY_ID = 1
WHERE id = 4;



