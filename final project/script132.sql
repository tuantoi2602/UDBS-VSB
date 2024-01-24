
CREATE TABLE address (
    id            INTEGER NOT NULL identity,
    address       VARCHAR(30) NOT NULL,
    postal_code   VARCHAR(10) NOT NULL,
);




ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY ( id );

CREATE TABLE brand (
    id            INTEGER NOT NULL identity,
    brand_name    VARCHAR(15) NOT NULL,
    description   VARCHAR(100)
);

ALTER TABLE brand ADD CONSTRAINT brand_pk PRIMARY KEY ( id );

CREATE TABLE comment (
    user_id     INTEGER NOT NULL,
    shoe_id     INTEGER NOT NULL,
    comment     VARCHAR(1000) NOT NULL
);

ALTER TABLE comment ADD CONSTRAINT comment_pk PRIMARY KEY ( shoe_id,
                                                              user_id );

CREATE TABLE shoe (
    id                INTEGER NOT NULL identity,
    name_of_product   VARCHAR(15) NOT NULL,
    description       VARCHAR(500),
    size_us           INTEGER NOT NULL,
    price             INTEGER NOT NULL,
    user_id           INTEGER NOT NULL,
    brand_id          INTEGER NOT NULL
);
ALTER TABLE shoe
ADD CONSTRAINT price CHECK (price > 0)

ALTER TABLE shoe
ADD CONSTRAINT size_us CHECK (size_us >= 4 and size_us <= 15)



ALTER TABLE shoe ADD CONSTRAINT shoe_pk PRIMARY KEY ( id );

CREATE TABLE transactions (
    user_id            INTEGER NOT NULL,
    shoe_id            INTEGER NOT NULL,
    price              INTEGER NOT NULL,
    transaction_date   DATETIME NOT NULL
);

ALTER TABLE transactions ADD CONSTRAINT transaction_pk PRIMARY KEY ( user_id,
                                                                    shoe_id );
ALTER TABLE transactions ADD DEFAULT (getdate()) FOR transaction_date

CREATE TABLE users (
    id           INTEGER NOT NULL identity,
    login        VARCHAR(10) NOT NULL,
    name         VARCHAR(10) NOT NULL,
    surname      VARCHAR(10) NOT NULL,
    address_id   INTEGER NOT NULL,
    telephone    VARCHAR(12) null,
    email        VARCHAR(30) NOT NULL,
    type         VARCHAR(10) NOT NULL
);

ALTER TABLE users
ADD CONSTRAINT type CHECK (type = 'admin' or type = 'seller' or type = 'customer')

ALTER TABLE  users ADD CONSTRAINT user_pk PRIMARY KEY ( id );

ALTER TABLE comment
    ADD CONSTRAINT comment_shoe_fk FOREIGN KEY ( shoe_id )
        REFERENCES shoe ( id );

ALTER TABLE comment
    ADD CONSTRAINT comment_user_fk FOREIGN KEY ( user_id )
        REFERENCES  users ( id );

ALTER TABLE shoe
    ADD CONSTRAINT shoe_brand_fk FOREIGN KEY ( brand_id )
        REFERENCES brand ( id );

ALTER TABLE shoe
    ADD CONSTRAINT shoe_user_fk FOREIGN KEY ( user_id )
        REFERENCES users ( id );

ALTER TABLE transactions
    ADD CONSTRAINT transaction_shoe_fk FOREIGN KEY ( shoe_id )
        REFERENCES shoe ( id );

ALTER TABLE transactions
    ADD CONSTRAINT transaction_user_fk FOREIGN KEY ( user_id )
        REFERENCES  users ( id );

ALTER TABLE  users
    ADD CONSTRAINT user_address_fk FOREIGN KEY ( address_id )
        REFERENCES address ( id );

insert into address values ('1770/1 Studentska', 70800);
insert into address values ('08 31F An Phu', 24451);
insert into address values ('47 MySakila Drive', 51731);
insert into address values ('270 Amroha Parkway',29610);
insert into address values ('770 Bydgoszcz Avenue',16266);
insert into address values ('419 Iligan Lane',72877);
insert into address values ('360 Toulouse Parkway',54308);
insert into address values ('270 Toulon Boulevard',81766);
insert into address values ('320 Brest Avenue',43331);
insert into address values ('1417 Lancaster Avenue',72192);
insert into address values ('1688 Okara Way',21954);
insert into address values ('262 A Corua (La Corua) Parkway',34418);
insert into address values ('28 Charlotte Amalie Street',37551);
insert into address values ('1780 Hino Boulevard',7716);
insert into address values ('96 Tafuna Way',99865);
insert into address values ('934 San Felipe Puerto Street',99708);
insert into address values ('18 Duisburg Boulevard',58327);
insert into address values ('217 Botshabelo Place',49521);
insert into address values ('1425 Shikarpur Manor',65599);
insert into address values ('786 Aurora Avenue',65750);
insert into address values ('1668 Anpolis Street',50199);
insert into address values ('33 Gorontalo Way',30348);
insert into address values ('176 Mandaluyong Place',65213);
insert into address values ('127 Purnea (Purnia) Manor',79388);
insert into address values ('61 Tama Street',94065);
insert into address values ('391 Callao Drive',34021);
insert into address values ('334 Munger (Monghyr) Lane',38145);
insert into address values ('1440 Fukuyama Loop',47929);
insert into address values ('269 Cam Ranh Parkway',34689);
insert into address values ('306 Antofagasta Place',3989);
insert into address values ('671 Graz Street',94399);
insert into address values ('42 Brindisi Place',16744);
insert into address values ('1632 Bislig Avenue',61117);
insert into address values ('1447 Imus Way',48942);
insert into address values ('1998 Halifax Drive',76022);
insert into address values ('1718 Valencia Street',37359);
insert into address values ('46 Pjatigorsk Lane',23616);
insert into address values ('686 Garland Manor',52535);
insert into address values ('909 Garland Manor',69367);
insert into address values ('725 Isesaki Place',74428);
insert into address values ('115 Hidalgo Parkway',80168);
insert into address values ('1135 Izumisano Parkway',48150);
insert into address values ('939 Probolinggo Loop',4166);
insert into address values ('17 Kabul Boulevard',38594);
insert into address values ('1964 Allappuzha Street',48980);
insert into address values ('1697 New Kowloon Loop',57870);
insert into address values ('1668 Saint Louis Place',39072);
insert into address values ('943 Tokat Street',45428);
insert into address values ('1114 Liepaja Street',69226);
insert into address values ('1213 Ranchi Parkway',94352);
insert into address values ('81 Hodeida Way',55561);
insert into address values ('915 Ponce Place',83980);
insert into address values ('1717 Guadalajara Lane',85505);
insert into address values ('1214 Hanoi Way',67055);
insert into address values ('57 Arlington Manor',48960);
insert into address values ('1031 Daugavpils Parkway',59025);
insert into address values ('1124 Buenaventura Drive',6856);
insert into address values ('89 Allappuzha (Alleppey) Manor',7544);
insert into address values ('320 Baiyin Parkway',37307);
insert into address values ('927 Baha Blanca Parkway',9495);
insert into address values ('929 Tallahassee Loop',74671);
insert into address values ('125 Citt delBoulevard',67912);
insert into address values ('1557 Ktahya Boulevard',88002);
insert into address values ('870 Ashqelon Loop',84931);
insert into address values ('1740 Portoviejo Avenue',29932);
insert into address values ('1942 Ciparay Parkway',82624);
insert into address values ('1926 El Alto Avenue',75543);
insert into address values ('1952 Chatsworth Drive',25958);
insert into address values ('1370 Le Mans Avenue',52163);
insert into address values ('984 Effon-Alaiye Avenue',17119);
insert into address values ('832 Nakhon Sawan Manor',49021);
insert into address values ('152 Kitwe Parkway',53182);
insert into address values ('1697 Tanauan Lane',22870);
insert into address values ('1599 Plock Drive',71986);
insert into address values ('669 Firozabad Loop',92265);
insert into address values ('588 Vila Velha Manor',51500);
insert into address values ('1913 Kamakura Place',97287);
insert into address values ('733 Mandaluyong Place',77459);
insert into address values ('659 Vaduz Drive',49708);
insert into address values ('1177 Jelets Way',3305);
insert into address values ('1532 Dzerzinsk Way',9599);
insert into address values ('1002 Ahmadnagar Manor',93026);
insert into address values ('682 Junan Way',30418);
insert into address values ('804 Elista Drive',61069);
insert into address values ('1378 Alvorada Avenue',75834);
insert into address values ('793 Cam Ranh Avenue',87056);
insert into address values ('442 Rae Bareli Place',24321);
insert into address values ('1107 Nakhon Sawan Avenue',75149);
insert into address values ('544 Malm Parkway',63502);
insert into address values ('1967 Sincelejo Place',73644);
insert into address values ('333 Goinia Way',78625);
insert into address values ('241 Mosul Lane',76157);
insert into address values ('211 Chiayi Drive',58186);
insert into address values ('1175 Tanauan Way',64615);
insert into address values ('117 Boa Vista Way',6804);
insert into address values ('848 Tafuna Manor',45142);
insert into address values ('569 Baicheng Lane',60304);
insert into address values ('1666 Qomsheh Drive',66255);
insert into address values ('801 Hagonoy Drive',8439);
insert into address values ('1050 Garden Grove Avenue',4999);
insert into address values ('1854 Tieli Street',1589);
insert into address values ('758 Junan Lane',82639);
insert into address values ('1752 So Leopoldo Parkway',14014);
insert into address values ('47 MySakila Drive', 51731);

insert into users values('ngu0120','Tuan','Nguyen',1,777642936,'ngu0120@vsb.cz','admin')
insert into users values('bui0016','Vu','Bui',2,0918972351,'bui0016@vsb.cz','admin')
insert into users values('thaguy85','Thanh','Nguyen',3,0933466123,'thanguyen85@gmail.com','customer')
insert into users values('thuynguyen','Thuy','Nguyen',4,777214913,'thuynguyen1@gmail.com','seller')
insert into users values('davidorl2','David','Authur',5,777612561,'davidorl2@gmail.com','customer')
insert into users values('johnson12','PATRICIA','JOHNSON',6,777193012,'PAT.JOHNSON@sakilacustomer.org','customer')
insert into users values('linda0821','LINDA','WILLIAMS',7,777091421,'LINDA.WILL@sakilacustomer.org','customer')
insert into users values('barbaba2','BARBARA','JONES',8,777281491,'BARBARA.JO@sakilacustomer.org','customer')
insert into users values('nhatbang1','BANG','NHAT',9,0930192341,'nhatbang1823@gmail.com','seller')
insert into users values('chaubui94','CHAU','BUI',10,0918294151,'chaubui94@gmail.com','seller')
insert into users values('thuyle491','THUY','LE',11,081451241,'thuyle491@gmail.com','customer')
insert into users values('longnguy29','LONG','NGUYEN',12,0939012491,'longnguyen29@gmail.com','customer')
insert into users values('jenifer21','JENNIFER','DAVIS',13,777691023,'jenifer.davis@gmail.com','customer')
insert into users values('andrea96','ANDREA','HENDERSON',14,908125135,'andrea.hender@gmail.com','customer')
insert into users values('irene99','IRENE','PRICE',15,908094184,'irene99@gmail.com','seller')
insert into users values('marilyn24','MARILYN','ROSS',16,908109391,'marilyn24@gmail.com','customer')
insert into users values('ruby019','RUBY','WASHINGTON',17,635910921,'RUBY@sakilacustomer.org','customer')
insert into users values('tinasim92','TINA','SIMMONS',18,777012912,'tina.simon@gmail.com','customer')
insert into users values('minhchau1','CHAU','NGUYEN',19,0189274192,'minh.chau@gmail.com','seller')
insert into users values('chu0097','Nghia','Chung',20,0129821941,'chu0097@vsb.cz','admin')
insert into users values('elaine2','ELAINE','STEVENS',21,7772157823,'elaine.steven@gmail.com','customer')
insert into users values('tucker912','MARJORIE','TUCKER',22,777192001,'tucker912@gmail.com','customer')
insert into users values('hunter931','CHARLOTTE','HUNTER',23,777102941,'hunter0812@gmail.com','customer')
insert into users values('monica092','MONICA','HICKS',24,777291381,'monica092@gmail.com','customer')
insert into users values('esther262','ESTHER','CRAWFORD',25,777219012,'esther262@gmail.com','seller')
insert into users values('pauline99','PAULINE','HENRY',26,940424192,'pauline99@gmail.com','customer')
insert into users values('emma1304','EMMA','BOYD',27,777501215,'emma.boyd1304@gmail.com','seller')
insert into users values('khanh091','KHANH','TRAN',28,0938123512,'khanhtran@gmail.com','customer')
insert into users values('linhlong32','LINH','VO',29,0120381923,'linhlong32@yahoo.com','customer')
insert into users values('nguyenli92','LI','NGUYEN',30,0120999128,'nguyenli92@outlook.com','customer')
insert into users values('mason0299','JUANITA','MASON',31,940192831,'mason.juanita@gmail.com','seller')
insert into users values('anita1289','ANITA','MORALES',32,777642991,'anita.morales@gmail.com','customer')
insert into users values('rhonda1299','RHONDA','KENNEDY',33,772321931,'rhonda1299@yahoo.com','customer')
insert into users values('hazel0291','HAZEL','WARREN',34,970021422,'hazel.warren@yahoo.com','customer')
insert into users values('amber0102','AMBER','DIXON',35,920102400,'amber.dixon@yahoo.com','seller')
insert into users values('eva0209','EVA','RAMOS',36,777518291,'eva.ramos@gmail.com','customer')
insert into users values('tra0087','HUY','TRAN',37,7773146712,'tra0087@vsb.cz','admin')
insert into users values('debbie124','DEBBIE','REYES',38,720491821,'debbie.reyes@gmail.com','seller')
insert into users values('april0478','APRIL','BURNS',39,777102934,'april.burns@outlook.com','customer')
insert into users values('clara9124','CLARA','SHAW',40,777129091,'clara.shaw@gmail.com','customer')
insert into users values('lucilie99','LUCILLE','HOLMES',41,940192412,'lucilie99@gmail.com','customer')
insert into users values('rice19012','JAMIE','RICE',42,420321999,'rice.james@gmail.com','customer')
insert into users values('joanne0902','JOANNE','ROBERTSON',43,777123941,'joanne@gmail.com','customer')
insert into users values('hunt98991','ELEANOR','HUNT',44,777291995,'eleanor.hunt@gmail.com','customer')
insert into users values('vale1299','VALERIE','BLACK',45,900193123,'valerie.black@gmail.com','customer')
insert into users values('daniels12','DANIELLE','DANIELS',46,900245123,'daniels120@gmail.com','customer')
insert into users values('megan0909','MEGAN','PALMER',47,777129401,'megan0909@gmail.com','customer')
insert into users values('alicia1283','ALICIA','MILLS',48,312031241,'alicia.mills@yahoo.com','customer')
insert into users values('suzanne42','SUZANNE','NICHOLS',49,777102931,'suzanne.nichols@outlook.com','customer')
insert into users values('pod291','PODAN','MEANE',50,777411921,'pod291@gmail.com','customer')
insert into users values('thanhthuy1','THUY','NGUYEN',51,420912841,'thanhthuy1@gmail.com','customer')
insert into users values('longnguyen','LONG','NGUYEN',52,093812385,'longnguyen12@gmail.com','customer')
insert into users values('tuyphan123','TUY','PHAN',53,091824151,'tuyphan123@gmail.com','customer')
insert into users values('michiele1','MICHELE','GRANT',54,777129481,'michiele1@gmail.com','customer')
insert into users values('gail1291','GAIL','KNIGHT',55,777192401,'gail1291@gmail.com','customer')
insert into users values('fuzetea12','FUZE','TEA',56,777128401,'fuzetea12@yahoo.com','seller')
insert into users values('mountain94','MOUNTAIN','DEW',57,777194012,'mountaindew@gmail.com','seller')
insert into users values('mirinda45','MIRIN','DA',58,777095125,'mirinda124@outlook.com','customer')
insert into users values('pepsi091','PEP','SI',59,420918251,'pepsi091@gmail.com','customer')
insert into users values('fanta0988','FAN','TA',60,420999813,'fanta0988@gmail.com','customer')
insert into users values('thaole912','THAO','LE',61,093814712,'thaole9123@gmail.com','customer')
insert into users values('thungo98','THU','NGO',62,0981731251,'thungo98@gmail.com','customer')
insert into users values('dales391','DALES','MATS',63,888752145,'dalesmats@yahoo.com','seller')
insert into users values('darlene980','DARLENE','ROSE',64,761491222,'darlene980@yahoo.com','customer')
insert into users values('veronica2','VERONICA','STONE',65,555712623,'veronica.stone@gmail.com','seller')
insert into users values('jill13051','JILL','HAWKINS',66,777980999,'jill.hawkins@outlook.com','customer')
insert into users values('erin0999','ERIN','DUNN',67,430985124,'erin.dunn099@gmail.com','customer')
insert into users values('perkins09','GERALDINE','PERKINS',68,777901821,'perkins09@gmail.com','customer')
insert into users values('lauren9912','LAUREN','HUDSON',69,777109281,'lauren.hudson9912@gmail.com','customer')
insert into users values('cathy9988','CATHY','SPENCER',70,777841995,'cathy.spencer@outlook.com','seller')
insert into users values('joann9000','JOANN','GARDNER',71,777412471,'joann.gardner@outlook.com','customer')
insert into users values('lynn9911','LYNN','PAYNE',72,887120491,'lynn.payne@gmail.com','customer')
insert into users values('sally1294','SALLY','PIERCE',73,777192049,'sally.pierce@gmail.com','customer')
insert into users values('regina1841','REGINA','BERRY',74,222948712,'regina.berry@gmail.com','customer')
insert into users values('ethica7777','ERICA','MATTHEWS',75,444821984,'erica.matthews@gmail.com','seller')
insert into users values('arnold1243','BEATRICE','ARNOLD',76,777918241,'arnold1243@gmail.com','customer')
insert into users values('longkhanh1','LONG','KHANH',77,093098124,'longkhanh941@gmail.com','customer')
insert into users values('khanhchi41','KHANH','CHI',78,091248151,'khanhchi4192@gmail.com','customer')
insert into users values('chipu294','CHI','PU',79,091284124,'chipu81274@gmail.com','seller')
insert into users values('wagner8102','DOLORES','WAGNER',80,918241241,'wargner8102@gmail.com','seller')
insert into users values('willis9','BERNICE','WILLIS',81,84124124,'willis9.9@gmail.com','customer')
insert into users values('john8145','JOHN','WICK',82,777109241,'john.wick99@gmail.com','customer')
insert into users values('audrey9481','AUDREY','RAY',83,777109231,'audrey.ray@gmail.com','customer')
insert into users values('katarina8','KATA','RINA',84,561244212,'katarina89@outlook.com','customer')
insert into users values('ezio8401','EZIO','PAZZIE',85,777192841,'ezio.pazzie@yahoo.com','customer')
insert into users values('antonio412','ANTONIO','PAZZIE',86,777981241,'antonio.pazzie412@gmail.com','customer')
insert into users values('jacopo2802','JACOPO','PAZZIE',87,777102931,'jacopo.pazzie2802@gmail.com','customer')
insert into users values('watkins11','YVONNE','WATKINS',88,7774124512,'watkins.yvonne@yahoo.com','customer')
insert into users values('yone8412','YONE','DOTMAN',89,420182414,'yone.dotman@yahoo.com','customer')
insert into users values('kinhthanh4','KINH','THANH',90,642132123,'kinh.thanh@yahoo.com.vn','seller')
insert into users values('annette','ANNETTE','OLSON',91,777912412,'annette.olson@gmail.com','seller')
insert into users values('june94','JUNE','CARROLL',92,777129412,'june94@gmail.com','customer')
insert into users values('kindred82','KIND','RED',93,777019241,'kindred992@gmail.com','seller')
insert into users values('samatha91','SAMANTHA','DUNCAN',94,777109241,'samatha91@gmail.com','customer')
insert into users values('marion924','MARION','SNYDER',95,901412444,'marion.snyder@outlook.com','seller')
insert into users values('jinx9241','JINX','MATTHEWS',96,'','jinx9241@gmail.com','seller')
insert into users values('garren3443','GARREN','WAGNER',97,777109231,'garren.wagner@gmail.com','customer')
insert into users values('danaHart24','DANA','HART',98,640918241,'danaHart24@gmail.com','customer')
insert into users values('ana090912','ANA','BRADLEY',99,'','ana090912@yahoo.com','seller')
insert into users values('loretta12','LORETTA','CARPENTER',100,777912410,'loretta241@gmail.com','seller')

insert into brand values('NIKE','The company was founded on January 25, 1964, as "Blue Ribbon Sports"')
insert into brand values('ADDIAS','The company was started by Adolf Dassler in his mothers house')
insert into brand values('BITIS','Bitis (full name: Binh Tien Consumer Goods Manufacturing Company)')
insert into brand values('VANS','Vans is an American manufacturer of skateboarding shoes')
insert into brand values('PUMA','Puma SE, branded as Puma, is a German multinational corporation')
insert into brand values('NEW BALANCE','New Balance (NB) is an American sports footwear and apparel brand that was established in 1906.')
insert into brand values('FILA','Fila Holdings Corp. (d/b/a Fila) is a sportswear manufacturer ')
insert into brand values('CONVERSE','Converse /ˈkɒnvərs/ is an American shoe company that designs, distributes, and licenses sneakers')
insert into brand values('REEBOK','Reebok International Limited (/ˈriːbɒk/) is a British footwear and clothing company')
insert into brand values('ASICS','Asics (アシックス, Ashikkusu) is a Japanese multinational corporation')

insert into shoe values('Air Max 97','Black Green',10,200,24,1)
insert into shoe values('Air Max 97','Red Blue',12,210,30,1)
insert into shoe values('Air Max 950','Black',12,400,32,1)
insert into shoe values('Air Max 98','White',10,380,24,1)
insert into shoe values('Kyrie 7','Black Green',8,130,75,1)
insert into shoe values('Kyrie 6','Green',9,180,7,1)
insert into shoe values('Space Hippie 04','',10,200,14,1)
insert into shoe values('Air Tranier 3','White-Green-Grey',10,120,24,1)
insert into shoe values('Zm 950','White-Chile-Red',5,250,38,1)
insert into shoe values('Tuned 1','Wolf-Grey',13,230,27,1)
insert into shoe values('X9000 L4','Black-Greysix',15,150,25,2)
insert into shoe values('Superstar','Red',11,240,56,2)
insert into shoe values('Superstar','Green',11,230,56,2)
insert into shoe values('Stan Smith','Flower',13,240,90,2)
insert into shoe values('Hardcourt','Grade School Shoes',7,220,80,2)
insert into shoe values('Stan Smith','Women Shoe',6,140,4,2)
insert into shoe values('Soko Runner','Women Shoe',6,100,4,2)
insert into shoe values('Stan Smith','Vegan White-Green',10,130,63,2)
insert into shoe values('ZX 2K BOOST','Solar-Red',9,200,56,2)
insert into shoe values('X9000 4D','Grey Three',10,240,99,2)
insert into shoe values('Hunter Tonic','DSMH03400CAM',10,100,91,3)
insert into shoe values('Hunter Tonic','DSMH03400CAM',14,100,91,3)
insert into shoe values('Hunter X Matcha','DSMH03400XMN',12,130,96,3)
insert into shoe values('Hunter Street','Mid Kumquat Soda',10,60,79,3)
insert into shoe values('Hunter Football','DSMH03800DOO',9,50,75,3)
insert into shoe values('Street Vietmax','DSMH02504XNG',7,40,70,3)
insert into shoe values('Bitis Sport','DSM072033XDG',8,50,63,3)
insert into shoe values('HiphopVietMax','Vietnamese Canvas of Pride',10,60,57,3)
insert into shoe values('Dentsu Redder','Vietnamese Canvas of Pride ',10,65,99,3)
insert into shoe values('Colorblock','DSMH01201XAM',12,45,100,3)
insert into shoe values('Sk8 Hi','Black-White',10,100,65,4)
insert into shoe values('Sk8 Hi Zip Glow','Black-Multicolor',9,90,90,4)
insert into shoe values('Old Skool','Black-Multicolor',8,120,4,4)
insert into shoe values('Era Flame','White-Orange',7,100,15,4)
insert into shoe values('Ultrarange Exo','Deep-Blue-White',9,150,75,4)
insert into shoe values('Sk8 Hi Leopard','Leopard-Black-White',8,120,38,4)
insert into shoe values('Sk8 Hi Platform','Checkboard-White-Black',12,100,19,4)
insert into shoe values('ComfyCush Era','Black-White-Purple',8,110,10,4)
insert into shoe values('Slip-on','Black-Black-White',7,140,25,4)
insert into shoe values('Sid Ni','White-Black-Black',12,170,63,4)
insert into shoe values('Future Rider','Super Mario',9,100,10,5)
insert into shoe values('CA PRO','Black-White-Black',12,90,100,5)
insert into shoe values('Cruise Rider','Pink Lady-Yellow',7,90,56,5)
insert into shoe values('Street Rider','Black-Yellow-Blue',6,90,35,5)
insert into shoe values('Cali Sport','White-Pink',7,95,80,5)
insert into shoe values('Suede','Red-White-Red',10,110,38,5)
insert into shoe values('Kyron','Quarry-Nimbus',9,92,25,5)
insert into shoe values('RS-2K','White-Black-White',8,140,57,5)
insert into shoe values('Future Rider','Green-Purple-Red',10,240,70,5)
insert into shoe values('Pulsar Wedge','Luminus Pink-Fizzy',11,130,4,5)
insert into shoe values('Vision Racer','White-Grey-Red',10,110,35,6)
insert into shoe values('393','Blue-Red-Grey',11,95,4,6)
insert into shoe values('327','Mustard Light-Green',11,110,70,6)
insert into shoe values('373','Black-White-Silver',13,130,79,6)
insert into shoe values('393','Grey-Blue-Red',6,110,19,6)
insert into shoe values('574','Grey-Orange-White',14,95,95,6)
insert into shoe values('850','Smoked Salt-Lemon',10,100,80,6)
insert into shoe values('850','Black-Silver-Pink',7,110,99,6)
insert into shoe values('574','Black-White',10,40,100,6)
insert into shoe values('997','Grey-Orange-White',12,110,27,6)
insert into shoe values('Luminance','White-Automic',11,100,35,7)
insert into shoe values('Oakmont','White-Blue-Red',10,200,19,7)
insert into shoe values('Deformation','White-Navy-Red',9,90,80,7)
insert into shoe values('Disruptor','White-Volt-Orange',8,80,99,7)
insert into shoe values('Trigate',  'White-Red-Blue',7,100,95,7)
insert into shoe values('Chuck 70','Lemon Venom',9,90,93,8)
insert into shoe values('All Star','Street Boot',6,101,91,8)
insert into shoe values('Leather X Bugs','Beige/tan-Beige',7,110,90,8)
insert into shoe values('Chuck Taylor','All Star Bugs Bunny',8,90,79,8)
insert into shoe values('Pro Leather X2','Egret-University',9,110,75,8)
insert into shoe values('Legacy 83','Yellow-Bronze-Black',10,100,70,9)
insert into shoe values('Club C X','White-Black-White',11,110,65,9)
insert into shoe values('Club C Double','Cardi B',12,120,63,9)
insert into shoe values('CL Legacy','Red-Gold-White',13,100,57,9)
insert into shoe values('Legacy 83','Yellow-Grey-Pink',14,90,56,9)
insert into shoe values('Gel Citrek','Black-Saffon',13,100,38,10)
insert into shoe values('Quantum 180','Black-Grey-silver',12,90,35,10)
insert into shoe values('Quantum 360','Blue-White-Orange',11,100,31,10)
insert into shoe values('Japan S','White-Blue-Red',10,110,27,10)
insert into shoe values('Gel Diablo','Black-Carbon-White',9,90,25,10)


insert into comment values(4,16,'You should to buy it')
insert into comment values(3,16,'Its expansive')
insert into comment values(17,34,'WOW, Its great')
insert into comment values(15,34,'You can buy it right now :)')
insert into comment values(15,16,' ')
insert into comment values(39,10,'So cheap')
insert into comment values(42,10,' ')
insert into comment values(36,10,'Yeah! Very cheap')
insert into comment values(17,10,'Hey! Seller, I want to buy it')
insert into comment values(33,10,'Wait for me')
insert into comment values(27,10,'Everyone! Keep Calm^^')
insert into comment values(44,66,'Can you discount for me?')
insert into comment values(93,66,'No,sir. ')
insert into comment values(77,66,'Why discount? I will buy it!')
insert into comment values(92,41,'I ordered this good. When I have this?')
insert into comment values(10,41,'Yeah,tommorow,you will have this')
insert into comment values(42,41,' ')
insert into comment values(97,41,'Belive him, shipper will send you the package :)')
insert into comment values(63,40,'You should to buy it')
insert into comment values(11,40,'Its expansive')
insert into comment values(52,11,'Can you discount for me?')
insert into comment values(25,11,'No,sir. ')
insert into comment values(42,11,' ')
insert into comment values(41,11,'Why discount? I will buy it!')

insert into transactions (user_id,shoe_id,price) values(3,36,120)
insert into transactions (user_id,shoe_id,price) values(97,66,90)
insert into transactions (user_id,shoe_id,price) values(14,46,110)
insert into transactions (user_id,shoe_id,price) values(8,27,50)
insert into transactions (user_id,shoe_id,price) values(14,73,120)
insert into transactions (user_id,shoe_id,price) values(71,18,130)
insert into transactions (user_id,shoe_id,price) values(11,59,40)
insert into transactions (user_id,shoe_id,price) values(49,30,45)
insert into transactions (user_id,shoe_id,price) values(81,14,240)
insert into transactions (user_id,shoe_id,price) values(69,32,90)
insert into transactions (user_id,shoe_id,price) values(50,68,110)
insert into transactions (user_id,shoe_id,price) values(44,26,40)
insert into transactions (user_id,shoe_id,price) values(21,49,240)
insert into transactions (user_id,shoe_id,price) values(5,71,100)
insert into transactions (user_id,shoe_id,price) values(92,28,60)
insert into transactions (user_id,shoe_id,price) values(86,74,100)
insert into transactions (user_id,shoe_id,price) values(72,48,140)
insert into transactions (user_id,shoe_id,price) values(22,77,90)
insert into transactions (user_id,shoe_id,price) values(74,51,110)
insert into transactions (user_id,shoe_id,price) values(82,44,90)
insert into transactions (user_id,shoe_id,price) values(98,61,100)
insert into transactions (user_id,shoe_id,price) values(8,53,240)
insert into transactions (user_id,shoe_id,price) values(14,71,100)

--1
select * from shoe
where price = (select max(price) from shoe)

select * from shoe
where price = (select min(price) from shoe)


select * from shoe
where price = (select min(price)from shoe)
order by id asc

select * from shoe
where price = (select min(price)from shoe)
order by id desc

--2
select * from shoe
where size_us = 10 and (price = 120 or price = 110 )

select * from brand
where brand_name not in ('NIKE','BITIS','FILA')

select * from shoe
where name_of_product LIKE ('AIR%')

  

--5
select shoe.id, (
    select count(*) 
    from transactions
    where transactions.shoe_id = shoe.id
    )as brands 
from shoe


