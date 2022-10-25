create table COUNTRY(
    id number primary key,
    name nvarchar2(60) unique not null
);
create table REGION(
    id number primary key ,
    name nvarchar2(60) unique not null,
    country_id number not null
);
create table CITY(
    id number primary key ,
    name nvarchar2(60) unique not null ,
    region_id number not null
);
create table STREET(
    id number primary key ,
    name nvarchar2(60) not null ,
    city_id number not null
);
create table UNIVERSITY(
    id number primary key ,
    name nvarchar2(60) unique not null ,
    street_id number
);
create table FACULTY(
    id number primary key ,
    name nvarchar2(60) not null ,
    university_id number not null
);
create table SPECIALIZATION(
    id number primary key,
    name nvarchar2(60) not null ,
    faculty_id number not null
);
create table SCHOOL(
    id number primary key ,
    name nvarchar2(60) not null ,
    street_id number not null
);
create table PLACE_OF_STUDY_SCHOOL(
    id number primary key ,
    school_id number not null ,
    start_education date not null ,
    end_education date,
    number_of_class nchar(1) not null ,
    specialization nvarchar2(255) ,
    user_id number not null
);
create table PLACE_OF_WORK(
    id number primary key ,
    start_work date not null ,
    end_work date,
    name nvarchar2(255) not null ,
    post nvarchar2(255) not null ,
    street_id number not null,
    user_id number not null
);
create table PLACE_OF_STUDY_UNIVERSITY(
    id number primary key ,
    start_education date not null ,
    end_education date,
    specialization_id number not null ,
    form_education_id number not null ,
    status_of_education_id number not null ,
    user_id number not null
);
create table STATUS_OF_EDUCATION(
    id number primary key ,
    name nvarchar2(40) unique not null
);
create table FORM_EDUCATION(
    id number primary key ,
    name nvarchar2(20) unique not null
);
create table STATUS(
    id number primary key ,
    name nvarchar2(20) unique not null
);
create table STATUS_USER(
    status_id number not null ,
    user_id number not null
);
create table LANGUAGES(
    id number primary key ,
    name nvarchar2(20) not null
);
create table LANGUAGES_USER(
    languages_id number not null ,
    user_id number not null
);
create table INTERESTS(
    id number primary key ,
    user_id number not null,
    activity nvarchar2(255),
    interests nvarchar2(255),
    like_music nvarchar2(255),
    like_films nvarchar2(255),
    like_shows nvarchar2(255),
    like_books nvarchar2(255),
    lime_games nvarchar2(255),
    like_quote nvarchar2(255),
    about_me nvarchar2(255)
);
create table GENDER(
    id number primary key ,
    name nvarchar2(20) unique not null
);
create table FRIENDS(
    user_id number not null ,
    friend_id number not null,
    time date not null,
    status number not null
            check ( status >= 1 and status <= 3 )
);
create table USERS(
    id number primary key ,
    name nvarchar2(20) not null ,
    surname nvarchar2(20) not null ,
    patronymic nvarchar2(20) ,
    email nvarchar2(40) not null unique ,
    password nvarchar2(255) not null ,
    login nvarchar2(50) not null unique ,
    date_birthday date,
    last_online date,
    phone_number nchar(11) not null unique ,
    additional_phone_number nchar(11),
    link nvarchar2(255),
    interests_id number,
    city_id number,
    gender_id number
);
create table MESSAGE(
    id number primary key ,
    is_read  number(1) DEFAULT 1 not null ,
    time_created date not null,
    text nvarchar2(255) not null,
    message_id number,
    participant_chatroom_user_id number not null ,
    chatroom_id number not null
);
create table PARTICIPANT_CHATROOM(
    user_id number not null ,
    chatroom_id number not null
);
create table CHATROOM(
    id number primary key ,
    name nvarchar2(255) not null,
    avatar nvarchar2(255) not null ,
    creator_id number ,
    community_id number
);
create table REPOSTS(
    user_id number not null ,
    posts_id number not null
);
create table LIKES_POSTS(
    user_id number not null ,
    posts_id number not null
);
create table DISLIKES_POSTS(
    user_id number not null ,
    posts_id number not null
);
create table FILES_POSTS(
    files_id number not null ,
    posts_id number not null
);
create table SUBSCRIBERS(
    user_id number not null ,
    community_id number not null
);
create table DISCUSSIONS(
    id number primary key ,
    name nvarchar2(255) not null ,
    community_id number not null
);
create table COMMUNITY(
    id number primary key ,
    name nvarchar2(255) not null unique ,
    description nvarchar2(255) ,
    website nvarchar2(255),
    creator_id number not null
);
create table POSTS(
    id number primary key ,
    description nvarchar2(255) not null ,
    date_creation date not null,
    likes_count number not null
        check ( likes_count >= 0 ),
    dislikes_count number not null
        check ( dislikes_count >= 0 ),
    reposts_count number not null
        check ( reposts_count >= 0 ),
    creator_id number not null ,
    community_id number
);
create table FILES(
    id number primary key ,
    content_file nvarchar2(255) not null unique ,
    type_file_id number not null ,
    message_id number
);
create table TAGS(
    id number primary key ,
    name nvarchar2(20) not null unique
);
create table FILE_PHOTO_VIDEO_TAGS(
    file_photo_video_id number not null ,
    tags_id number not null
);
create table FILE_PHOTO_VIDEO(
    id number primary key ,
    description nvarchar2(255),
    date_creation date not null,
    albums_id number not null ,
    likes_count number not null
        check ( likes_count >= 0 ),
    dislikes_count number not null
        check ( dislikes_count >= 0 ),
    files_id number not null
);
create table COMMENTS(
    id number primary key ,
    text nvarchar2(255) not null ,
    date_creation date not null ,
    likes_count number not null
        check ( likes_count >= 0 ),
    dislikes_count number not null
        check ( dislikes_count >= 0 ),
    comments_id number,
    file_id number,
    creator_id number not null ,
    posts_id number,
    discussions_id number
);
create table LIKES_FILES(
    user_id number not null ,
    file_photo_video_id number not null
);
create table DISLIKE_FILES(
    user_id number not null ,
    file_photo_video_id number not null
);
create table LIKES_COMMENTS(
    user_id number not null ,
    comments_id number not null
);
create table DISLIKES_COMMENTS(
    user_id number not null ,
    comments_id number not null
);
create table LIKES_MUSIC_FILE(
    user_id number not null ,
    music_file_id number not null
);
create table  DISLIKES_MUSIC_FILE(
    user_id number not null ,
    music_file_id number not null
);
create table MUSIC_FILE(
    id number primary key ,
    date_creation date,
    likes_count number not null
        check ( likes_count >= 0 ),
    dislikes_count number not null
        check ( dislikes_count >= 0 ),
    user_id number not null ,
    files_id number not null
);
create table MUSIC_LIST_MUSIC_FILE(
    music_file_id number not null ,
    music_list_id number not null
);
create table TYPE_FILE(
    id number primary key ,
    name nvarchar2(50) not null unique
);
create table ALBUMS(
    id number primary key ,
    name nvarchar2(255) not null unique ,
    date_creation date not null,
    user_id number not null ,
    type_file_id number not null ,
    community_id number
);
create table DISLIKES_MUSIC_LIST(
    user_id number not null ,
    music_list_id number not null
);
create table LIKES_MUSIC_LIST(
    user_id number not null ,
    music_list_id number not null
);
create table MUSIC_LIST(
    id number primary key ,
    name nvarchar2(255) not null unique ,
    date_creation date not null,
    user_id number not null ,
    community_id number,
    likes_count number not null
        check ( likes_count >= 0 ),
    dislikes_count number not null
        check ( dislikes_count >= 0 )
);
alter table REGION
add constraint country_id_fk foreign key(country_id) references COUNTRY(id) on delete cascade ;

alter table CITY
add constraint region_id_fk foreign key(region_id) references REGION(id) on delete cascade ;

alter table STREET
add constraint city_id_fk foreign key(city_id) references CITY(id) on delete cascade ;

alter table UNIVERSITY
add constraint street_university_id_fk foreign key(street_id) references STREET(id) on delete set null ;

alter table FACULTY
add constraint university_id_fk foreign key(university_id) references UNIVERSITY(id) on delete cascade ;

alter table SPECIALIZATION
add constraint faculty_id_fk foreign key (faculty_id) references FACULTY(id) on delete cascade ;

alter table PLACE_OF_STUDY_SCHOOL
add constraint school_place_of_study_school_id_fk foreign key (school_id) references SCHOOL(id) on delete cascade ;

alter table PLACE_OF_STUDY_SCHOOL
add constraint user_place_of_study_school_id_fk foreign key(user_id) references USERS(id) on delete cascade ;

alter table PLACE_OF_STUDY_SCHOOL
add constraint place_of_study_school_check check (start_education < end_education);

alter table PLACE_OF_WORK
add constraint street_place_of_study_id_fk foreign key(street_id) references STREET(id) on delete set null;

alter table PLACE_OF_WORK
add constraint user_place_of_study_id_fk foreign key(user_id) references USERS(id) on delete cascade;

alter table PLACE_OF_STUDY_UNIVERSITY
add constraint place_of_study_university_check check ( start_education < end_education );

alter table PLACE_OF_STUDY_UNIVERSITY
add constraint specialization_place_of_study_university_id_fk foreign key(specialization_id) references SPECIALIZATION(id) on delete set null;

alter table PLACE_OF_STUDY_UNIVERSITY
add constraint form_education_place_of_study_university_id_fk foreign key(form_education_id) references FORM_EDUCATION(id) on delete set null;

alter table PLACE_OF_STUDY_UNIVERSITY
add constraint status_of_education_place_of_study_university_id_fk foreign key (status_of_education_id) references STATUS_OF_EDUCATION(id) on delete set null;

alter table PLACE_OF_STUDY_UNIVERSITY
add constraint user_place_of_study_university_id_fk foreign key(user_id) references USERS(id) on delete cascade;

alter table STATUS_USER
add constraint status_user_pk primary key(status_id, user_id);

alter table LANGUAGES_USER
add constraint languages_user_pk primary key(languages_id, user_id);

alter table FRIENDS
add constraint friends_pk primary key(user_id, friend_id);

alter table FRIENDS
add constraint friends_id_check check ( user_id != friend_id );

alter table PARTICIPANT_CHATROOM
add constraint participant_chatroom_pk primary key (user_id, chatroom_id);

alter table MESSAGE
add constraint message_participant_chatroom_user_id_fk foreign key(participant_chatroom_user_id, chatroom_id) references PARTICIPANT_CHATROOM(user_id, chatroom_id) on delete set null;

alter table MESSAGE
add constraint message_id_fk foreign key(message_id) references MESSAGE(id) on delete cascade ;

alter table USERS
add constraint user_phones_check check ( phone_number != additional_phone_number);

alter table USERS
add constraint user_phone_length_check check ( LENGTH(PHONE_NUMBER) = 11 );

alter table INTERESTS
add constraint interests_user_id_fk foreign key (user_id) references USERS(id) on delete cascade ;

alter table USERS
add constraint user_city_id_fk foreign key(city_id) references CITY(id) on delete set null;

alter table USERS
add constraint user_gender_id_fk foreign key(gender_id) references GENDER(id) on delete set null;

alter table CHATROOM
add constraint chatroom_creator_id_fk foreign key(creator_id) references USERS(id) on delete set null;

alter table CHATROOM
add constraint chatroom_community_id_fk foreign key(community_id) references COMMUNITY(id) on delete cascade ;

alter table POSTS
add constraint posts_creator_id_fk foreign key(creator_id) references USERS(id) on delete set null ;

alter table POSTS
add constraint posts_community_id_fk foreign key(community_id) references COMMUNITY(id) on delete cascade ;

alter table COMMUNITY
add constraint community_creator_id_fk foreign key(creator_id) references USERS(id) on delete set null ;

alter table DISCUSSIONS
add constraint discussions_community_id_fk foreign key(community_id) references COMMUNITY(id) on delete cascade ;

alter table SUBSCRIBERS
add constraint subscribers_pk primary key (user_id, community_id);

alter table REPOSTS
add constraint reposts_pk primary key (user_id, posts_id);

alter table LIKES_POSTS
add constraint like_posts_pk primary key (user_id, posts_id);

alter table DISLIKES_POSTS
add constraint dislikes_posts_pk primary key (user_id, posts_id);

alter table FILES
add constraint file_type_file_id_fk foreign key (type_file_id) references TYPE_FILE(id) on delete set null ;

alter table FILES
add constraint file_message_id_fk foreign key (message_id) references MESSAGE(id) on delete set null ;

alter table COMMENTS
add constraint comments_id_fk foreign key (comments_id) references COMMENTS(id) on delete cascade ;

alter table COMMENTS
add constraint comments_file_id_fk foreign key (file_id) references FILES(id) on delete set null ;

alter table COMMENTS
add constraint comments_user_id_fk foreign key (creator_id) references USERS(id) on delete set null ;

alter table COMMENTS
add constraint comments_posts_id_fk foreign key (posts_id) references POSTS(id) on delete cascade ;

alter table COMMENTS
add constraint comments_discussions_id_fk foreign key (discussions_id) references DISCUSSIONS(id) on delete cascade ;

alter table LIKES_COMMENTS
add constraint likes_comments_id_pk primary key (user_id, comments_id);

alter table DISLIKES_COMMENTS
add constraint dislikes_comments_id_pk primary key (user_id, comments_id);

alter table FILE_PHOTO_VIDEO_TAGS
add constraint file_photo_video_tags_id_pk primary key (file_photo_video_id, tags_id);

alter table FILE_PHOTO_VIDEO
add constraint file_photo_video_albums_id_fk foreign key (albums_id) references ALBUMS(id) on delete cascade ;

alter table FILE_PHOTO_VIDEO
add constraint file_photo_video_file_id_fk foreign key (files_id) references FILES(id) on delete cascade ;

alter table LIKES_FILES
add constraint likes_files_id_pk primary key (file_photo_video_id, user_id);

alter table DISLIKE_FILES
add constraint dislikes_files_pk primary key (user_id, file_photo_video_id);

alter table ALBUMS
add constraint albums_user_id_fk foreign key (user_id) references USERS(id) on delete cascade ;

alter table ALBUMS
add constraint albums_type_file_id_fk foreign key (type_file_id) references TYPE_FILE(id) on delete set null ;

alter table ALBUMS
add constraint albums_community_id_fk foreign key (community_id) references COMMUNITY(id) on delete cascade ;

alter table MUSIC_FILE
add constraint music_file_user_id_fk foreign key (user_id) references USERS(id) on delete cascade ;

alter table MUSIC_FILE
add constraint music_file_file_id_fk foreign key (files_id) references FILES(id) on delete cascade ;

alter table LIKES_MUSIC_FILE
add constraint likes_music_file_pk primary key (user_id, music_file_id);

alter table DISLIKES_MUSIC_FILE
add constraint dislikes_music_file_pk primary key (user_id, music_file_id);

alter table MUSIC_LIST_MUSIC_FILE
add constraint music_list_music_file_pk primary key (music_file_id, music_list_id);

alter table DISLIKES_MUSIC_LIST
add constraint dislikes_music_list_pk primary key (user_id, music_list_id);

alter table LIKES_MUSIC_LIST
add constraint likes_music_list_pk primary key (user_id,music_list_id);

alter table MUSIC_LIST
add constraint music_list_user_id_fk foreign key (user_id) references USERS(id) on delete cascade ;

alter table MUSIC_LIST
add constraint music_list_community_id foreign key (community_id) references COMMUNITY(id) on delete cascade ;

create sequence COUNTRY_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence REGION_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence CITY_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence STREET_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence UNIVERSITY_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence FACULTY_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence SPECIALIZATION_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence PLACE_OF_STUDY_SCHOOL_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence PLACE_OF_STUDY_UNIVERSITY_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence PLACE_OF_WORK_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence STATUS_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence LANGUAGES_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence FORM_EDUCATION_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence STATUS_OF_EDUCATION_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence INTERESTS_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence GENDER_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence FRIENDS_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence MESSAGE_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence CHATROOM_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence POSTS_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence COMMUNITY_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence DISCUSSIONS_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence MUSIC_LIST_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence ALBUMS_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence MUSIC_FILE_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence TYPE_FILE_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence FILES_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence TAGS_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence FILE_PHOTO_VIDEO_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence COMMENTS_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence USERS_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;

create sequence SCHOOL_SEQ
    minvalue 1
    nomaxvalue
    start with 1
    increment by 1
    nocycle ;