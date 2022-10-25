--Address
insert into COUNTRY(id, name )
values (COUNTRY_SEQ.NEXTVAL, 'Russia');
    ----------------------------------------
    insert into REGION(id, name, country_id)
    values (REGION_SEQ.nextval, 'Tumenskaya oblast', (select e.id from COUNTRY e where e.NAME = 'Russia'));

        insert into CITY(id, name, REGION_ID)
        VALUES (CITY_SEQ.nextval, 'Tumen', (select e.id from REGION e where e.NAME = 'Tumenskaya oblast'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Voroshilova', (select e.id from CITY e where e.NAME = 'Tumen'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Begovaya', (select e.id from CITY e where e.NAME = 'Tumen'));

        insert into CITY(id, name, region_id)
        values (CITY_SEQ.nextval, 'Tobolsk', (select e.id from REGION e where e.NAME = 'Tumenskaya oblast'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Lenengraskaya',(select e.id from CITY e where e.NAME = 'Tobolsk'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'leninstiy prospekt', (select e.id from CITY e where e.NAME = 'Tobolsk'));
    --------------------------------------

    -------------------------
    insert into REGION(id, name, country_id)
    values (REGION_SEQ.nextval, 'Rostovskaya oblast', (select e.id from COUNTRY e where e.NAME = 'Russia'));

        insert into CITY(id, name, REGION_ID)
        VALUES (CITY_SEQ.nextval, 'Rostov-na-Don', (select e.id from REGION e where e.NAME = 'Rostovskaya oblast'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, '20 let oktabrya', (select e.id from CITY e where e.NAME = 'Rostov-na-Don'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Lenina', (select e.id from CITY e where e.NAME = 'Rostov-na-Don'));

        insert into CITY(id, name, REGION_ID)
        VALUES (CITY_SEQ.nextval, 'Bataysk', (select e.id from REGION e where e.NAME = 'Rostovskaya oblast'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Revolution 1905', (select e.id from CITY e where e.NAME = 'Bataysk'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Artamonova', (select e.id from CITY e where e.NAME = 'Bataysk'));
    -------------------------


    ----------------------------------
    insert into REGION(id, name, country_id)
    values (REGION_SEQ.nextval, 'Voronezhskaya oblast', (select e.id from COUNTRY e where e.NAME = 'Russia'));

        insert into CITY(id, name, REGION_ID)
        values (CITY_SEQ.nextval, 'Voronezh', (select e.id from REGION e where e.NAME = 'Voronezhskaya oblast'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Voroshilova', (select e.id from CITY e where e.NAME = 'Voronezh'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Begovaya', (select e.id from CITY e where e.NAME = 'Voronezh'));

        insert into CITY(id, name, REGION_ID)
        values (CITY_SEQ.nextval, 'Kalach', (select e.id from REGION e where e.NAME = 'Voronezhskaya oblast'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Revolution 1905', (select e.id from CITY e where e.NAME = 'Kalach'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Lenina', (select e.id from CITY e where e.NAME = 'Kalach'));
    ----------------------------------

    -----------------------------------
    insert into REGION(id, name, country_id)
    values (REGION_SEQ.nextval, 'Permskaya oblast', (select e.id from COUNTRY e where e.NAME = 'Russia'));

        insert into CITY(id, name, REGION_ID)
        values (CITY_SEQ.nextval, 'Permian', (select e.id from REGION e where e.NAME = 'Permskaya oblast'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Voroshilova', (select e.id from CITY e where e.NAME = 'Permian'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Begovaya', (select e.id from CITY e where e.NAME = 'Permian'));

        insert into CITY(id, name, REGION_ID)
        values (CITY_SEQ.nextval, 'Osa', (select e.id from REGION e where e.NAME = 'Permskaya oblast'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Revolution 1905', (select e.id from CITY e where e.NAME = 'Osa'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Lenina', (select e.id from CITY e where e.NAME = 'Osa'));
    ----------------------------------

    ----------------------------------
    insert into REGION(id, name, country_id)
    values (REGION_SEQ.nextval, 'Moskovskaya oblast', (select e.id from COUNTRY e where e.NAME = 'Russia'));

        insert into CITY(id, name, REGION_ID)
        values (CITY_SEQ.nextval, 'Moscow', (select e.id from REGION e where e.NAME = 'Moskovskaya oblast'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Voroshilova', (select e.id from CITY e where e.NAME = 'Moscow'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Begovaya', (select e.id from CITY e where e.NAME = 'Moscow'));

        insert into CITY(id, name, REGION_ID)
        values (CITY_SEQ.nextval, 'Krasnogorsk', (select e.id from REGION e where e.NAME = 'Moskovskaya oblast'));
            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Lenengraskaya',(select e.id from CITY e where e.NAME = 'Krasnogorsk'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'leninstiy prospekt', (select e.id from CITY e where e.NAME = 'Krasnogorsk'));
    ------------------------------------

insert into COUNTRY(id, name)
values (COUNTRY_SEQ.nextval, 'USA');

    ---------------------------------------
    insert into REGION(id, name, country_id)
    values (REGION_SEQ.nextval, 'New York', (select e.id from COUNTRY e where e.NAME = 'USA'));

        insert into CITY(id, name, region_id)
        values (CITY_SEQ.nextval, 'New York', (select e.id from REGION e where e.NAME = 'New York'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Brikel Avenue', (select e.id from CITY e where e.NAME = 'New York'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Lincoln', (select e.id from CITY e where e.NAME = 'New York'));

        insert into CITY(id, name, region_id)
        values (CITY_SEQ.nextval, 'Chicago', (select e.id from REGION e where e.NAME = 'New York'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Magnificent mile', (select e.id from CITY e where e.NAME = 'Chicago'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Republican', (select e.id from CITY e where e.NAME = 'Chicago'));
    ---------------------------------------


    ----------------------------------------
    insert into REGION(id, name, country_id)
    values (REGION_SEQ.nextval, 'California', (select e.id from COUNTRY e where e.NAME = 'USA'));

        insert into CITY(id, name, region_id)
        values (CITY_SEQ.nextval, 'California', (select e.id from REGION e where e.NAME = 'California'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Brikel Avenue', (select e.id from CITY e where e.NAME = 'California'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Lincoln', (select e.id from CITY e where e.NAME = 'California'));

        insert into CITY(id, name, region_id)
        values (CITY_SEQ.nextval, 'Los Angeles', (select e.id from REGION e where e.NAME = 'California'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Magnificent mile', (select e.id from CITY e where e.NAME = 'Los Angeles'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Republican', (select e.id from CITY e where e.NAME = 'Los Angeles'));
    ----------------------------------------

    ----------------------------------------
    insert into REGION(id, name, country_id)
    values (REGION_SEQ.nextval, 'Florida', (select e.id from COUNTRY e where e.NAME = 'USA'));

        insert into CITY(id, name, region_id)
        values (CITY_SEQ.nextval, 'Florida', (select e.id from REGION e where e.NAME = 'Florida'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Brikel Avenue', (select e.id from CITY e where e.NAME = 'Florida'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Republican', (select e.id from CITY e where e.NAME = 'Florida'));

        insert into CITY(id, name, region_id)
        values (CITY_SEQ.nextval, 'Miami', (select e.id from REGION e where e.NAME = 'Florida'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Magnificent mile', (select e.id from CITY e where e.NAME = 'Miami'));

            insert into STREET(id, name, city_id)
            values (STREET_SEQ.nextval, 'Brikel Avenue', (select e.id from CITY e where e.NAME = 'Miami'));
    ----------------------------------------
--End_Address

--SCHOOL
insert into SCHOOL(id, name, street_id)
values (SCHOOL_SEQ.nextval, 'Лицей 15', (select s.id from STREET s join CITY c on c.NAME = 'Voronezh'
                                        where s.NAME = 'Voroshilova' and s.CITY_ID = c.ID));

insert into SCHOOL(id, name, street_id)
values (SCHOOL_SEQ.nextval, 'Школа №90', (select s.id from STREET s join CITY c on c.NAME = 'Moscow'
                                        where s.NAME = 'Voroshilova' and s.CITY_ID = c.ID));
--end_school

--University
insert into UNIVERSITY(id, name, street_id)
values (UNIVERSITY_SEQ.nextval, 'ВГУ', (select s.id from STREET s join CITY c on c.NAME = 'Voronezh'
                                        where s.NAME = 'Voroshilova' and s.CITY_ID = c.ID));

insert into FACULTY(id, name, university_id)
values (FACULTY_SEQ.nextval, 'ПММ', (select u.id from UNIVERSITY u where u.NAME = 'ВГУ'));

insert into SPECIALIZATION(id, name, faculty_id)
values (SPECIALIZATION_SEQ.nextval, 'Бизнес информатика', (select f.id from FACULTY f where f.NAME = 'ПММ'));

insert into SPECIALIZATION(id, name, faculty_id)
values (SPECIALIZATION_SEQ.nextval, 'Прикладная информатика', (select f.id from FACULTY f where f.NAME='ПММ'));

insert into FACULTY(id, name, university_id)
values (FACULTY_SEQ.nextval, 'ФКН', (select u.id from UNIVERSITY u where u.NAME = 'ВГУ'));

insert into SPECIALIZATION(id, name, faculty_id)
values (SPECIALIZATION_SEQ.nextval, 'Прикладная информатиа', (select f.id from FACULTY f where f.NAME = 'ФКН'));

insert into SPECIALIZATION(id, name, faculty_id)
values (SPECIALIZATION_SEQ.nextval, 'Прикладаная математика и информатика', (select f.id from FACULTY f where f.NAME = 'ФКН'));

insert into UNIVERSITY(id, name, street_id)
values (UNIVERSITY_SEQ.nextval, 'Oxford', (select s.id from STREET s join CITY c on c.NAME = 'California'
                                            where s.NAME = 'Lincoln' and s.CITY_ID = c.ID));
insert into FACULTY(id, name, university_id)
values (FACULTY_SEQ.nextval, 'MBA', (select u.id from UNIVERSITY u where u.NAME = 'Oxford'));

insert into SPECIALIZATION(id, name, faculty_id)
values (SPECIALIZATION_SEQ.nextval, 'Strategic management', (select f.id from FACULTY f where f.NAME = 'MBA'));

insert into SPECIALIZATION(id, name, faculty_id)
values (SPECIALIZATION_SEQ.nextval, 'Business planning', (select f.id from FACULTY f where f.NAME = 'MBA'));

insert into FACULTY(id, name, university_id)
values (FACULTY_SEQ.nextval, 'Social sciences', (select u.id from UNIVERSITY u where u.NAME = 'Oxford'));

insert into SPECIALIZATION(id, name, faculty_id)
values (SPECIALIZATION_SEQ.nextval, 'Sociologist', (select f.id from FACULTY f where f.NAME = 'Social sciences'));

insert into SPECIALIZATION(id, name, faculty_id)
values (SPECIALIZATION_SEQ.nextval, 'Журналист', (select f.id from FACULTY f where f.NAME = 'Social sciences'));

insert into FORM_EDUCATION(id, name) values (FORM_EDUCATION_SEQ.nextval, 'Очная');

insert into FORM_EDUCATION(id, name) values (FORM_EDUCATION_SEQ.nextval, 'Очно-заочная');

insert into FORM_EDUCATION(id, name) values (FORM_EDUCATION_SEQ.nextval, 'Заочная');

insert into FORM_EDUCATION(id, name) VALUES (FORM_EDUCATION_SEQ.nextval, 'Экстернат');

insert into FORM_EDUCATION(id, name) VALUES (FORM_EDUCATION_SEQ.nextval, 'Дистанционная');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Абитуриент');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Студент(специалист)');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Студент(бакалавр)');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Студент(магистр)');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Выпускник(специалист)');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval,'Выпускник(бакалавр)');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Выпускник(магистр)');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Аспирант');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Кандидат наук');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Доктор наук');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Интерн');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Клинический ординатор');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Соискатель');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Ассистент-стажёр');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Докторант');

insert into STATUS_OF_EDUCATION(id, name) VALUES (STATUS_OF_EDUCATION_SEQ.nextval, 'Адъюнкт');
--end_University

--Gender
insert into GENDER(id, name) VALUES (GENDER_SEQ.nextval, 'Мужской');

insert into GENDER(id, name) VALUES (GENDER_SEQ.nextval, 'Женский');
--end_Gender

--Languages
insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Русский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Украинский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Беларусский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Англлийский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Испанский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Итальянский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Серпский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Португальский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Македонский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Румынский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Китайский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Япойнский');

insert into LANGUAGES(id, name) VALUES (LANGUAGES_SEQ.nextval, 'Английский');
--end_languages

--Status
insert into STATUS(id, name) VALUES (STATUS_SEQ.nextval, 'Не женат');

insert into STATUS(id, name) VALUES (STATUS_SEQ.nextval, 'Есть подруга');

insert into STATUS(id, name) VALUES (STATUS_SEQ.nextval, 'Помолвлен');

insert into STATUS(id, name) VALUES (STATUS_SEQ.nextval, 'Женат');

insert into STATUS(id, name) VALUES (STATUS_SEQ.nextval, 'Всё сложно');

insert into STATUS(id, name) VALUES (STATUS_SEQ.nextval, 'В активном поиске');

insert into STATUS(id, name) VALUES (STATUS_SEQ.nextval, 'Влюблен');

insert into STATUS(id, name) VALUES (STATUS_SEQ.nextval, 'В гражданском браке');
--end_status

--type_file
insert into TYPE_FILE(id, name) VALUES (TYPE_FILE_SEQ.nextval, 'Audio');

insert into TYPE_FILE(id, name) VALUES (TYPE_FILE_SEQ.nextval, 'video');

insert into TYPE_FILE(id, name) VALUES (TYPE_FILE_SEQ.nextval, 'photo');

insert into TYPE_FILE(id, name) VALUES (TYPE_FILE_SEQ.nextval, 'document');

insert into TYPE_FILE(id, name) VALUES (TYPE_FILE_SEQ.nextval, 'other');
--end_type_file

--addUser
insert into USERS(id, name, surname, patronymic, email, password, login, date_birthday, phone_number, gender_id)
values (USERS_SEQ.nextval, 'Иван', 'Иванов', 'Иванович', 'ivan.ivanov@mail.ru', 'test', 'i.i.ivanov',
        to_date('01.01.2001', 'DD.MM.YYYY'), '89994442233', (select g.id from GENDER g where g.NAME = 'Мужской'));

insert into USERS(id, name, surname, patronymic, email, password, login, date_birthday, phone_number, gender_id)
values (USERS_SEQ.nextval, 'Андрей', 'Спицын', 'Сергеевич', 'spicyns01@gmail.com', 'test', 'a.s.spitsin',
        to_date('01.09.2001', 'DD.MM.YYYY'), '89515442753', (select g.id from GENDER g where g.NAME = 'Мужской'));

insert into USERS(id, name, surname, patronymic, email, password, login, date_birthday, phone_number, gender_id)
values (USERS_SEQ.nextval, 'Андрей', 'Спицын', 'Сергеевич', 'spicyns01@mail.ru', 'test', 'a.s.spitsyn',
        to_date('01.09.2000', 'DD.MM.YYYY'), '89515442755', (select g.id from GENDER g where g.NAME = 'Мужской'));

insert into USERS(id, name, surname, patronymic, email, password, login, date_birthday, phone_number, gender_id)
values (USERS_SEQ.nextval, 'Полина', 'Вогникова', 'Игоревна', 'pol.vog8@gmail.com', 'test', 'p.i.Vognikova',
        to_date('08.06.1999', 'DD.MM.YYYY'), '89204372154', (select g.id from GENDER g where g.NAME = 'Мужской'));

insert into USERS (ID, NAME, SURNAME, PATRONYMIC, EMAIL, PASSWORD, LOGIN, DATE_BIRTHDAY, PHONE_NUMBER, GENDER_ID)
values (USERS_SEQ.nextval, 'Снежана', 'Шебуняева', 'Андреевна', 'snezh.shebun@gmail.com', 'test', 's.a.shebun',
        to_date('27.12.2000', 'DD.MM.YYYY'), '84443338844', (select g.id from GENDER g where g.NAME = 'Женский'));

insert into USERS(id, name, surname, patronymic, email, password, login, date_birthday, phone_number, gender_id)
values (USERS_SEQ.nextval, 'Ирина', 'Плотникова', 'Сергеевна', 'ir.plot@mail.ru', 'test', 'i.s.plot',
        to_date('08.09.2000', 'DD.MM.YYYY'), '87776662233', (select g.id from GENDER g where g.NAME = 'Женский'));

insert into USERS(id, name, surname, patronymic, email, password, login, date_birthday, phone_number, gender_id)
values (USERS_SEQ.nextval, 'Дмитрий', 'Ершов', 'Олегович', 'dm.ersh@gmail.com', 'test', 'dm.ol.ershov',
        to_date('18.08.2001', 'DD.MM.YYYY'), '82345672389', (select g.id from GENDER g where g.NAME = 'Мужской'));

insert into USERS(id, name, surname, patronymic, email, password, login, date_birthday, phone_number, gender_id)
values (USERS_SEQ.nextval, 'Татьяна', 'Стряпчих', 'Сергеевна', 't.stryap@mail.ru', 'test', 't.s.strapchih',
        to_date('22.09.2002', 'DD.MM.YYYY'), '89234556781', (select g.id from GENDER g where g.NAME = 'Женский'));

insert into USERS(id, name, surname, patronymic, email, password, login, date_birthday, phone_number, gender_id)
values (USERS_SEQ.nextval, 'Ирина', 'Димидова', 'Сергеевна', 'ir.demid@gmail.com', 'test', 'i.s.demidova',
        to_date('24.08.2001', 'DD.MM.YYYY'), '86543229876', (select g.id from GENDER g where g.NAME = 'Женский'));

insert into USERS(id, name, surname, patronymic, email, password, login, date_birthday, phone_number, gender_id)
values (USERS_SEQ.nextval, 'Александр', 'Бурков', 'Эдуардович', 'a.burkov@gmail.com', 'test', 'a.e.burkov',
        to_date('02.04.2001', 'DD.MM.YYYY'), '80987659876', (select g.id from GENDER g where g.NAME = 'Мужской'));
--end_addUser

--add_info_for_users
update USERS
set CITY_ID = (select c.id from CITY c where c.NAME = 'Voronezh')
where LOGIN = 'i.i.ivanov';

update USERS
set CITY_ID = (select c.id from CITY c where c.NAME = 'Moscow')
where LOGIN = 'a.s.spitsin';

update USERS
set CITY_ID = (select c.id from CITY c where c.NAME = 'Chicago')
where LOGIN = 'a.e.burkov';

update USERS
set CITY_ID = (select c.id from CITY c where c.NAME = 'Los Angeles')
where LOGIN = 't.s.strapchih';

insert into PLACE_OF_WORK(id, start_work, name, post, street_id, user_id)
values (PLACE_OF_WORK_SEQ.nextval, to_date('12.08.2021', 'DD.MM.YYYY'), 'Java.production', 'junior',
        (select s.id from STREET s join city c on c.NAME = 'Voronezh' where s.NAME = 'Voroshilova' and s.CITY_ID = c.ID),
        (select u.id from USERS u where u.login = 's.a.shebun'));

insert into PLACE_OF_WORK(id, start_work, end_work, name, post, street_id, user_id)
values (PLACE_OF_WORK_SEQ.nextval, to_date('08.12.2014', 'DD.MM.YYYY'), to_date('27.11.2019', 'DD.MM.YYYY'), 'Dance.pro', 'Учитель',
        (select s.id from STREET s join city c on c.NAME = 'Kalach' where s.NAME = 'Revolution 1905' and s.CITY_ID = c.ID),
        (select u.id from USERS u where u.login = 's.a.shebun'));

insert into PLACE_OF_WORK(id, start_work, name, post, street_id, user_id)
values (PLACE_OF_WORK_SEQ.nextval, to_date('23.02.2022', 'DD.MM.YYYY'), 'oracl.prod', 'junior',
        (select s.id from STREET s join city c on c.NAME = 'Chicago' where s.NAME = 'Republican' and s.CITY_ID = c.ID),
        (select u.id from USERS u where u.login = 'i.s.plot'));

insert into PLACE_OF_WORK(id, start_work, name, post, street_id, user_id)
values (PLACE_OF_WORK_SEQ.nextval, to_date('22.04.2022', 'DD.MM.YYYY'), 'NPF', 'junior',
        (select s.id from STREET s join city c on c.NAME = 'Los Angeles' where s.NAME = 'Magnificent mile' and s.CITY_ID = c.ID),
        (select u.id from USERS u where u.login = 'a.s.spitsin'));

insert into PLACE_OF_STUDY_SCHOOL(id, SCHOOL_ID, start_education, end_education, number_of_class, specialization, user_id)
values (PLACE_OF_STUDY_SCHOOL_SEQ.nextval, (select sc.id from SCHOOL sc where NAME = 'Лицей 15'),
        to_date('01.09.2007', 'DD.MM.YYYY'), to_date('31.05.2019'), 'a', 'Лицей с математическим уклоном',
        (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into PLACE_OF_STUDY_SCHOOL(id, SCHOOL_ID, start_education, end_education, number_of_class, specialization, user_id)
values (PLACE_OF_STUDY_SCHOOL_SEQ.nextval, (select sc.id from SCHOOL sc where NAME = 'Лицей 15'),
        to_date('01.09.2007', 'DD.MM.YYYY'), to_date('31.05.2019'), 'a', 'Лицей с математическим уклоном',
        (select u.id from USERS u where u.LOGIN = 'a.e.burkov'));

insert into PLACE_OF_STUDY_SCHOOL(id, SCHOOL_ID, start_education, end_education, number_of_class, user_id)
values (PLACE_OF_STUDY_SCHOOL_SEQ.nextval, (select sc.id from SCHOOL sc where NAME = 'Школа №90'),
        to_date('01.09.2007', 'DD.MM.YYYY'), to_date('31.05.2019'), 'a',
        (select u.id from USERS u where u.LOGIN = 'i.i.ivanov'));

insert into PLACE_OF_STUDY_UNIVERSITY(id, start_education, end_education, specialization_id, form_education_id, status_of_education_id,
                                      user_id)
values (PLACE_OF_STUDY_UNIVERSITY_SEQ.nextval, to_date('01.09.2019', 'DD.MM.YYYY'), to_date('01.08.2024', 'DD.MM.YYYY'),
        (select sp.id from SPECIALIZATION sp
            join UNIVERSITY un on un.NAME = 'ВГУ'
            join FACULTY fc on fc.UNIVERSITY_ID = un.ID
        where sp.NAME = 'Прикладная информатика' and sp.FACULTY_ID = fc.ID),
        (select fe.id from FORM_EDUCATION fe where fe.NAME = 'Очная'),
        (select st.id from STATUS_OF_EDUCATION st where st.NAME = 'Студент(бакалавр)'),
        (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into PLACE_OF_STUDY_UNIVERSITY(id, start_education, end_education, specialization_id, form_education_id, status_of_education_id,
                                      user_id)
values (PLACE_OF_STUDY_UNIVERSITY_SEQ.nextval, to_date('01.09.2019', 'DD.MM.YYYY'), to_date('01.08.2024', 'DD.MM.YYYY'),
        (select sp.id from SPECIALIZATION sp
            join UNIVERSITY un on un.NAME = 'ВГУ'
            join FACULTY fc on fc.UNIVERSITY_ID = un.ID
        where sp.NAME = 'Прикладная информатика' and sp.FACULTY_ID = fc.ID),
        (select fe.id from FORM_EDUCATION fe where fe.NAME = 'Очная'),
        (select st.id from STATUS_OF_EDUCATION st where st.NAME = 'Студент(бакалавр)'),
        (select u.id from USERS u where u.LOGIN = 'i.s.plot'));

insert into PLACE_OF_STUDY_UNIVERSITY(id, start_education, end_education, specialization_id, form_education_id, status_of_education_id,
                                      user_id)
values (PLACE_OF_STUDY_UNIVERSITY_SEQ.nextval, to_date('01.09.2019', 'DD.MM.YYYY'), to_date('01.08.2024', 'DD.MM.YYYY'),
        (select sp.id from SPECIALIZATION sp
            join UNIVERSITY un on un.NAME = 'ВГУ'
            join FACULTY fc on fc.UNIVERSITY_ID = un.ID
        where sp.NAME = 'Прикладная информатика' and sp.FACULTY_ID = fc.ID),
        (select fe.id from FORM_EDUCATION fe where fe.NAME = 'Очная'),
        (select st.id from STATUS_OF_EDUCATION st where st.NAME = 'Студент(бакалавр)'),
        (select u.id from USERS u where u.LOGIN = 'dm.ol.ershov'));

insert into PLACE_OF_STUDY_UNIVERSITY(id, start_education, end_education, specialization_id, form_education_id, status_of_education_id,
                                      user_id)
values (PLACE_OF_STUDY_UNIVERSITY_SEQ.nextval, to_date('01.09.2019', 'DD.MM.YYYY'), to_date('01.08.2024', 'DD.MM.YYYY'),
        (select sp.id from SPECIALIZATION sp
            join UNIVERSITY un on un.NAME = 'ВГУ'
            join FACULTY fc on fc.UNIVERSITY_ID = un.ID
        where sp.NAME = 'Прикладная информатика' and sp.FACULTY_ID = fc.ID),
        (select fe.id from FORM_EDUCATION fe where fe.NAME = 'Очная'),
        (select st.id from STATUS_OF_EDUCATION st where st.NAME = 'Студент(бакалавр)'),
        (select u.id from USERS u where u.LOGIN = 's.a.shebun'));

insert into PLACE_OF_STUDY_UNIVERSITY(id, start_education, end_education, specialization_id, form_education_id, status_of_education_id,
                                      user_id)
values (PLACE_OF_STUDY_UNIVERSITY_SEQ.nextval, to_date('01.03.2018', 'DD.MM.YYYY'), to_date('22.09.2024', 'DD.MM.YYYY'),
        (select sp.id from SPECIALIZATION sp
            join UNIVERSITY un on un.NAME = 'Oxford'
            join FACULTY fc on fc.UNIVERSITY_ID = un.ID
        where sp.NAME = 'Strategic management' and sp.FACULTY_ID = fc.ID),
        (select fe.id from FORM_EDUCATION fe where fe.NAME = 'Очно-заочная'),
        (select st.id from STATUS_OF_EDUCATION st where st.NAME = 'Студент(специалист)'),
        (select u.id from USERS u where u.LOGIN = 'i.i.ivanov'));

insert into PLACE_OF_STUDY_UNIVERSITY(id, start_education, end_education, specialization_id, form_education_id, status_of_education_id,
                                      user_id)
values (PLACE_OF_STUDY_UNIVERSITY_SEQ.nextval, to_date('01.03.2018', 'DD.MM.YYYY'), to_date('22.09.2024', 'DD.MM.YYYY'),
        (select sp.id from SPECIALIZATION sp
            join UNIVERSITY un on un.NAME = 'Oxford'
            join FACULTY fc on fc.UNIVERSITY_ID = un.ID
        where sp.NAME = 'Strategic management' and sp.FACULTY_ID = fc.ID),
        (select fe.id from FORM_EDUCATION fe where fe.NAME = 'Очно-заочная'),
        (select st.id from STATUS_OF_EDUCATION st where st.NAME = 'Студент(специалист)'),
        (select u.id from USERS u where u.LOGIN = 'i.s.demidova'));

insert into PLACE_OF_STUDY_UNIVERSITY(id, start_education, end_education, specialization_id, form_education_id, status_of_education_id,
                                      user_id)
values (PLACE_OF_STUDY_UNIVERSITY_SEQ.nextval, to_date('01.03.2018', 'DD.MM.YYYY'), to_date('22.09.2024', 'DD.MM.YYYY'),
        (select sp.id from SPECIALIZATION sp
            join UNIVERSITY un on un.NAME = 'Oxford'
            join FACULTY fc on fc.UNIVERSITY_ID = un.ID
        where sp.NAME = 'Strategic management' and sp.FACULTY_ID = fc.ID),
        (select fe.id from FORM_EDUCATION fe where fe.NAME = 'Очно-заочная'),
        (select st.id from STATUS_OF_EDUCATION st where st.NAME = 'Студент(специалист)'),
        (select u.id from USERS u where u.LOGIN = 't.s.strapchih'));

insert into LANGUAGES_USER(languages_id, user_id)
values ((select lg.id from LANGUAGES lg where lg.NAME = 'Русский'),
        (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into LANGUAGES_USER(languages_id, user_id)
values ((select lg.id from LANGUAGES lg where lg.NAME = 'Итальянский'),
        (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into LANGUAGES_USER(languages_id, user_id)
values ((select lg.id from LANGUAGES lg where lg.NAME = 'Япойнский'),
        (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into LANGUAGES_USER(languages_id, user_id)
values ((select lg.id from LANGUAGES lg where lg.NAME = 'Япойнский'),
        (select u.id from USERS u where u.LOGIN = 'a.e.burkov'));

insert into LANGUAGES_USER(languages_id, user_id)
values ((select lg.id from LANGUAGES lg where lg.NAME = 'Беларусский'),
        (select u.id from USERS u where u.LOGIN = 'a.e.burkov'));

insert into LANGUAGES_USER(languages_id, user_id)
values ((select lg.id from LANGUAGES lg where lg.NAME = 'Английский'),
        (select u.id from USERS u where u.LOGIN = 'a.e.burkov'));

insert into STATUS_USER(status_id, user_id)
values ((select st.id from STATUS st where st.NAME = 'Есть подруга'),
        (select u.id from USERS u where u.LOGIN = 'a.e.burkov'));

insert into STATUS_USER(status_id, user_id)
values ((select st.id from STATUS st where st.NAME = 'Женат'),
        (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into INTERESTS(id, user_id, activity, interests, like_music, like_films, like_shows, like_books, lime_games, like_quote, about_me)
values (INTERESTS_SEQ.nextval, (select u.id from USERS u where LOGIN = 'a.s.spitsin'),
        'Занимаюсь программированием', 'Интересны кухни разных стран', 'рок и реп', '1+1, Багемская рапсодия', 'Импровизация', 'Гарри Поттер',
        'Assasins Creed, Dota 2', 'Волк не тот что волк, а тот что не собака', 'самый интересный человек');

insert into INTERESTS(id, user_id, activity, interests, like_music, like_films, like_shows, like_books, lime_games, like_quote)
values (INTERESTS_SEQ.nextval, (select u.id from USERS u where LOGIN = 'a.e.burkov'),
        'Целыми днями играю', 'Люблю смотреть аниме', 'группа Linkin park', 'Самогонщики', 'ЧБД', 'Физика или как понять этот мир',
        'Terraria, Osa', 'За двумя зайцами погонишься, ни одного не поймаешь');
--end_add_info_for_users

--friendShip
insert into FRIENDS(user_id, friend_id, time, status)
values ((select u.id from USERS u where LOGIN = 'a.s.spitsin'),
        (select u.id from USERS u where LOGIN = 'a.e.burkov'),
        current_date, 3);

insert into FRIENDS(user_id, friend_id, time, status)
values ((select u.id from USERS u where LOGIN = 'a.s.spitsin'),
        (select u.id from USERS u where LOGIN = 'dm.ol.ershov'),
        current_date, 3);

insert into FRIENDS(user_id, friend_id, time, status)
values ((select u.id from USERS u where LOGIN = 'a.s.spitsin'),
        (select u.id from USERS u where LOGIN = 'i.s.plot'),
        current_date, 3);

insert into FRIENDS(user_id, friend_id, time, status)
values ((select u.id from USERS u where LOGIN = 'a.s.spitsin'),
        (select u.id from USERS u where LOGIN = 's.a.shebun'),
        current_date, 3);

insert into FRIENDS(user_id, friend_id, time, status)
values ((select u.id from USERS u where LOGIN = 'a.e.burkov'),
        (select u.id from USERS u where LOGIN = 'i.s.demidova'),
        current_date, 2);

insert into FRIENDS(user_id, friend_id, time, status)
values ((select u.id from USERS u where LOGIN = 's.a.shebun'),
        (select u.id from USERS u where LOGIN = 'i.i.ivanov'),
        current_date, 2);

insert into FRIENDS(user_id, friend_id, time, status)
values ((select u.id from USERS u where LOGIN = 'i.i.ivanov'),
        (select u.id from USERS u where LOGIN = 'a.e.burkov'),
        current_date, 3);

insert into FRIENDS(user_id, friend_id, time, status)
values ((select u.id from USERS u where LOGIN = 'a.s.spitsin'),
        (select u.id from USERS u where LOGIN = 'i.i.ivanov'),
        current_date, 3);

insert into FRIENDS(user_id, friend_id, time, status)
values ((select u.id from USERS u where LOGIN = 's.a.shebun'),
        (select u.id from USERS u where LOGIN = 'i.s.plot'),
        current_date, 2);
--end_friendShip


--Chatroom
insert into CHATROOM(id, name, avatar)
values (CHATROOM_SEQ.nextval, 'privateDialogue', 'avatar');

insert into PARTICIPANT_CHATROOM(user_id, chatroom_id)
values ((select u.id from USERS u where LOGIN = 'a.s.spitsin'),
        CHATROOM_SEQ.currval);

insert into PARTICIPANT_CHATROOM(user_id, chatroom_id)
values ((select u.id from USERS u where LOGIN = 'dm.ol.ershov'),
        CHATROOM_SEQ.currval);

insert into CHATROOM(id, name, avatar)
values (CHATROOM_SEQ.nextval, 'privateDialogue', 'avatar');

insert into PARTICIPANT_CHATROOM(user_id, chatroom_id)
values ((select u.id from USERS u where LOGIN = 'a.s.spitsin'),
        CHATROOM_SEQ.currval);

insert into PARTICIPANT_CHATROOM(user_id, chatroom_id)
values ((select u.id from USERS u where LOGIN = 'i.s.plot'),
        CHATROOM_SEQ.currval);

insert into CHATROOM(id, name, avatar, creator_id)
values (CHATROOM_SEQ.nextval, 'Беседа выпускников', 'avatar', (select u.id from USERS u where LOGIN = 'a.s.spitsin'));

insert into PARTICIPANT_CHATROOM(user_id, chatroom_id)
values ((select u.id from USERS u where LOGIN = 'i.s.plot'),
        (select c.id from CHATROOM c join USERS u on c.CREATOR_ID = u.ID));

insert into PARTICIPANT_CHATROOM(user_id, chatroom_id)
values ((select u.id from USERS u where LOGIN = 'dm.ol.ershov'),
        (select c.id from CHATROOM c join USERS u on c.CREATOR_ID = u.ID));


insert into CHATROOM(id, name, avatar)
values (CHATROOM_SEQ.nextval, 'privateDialogue', 'avatar');

insert into PARTICIPANT_CHATROOM(user_id, chatroom_id)
values ((select u.id from USERS u where LOGIN = 'a.e.burkov'),
        CHATROOM_SEQ.currval);

insert into PARTICIPANT_CHATROOM(user_id, chatroom_id)
values ((select u.id from USERS u where LOGIN = 'i.s.demidova'),
        CHATROOM_SEQ.currval);

insert into CHATROOM(id, name, avatar)
values (CHATROOM_SEQ.nextval, 'privateDialogue', 'avatar');

insert into PARTICIPANT_CHATROOM(user_id, chatroom_id)
values ((select u.id from USERS u where LOGIN = 'a.s.spitsin'),
        CHATROOM_SEQ.currval);

insert into PARTICIPANT_CHATROOM(user_id, chatroom_id)
values ((select u.id from USERS u where LOGIN = 'p.i.Vognikova'),
        CHATROOM_SEQ.currval);
--endChatroom


--Message
insert into MESSAGE(id, time_created, text, participant_chatroom_user_id, chatroom_id)
values (MESSAGE_SEQ.nextval, current_date,'Привет, Полин', (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'),
        (select pc.chatroom_id from PARTICIPANT_CHATROOM pc
    join USERS u on u.LOGIN = 'a.s.spitsin'
    join CHATROOM chat on chat.CREATOR_ID is null
where (pc.USER_ID = u.ID) and (pc.CHATROOM_ID = chat.ID)
  and pc.CHATROOM_ID
  in (select pc1.chatroom_id from PARTICIPANT_CHATROOM pc1
    join USERS u1 on u1.LOGIN = 'p.i.Vognikova'
     where pc1.USER_ID = u1.ID)));

insert into MESSAGE(id, time_created, text, participant_chatroom_user_id, chatroom_id)
values (MESSAGE_SEQ.nextval, current_date,'Привет', (select u.id from USERS u where u.LOGIN = 'a.e.burkov'),
        (select pc.chatroom_id from PARTICIPANT_CHATROOM pc
    join USERS u on u.LOGIN = 'a.e.burkov'
    join CHATROOM chat on chat.CREATOR_ID is null
where (pc.USER_ID = u.ID) and (pc.CHATROOM_ID = chat.ID)
  and pc.CHATROOM_ID
  in (select pc1.chatroom_id from PARTICIPANT_CHATROOM pc1
    join USERS u1 on u1.LOGIN = 'i.s.demidova'
     where pc1.USER_ID = u1.ID)));

insert into MESSAGE(id, time_created, text, participant_chatroom_user_id, chatroom_id)
values (MESSAGE_SEQ.nextval, current_date,'Привет', (select u.id from USERS u where u.LOGIN = 'dm.ol.ershov'),
        (select pc.chatroom_id from PARTICIPANT_CHATROOM pc
    join USERS u on u.LOGIN = 'dm.ol.ershov'
    join CHATROOM chat on chat.CREATOR_ID is null
where (pc.USER_ID = u.ID) and (pc.CHATROOM_ID = chat.ID)
  and pc.CHATROOM_ID
  in (select pc1.chatroom_id from PARTICIPANT_CHATROOM pc1
    join USERS u1 on u1.LOGIN = 'a.s.spitsin'
     where pc1.USER_ID = u1.ID)));

insert into MESSAGE(id, time_created, text, participant_chatroom_user_id, chatroom_id)
values (MESSAGE_SEQ.nextval, current_date,'Какая прекрасная погода', (select u.id from USERS u where u.LOGIN = 'dm.ol.ershov'),
        (select pc.chatroom_id from PARTICIPANT_CHATROOM pc
    join USERS u on u.LOGIN = 'dm.ol.ershov'
    join CHATROOM chat on chat.CREATOR_ID is null
where (pc.USER_ID = u.ID) and (pc.CHATROOM_ID = chat.ID)
  and pc.CHATROOM_ID
  in (select pc1.chatroom_id from PARTICIPANT_CHATROOM pc1
    join USERS u1 on u1.LOGIN = 'a.s.spitsin'
     where pc1.USER_ID = u1.ID)));

insert into MESSAGE(id, time_created, text, participant_chatroom_user_id, chatroom_id)
values (MESSAGE_SEQ.nextval, current_date,'Привет', (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'),
        (select pc.chatroom_id from PARTICIPANT_CHATROOM pc
    join USERS u on u.LOGIN = 'a.s.spitsin'
    join CHATROOM chat on chat.CREATOR_ID is null
where (pc.USER_ID = u.ID) and (pc.CHATROOM_ID = chat.ID)
  and pc.CHATROOM_ID
  in (select pc1.chatroom_id from PARTICIPANT_CHATROOM pc1
    join USERS u1 on u1.LOGIN = 'dm.ol.ershov'
     where pc1.USER_ID = u1.ID)));
--endMessage

--Community
insert into COMMUNITY(id, name, description, website, creator_id)
values (COMMUNITY_SEQ.nextval, 'Это мое превое сообщетсво', 'Описание сообщества', 'website', (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into COMMUNITY(id, name, website, creator_id)
values (COMMUNITY_SEQ.nextval, 'Это мое второе сообщество', 'website', (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into SUBSCRIBERS(user_id, community_id)
values ((select u.id from USERS u where u.LOGIN = 'a.s.spitsin'), (select c.id from COMMUNITY c where c.NAME = 'Это мое превое сообщетсво'));

insert into SUBSCRIBERS(user_id, community_id)
values ((select u.id from USERS u where u.LOGIN = 'a.s.spitsin'), (select c.id from COMMUNITY c where c.NAME = 'Это мое второе сообщество'));

insert into SUBSCRIBERS(user_id, community_id)
values ((select u.id from USERS u where u.LOGIN = 'i.i.ivanov'), (select c.id from COMMUNITY c where c.NAME = 'Это мое превое сообщетсво'));

insert into SUBSCRIBERS(user_id, community_id)
values ((select u.id from USERS u where u.LOGIN = 'i.s.plot'), (select c.id from COMMUNITY c where c.NAME = 'Это мое превое сообщетсво'));
--end_Community

--POSTS
insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id, community_id)
values (POSTS_SEQ.nextval, 'Певая публикация', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'),
        (select c.id from COMMUNITY c where c.NAME = 'Это мое превое сообщетсво'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id, community_id)
values (POSTS_SEQ.nextval, 'Вторая публикация', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'),
        (select c.id from COMMUNITY c where c.NAME = 'Это мое превое сообщетсво'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id, community_id)
values (POSTS_SEQ.nextval, 'Певая публикация', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'i.i.ivanov'),
        (select c.id from COMMUNITY c where c.NAME = 'Это мое превое сообщетсво'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id, community_id)
values (POSTS_SEQ.nextval, 'Певая публикация', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'),
        (select c.id from COMMUNITY c where c.NAME = 'Это мое второе сообщество'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id)
values (POSTS_SEQ.nextval, 'Это первый пост', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'i.i.ivanov'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id)
values (POSTS_SEQ.nextval, 'Это первый пост', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 't.s.strapchih'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id)
values (POSTS_SEQ.nextval, 'ВГУ', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id)
values (POSTS_SEQ.nextval, 'ВГУ Прекрасен', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id)
values (POSTS_SEQ.nextval, 'ПММ 50 лет', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'i.s.plot'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id)
values (POSTS_SEQ.nextval, 'ВГУ,', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id)
values (POSTS_SEQ.nextval, ',', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));

insert into POSTS(id, description, date_creation, likes_count, dislikes_count, reposts_count, creator_id)
values (POSTS_SEQ.nextval, '%', current_date, 0, 0, 0, (select u.id from USERS u where u.LOGIN = 'a.s.spitsin'));
--end_POSTS

commit;
