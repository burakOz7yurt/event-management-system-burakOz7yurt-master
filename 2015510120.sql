Create table tbl_category(
"category_id" int,
"category_name" varchar(30),
"event_count" int DEFAULT 0,
CONSTRAINT "pk_category_id" PRIMARY KEY("category_id")
);

Create table tbl_member(
"member_name" varchar(50) ,
"member_surname" varchar(50),
"member_user_name" varchar(50) NOT NULL,
"member_password" varchar(50),
"member_birth_date" date,
"e_mail" varchar(50),
"pointer" int DEFAULT 0,
"paid" int DEFAULT 0,
"event_number" int DEFAULT 0,
"member_ship" varchar(10) DEFAULT 'standart',

CONSTRAINT "pk_member_user_name" PRIMARY KEY("member_user_name")
);
Create table tbl_events(
"event_name"  varchar(50),
"event_adress" varchar(100),
"country" varchar(30),
"event_city" varchar(30),
"event_start_date" date,
"event_end_date" date,
"event_price" int,
"quoto_of_attendents" int ,
"member_user_name" varchar(50),
"discount_rate" double precision DEFAULT 0,   /*one of campaign informations*/
"category_id" int ,
CONSTRAINT "tbl_invoice_member_user_name_fkey" FOREIGN KEY ("member_user_name")
      REFERENCES tbl_member (member_user_name),
CONSTRAINT "tbl_invoice_category_id_fkey" FOREIGN KEY ("category_id")
      REFERENCES tbl_category (category_id),
/*"category" tbl_category,*//*şimdilik taloları bağlamak istemedim*/
CONSTRAINT "pk_event_name" PRIMARY KEY("event_name")
 );
Create table tbl_invoice(
"invo_id" varchar(30),
"events_name" varchar(50),
"date" date,
"location" varchar(50),
/*//yaptık düzenlemeler bitince aç
    CONSTRAINT "tbl_invoice_eventsName_fkey" FOREIGN KEY ("eventsName")
      REFERENCES tbl_events (name),*/
"amount_of_payment" double precision,
 "member_user_name"  varchar(50),
CONSTRAINT "pk_invo_id" PRIMARY KEY("invo_id"),

 CONSTRAINT "tbl_invoice_member_user_name_fkey" FOREIGN KEY ("member_user_name")
      REFERENCES tbl_member (member_user_name)
 );


Create table tbl_organizator(
"user_name" varchar(50),
"password" varchar(50),
CONSTRAINT "pk_user_name" PRIMARY KEY("user_name")
);

Create table tbl_organization(
"organization_name" varchar(50),
"organization_address" varchar(100),
"charged_personel" varchar(50),/*for charged personel*/
"organization_phone" varchar(30),
"e_mail" varchar(50),
CONSTRAINT "pk_organization_name" PRIMARY KEY("organization_name")
);
/*create type memberShip_a as enum('standart','gold');*/


insert into tbl_category("category_id","category_name") values(123,'category1');
insert into tbl_category("category_id","category_name") values(124,'category2');
insert into tbl_category("category_id","category_name") values(125,'category3');

insert into tbl_member("member_name","member_surname","member_user_name","member_password","member_birth_date","e_mail","pointer","paid","event_number")
values('burak','öz','burakoz','asd','12/05/1996','burak@gmail.com',1,305080,3);
insert into tbl_member("member_name","member_surname","member_user_name","member_password","member_birth_date","e_mail","pointer","paid","event_number")
values('enes','öz','enesoz','asd','12/05/2005','enes@gmail.com',1,225100,2);
insert into tbl_member("member_name","member_surname","member_user_name","member_password","member_birth_date","e_mail")
values('emre','öz','emreoz','asd','12/05/2001','emre@gmail.com');

insert into tbl_events("event_name","event_adress","country","event_city","event_start_date","event_end_date","event_price","category_id","member_user_name")
values('event1','adress1','Turkey','istanbul','12/05/2015','15/09/2015',100000,123,'burakoz');
insert into tbl_events("event_name","event_adress","country","event_city","event_start_date","event_end_date","event_price","category_id","member_user_name")
values('event2','adress45','Turkey','izmir','19/03/2015','15/09/2015',100080,123,'burakoz');
insert into tbl_events("event_name","event_adress","country","event_city","event_start_date","event_end_date","event_price","category_id","member_user_name")
values('event3','adress2','Germany','berlin','12/05/2016','15/09/2016',105000,123,'burakoz');
insert into tbl_events("event_name","event_adress","country","event_city","event_start_date","event_end_date","event_price","category_id","member_user_name")
values('event4','adress3','Netherlands','amsterdam','12/05/2018','15/09/2019',100020,124,'enesoz');
insert into tbl_events("event_name","event_adress","country","event_city","event_start_date","event_end_date","event_price","category_id","member_user_name")
values('event5','adress25','Turkey','izmir','19/03/2015','15/06/2015',125080,125,'enesoz');

insert into tbl_invoice("invo_id","events_name","date","location","amount_of_payment","member_user_name")
values('1','event1','12/02/2019','location1',1020,'burakoz');
insert into tbl_invoice("invo_id","events_name","date","location","amount_of_payment","member_user_name")
values('2','event2','12/03/2019','location2',1030,'burakoz');
insert into tbl_invoice("invo_id","events_name","date","location","amount_of_payment","member_user_name")
values('3','event3','12/04/2019','location3',1040,'burakoz');
insert into tbl_invoice("invo_id","events_name","date","location","amount_of_payment","member_user_name")
values('4','event3','12/04/2019','location3',1040,'enesoz');
insert into tbl_invoice("invo_id","events_name","date","location","amount_of_payment","member_user_name")
values('5','event3','12/04/2019','location3',1040,'enesoz');

insert into tbl_organization("organization_name","organization_address","charged_personel","organization_phone","e_mail")
values('organisation1','istanbul/kartal','fatih','08521556','yaman@gmail.com');
insert into tbl_organization("organization_name","organization_address","charged_personel","organization_phone","e_mail")
values('organisation2','manisa/turgutlu','samet','520155462','asfjaf@gmail.com');
insert into tbl_organization("organization_name","organization_address","charged_personel","organization_phone","e_mail")
values('organisation3','izmir/buca','levent','0248565485','okula@gmail.com');

insert into tbl_organizator("user_name","password")
values('taner','qwe');
insert into tbl_organizator("user_name","password")
values('kenan','asd');
insert into tbl_organizator("user_name","password")
values('ferit','fgh');


/*QUERY 1*/
SELECT * FROM tbl_events  WHERE event_city LIKE 'izmir%';


 /*QUERY 3*/
SELECT category_id ,COUNT(*) FROM tbl_events GROUP BY category_id ORDER BY COUNT(*) DESC;

/*QUERY 5*/
SELECT * FROM tbl_member WHERE event_number<3;

/*QUERY 6*/
UPDATE tbl_member SET member_ship='gold' WHERE event_number>3 OR event_number=3;
SELECT * FROM tbl_member WHERE event_number>3 OR event_number=3;

/*QUERY 9*/
UPDATE tbl_events SET discount_rate = 25 WHERE event_city LIKE 'i%';
SELECT * FROM tbl_events;

/*QUERY 10*/
DELETE FROM tbl_member WHERE pointer=0;
SELECT * FROM tbl_member;




  