-- Desactivar las restricciones de clave foránea (si es necesario)
-- No es necesario en PostgreSQL para este tipo de operaciones, pero si deseas desactivarlas puedes usar:
-- SET CONSTRAINTS ALL DEFERRED;

BEGIN;

-- Crear la tabla (en PostgreSQL usamos SERIAL en lugar de AUTOINCREMENT)
CREATE TABLE IF NOT EXISTS "django_migrations" (
    "id" SERIAL PRIMARY KEY,
    "app" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "applied" TIMESTAMP NOT NULL
);

-- Insertar los datos
INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES
(1, 'contenttypes', '0001_initial', '2024-08-13 14:57:47.220603'),
(2, 'auth', '0001_initial', '2024-08-13 14:57:47.262504'),
(3, 'admin', '0001_initial', '2024-08-13 14:57:47.296873'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-08-13 14:57:47.322962'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-13 14:57:47.339074'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-08-13 14:57:47.373114'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-08-13 14:57:47.402782'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-08-13 14:57:47.429590'),
(9, 'auth', '0004_alter_user_username_opts', '2024-08-13 14:57:47.445321'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-08-13 14:57:47.472086'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-08-13 14:57:47.481967'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-13 14:57:47.503861'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-08-13 14:57:47.534032'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-08-13 14:57:47.564883'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-08-13 14:57:47.593380'),
(16, 'auth', '0011_update_proxy_permissions', '2024-08-13 14:57:47.608059'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-08-13 14:57:47.633701'),
(18, 'payment', '0001_initial', '2024-08-13 14:57:47.647932'),
(19, 'sessions', '0001_initial', '2024-08-13 14:57:47.672061');

-- Crear la tabla "auth_group_permissions"
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
    "id" SERIAL PRIMARY KEY,
    "group_id" INTEGER NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED,
    "permission_id" INTEGER NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED
);

-- Crear la tabla "auth_user_groups"
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
    "id" SERIAL PRIMARY KEY,
    "user_id" INTEGER NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED,
    "group_id" INTEGER NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED
);

-- Crear la tabla "auth_user_user_permissions"
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
    "id" SERIAL PRIMARY KEY,
    "user_id" INTEGER NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED,
    "permission_id" INTEGER NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED
);

-- Crear la tabla "django_admin_log"
CREATE TABLE IF NOT EXISTS "django_admin_log" (
    "id" SERIAL PRIMARY KEY,
    "object_id" TEXT NULL,
    "object_repr" VARCHAR(200) NOT NULL,
    "action_flag" SMALLINT NOT NULL CHECK ("action_flag" >= 0),
    "change_message" TEXT NOT NULL,
    "content_type_id" INTEGER NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED,
    "user_id" INTEGER NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED,
    "action_time" TIMESTAMP NOT NULL
);

-- Crear la tabla "django_content_type"
CREATE TABLE IF NOT EXISTS "django_content_type" (
    "id" SERIAL PRIMARY KEY,
    "app_label" VARCHAR(100) NOT NULL,
    "model" VARCHAR(100) NOT NULL
);

-- Insertar datos en django_content_type
INSERT INTO "django_content_type" VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'payment', 'payment');

-- Insertar datos en "auth_permission"
INSERT INTO "auth_permission" ("id", "content_type_id", "codename", "name") VALUES
(1, 1, 'add_logentry', 'Can add log entry'),
(2, 1, 'change_logentry', 'Can change log entry'),
(3, 1, 'delete_logentry', 'Can delete log entry'),
(4, 1, 'view_logentry', 'Can view log entry'),
(5, 2, 'add_permission', 'Can add permission'),
(6, 2, 'change_permission', 'Can change permission'),
(7, 2, 'delete_permission', 'Can delete permission'),
(8, 2, 'view_permission', 'Can view permission'),
(9, 3, 'add_group', 'Can add group'),
(10, 3, 'change_group', 'Can change group'),
(11, 3, 'delete_group', 'Can delete group'),
(12, 3, 'view_group', 'Can view group'),
(13, 4, 'add_user', 'Can add user'),
(14, 4, 'change_user', 'Can change user'),
(15, 4, 'delete_user', 'Can delete user'),
(16, 4, 'view_user', 'Can view user'),
(17, 5, 'add_contenttype', 'Can add content type'),
(18, 5, 'change_contenttype', 'Can change content type'),
(19, 5, 'delete_contenttype', 'Can delete content type'),
(20, 5, 'view_contenttype', 'Can view content type'),
(21, 6, 'add_session', 'Can add session'),
(22, 6, 'change_session', 'Can change session'),
(23, 6, 'delete_session', 'Can delete session'),
(24, 6, 'view_session', 'Can view session'),
(25, 7, 'add_payment', 'Can add payment'),
(26, 7, 'change_payment', 'Can change payment'),
(27, 7, 'delete_payment', 'Can delete payment'),
(28, 7, 'view_payment', 'Can view payment');

-- Crear la tabla auth_permission
CREATE TABLE IF NOT EXISTS "auth_permission" (
  "id" SERIAL PRIMARY KEY, 
  "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, 
  "codename" varchar(100) NOT NULL, 
  "name" varchar(255) NOT NULL
);

-- Insertar datos en auth_permission
INSERT INTO "auth_permission" VALUES
(1, 1, 'add_logentry', 'Can add log entry'),
(2, 1, 'change_logentry', 'Can change log entry'),
(3, 1, 'delete_logentry', 'Can delete log entry'),
(4, 1, 'view_logentry', 'Can view log entry'),
(5, 2, 'add_permission', 'Can add permission'),
(6, 2, 'change_permission', 'Can change permission'),
(7, 2, 'delete_permission', 'Can delete permission'),
(8, 2, 'view_permission', 'Can view permission'),
(9, 3, 'add_group', 'Can add group'),
(10, 3, 'change_group', 'Can change group'),
(11, 3, 'delete_group', 'Can delete group'),
(12, 3, 'view_group', 'Can view group'),
(13, 4, 'add_user', 'Can add user'),
(14, 4, 'change_user', 'Can change user'),
(15, 4, 'delete_user', 'Can delete user'),
(16, 4, 'view_user', 'Can view user'),
(17, 5, 'add_contenttype', 'Can add content type'),
(18, 5, 'change_contenttype', 'Can change content type'),
(19, 5, 'delete_contenttype', 'Can delete content type'),
(20, 5, 'view_contenttype', 'Can view content type'),
(21, 6, 'add_session', 'Can add session'),
(22, 6, 'change_session', 'Can change session'),
(23, 6, 'delete_session', 'Can delete session'),
(24, 6, 'view_session', 'Can view session'),
(25, 7, 'add_payment', 'Can add payment'),
(26, 7, 'change_payment', 'Can change payment'),
(27, 7, 'delete_payment', 'Can delete payment'),
(28, 7, 'view_payment', 'Can view payment');

-- Crear la tabla auth_group
CREATE TABLE IF NOT EXISTS "auth_group" (
  "id" SERIAL PRIMARY KEY, 
  "name" varchar(150) NOT NULL UNIQUE
);

-- Crear la tabla auth_user
CREATE TABLE IF NOT EXISTS "auth_user" (
  "id" SERIAL PRIMARY KEY, 
  "password" varchar(128) NOT NULL, 
  "last_login" TIMESTAMP NULL, 
  "is_superuser" boolean NOT NULL, 
  "username" varchar(150) NOT NULL UNIQUE, 
  "last_name" varchar(150) NOT NULL, 
  "email" varchar(254) NOT NULL, 
  "is_staff" boolean NOT NULL, 
  "is_active" boolean NOT NULL, 
  "date_joined" TIMESTAMP NOT NULL, 
  "first_name" varchar(150) NOT NULL
);

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, email, is_staff, is_active, date_joined, date_of_birth) VALUES
(1, 'pbkdf2_sha256$600000$lv8LbCGf7ItmJf6311NOcs$N6B8FwfrgPNWBKaTHLsP4lo96NW7KeQMxplIov+LfYo=', '2024-08-13 14:58:14.044150', 1, 'admin', '', 'admin@zexel.io', 1, 1, '2024-08-13 14:57:53.521751', ''),
(2, 'pbkdf2_sha256$600000$A4kuYBoWFFAoCkK0grfuIG$UG1XAOU6UkQtmgKhn+t1pJ8U5BQiParn8G6RAv8G1o4=', NULL, 0, 'user0', '', 'user0@example.com', 0, 1, '2024-08-13 14:57:54.955890', ''),
(3, 'pbkdf2_sha256$600000$3pIN1o9TpfryA7EJhs5cPN$1w8W6k6irqvOthA/cxwuoBr/i9xjn03dLrWTXAWGvOo=', NULL, 0, 'user1', '', 'user1@example.com', 0, 1, '2024-08-13 14:57:55.316748', ''),
(4, 'pbkdf2_sha256$600000$UMFANaU50SrYUSiWzeqGT4$x9tTVSKx5E8NxNqdsL8VpbqjWzpIyUaz9o0QSOizUuo=', NULL, 0, 'user2', '', 'user2@example.com', 0, 1, '2024-08-13 14:57:55.672294', ''),
(5, 'pbkdf2_sha256$600000$E7UIZ7dgLzosffp0X6lLuj$IXMWu4i7AsMh+Muqt8p96GoCaEoff7HByuN9/eXaTwg=', NULL, 0, 'user3', '', 'user3@example.com', 0, 1, '2024-08-13 14:57:56.019250', ''),
(6, 'pbkdf2_sha256$600000$1ZwxRpY77ZwrLkkcyhMDUV$ByDTS3doo7LO+7iWUbDSfTYGK+QplVjYKpgrEEtzIJs=', NULL, 0, 'user4', '', 'user4@example.com', 0, 1, '2024-08-13 14:57:56.369228', ''),
(7, 'pbkdf2_sha256$600000$qFwYqeT83YxESYs1qgyyTP$7vMb7BwIWqMlsCoLlrZwq2C+i+N+EzYxJ4EFYyTbRqs=', NULL, 0, 'user5', '', 'user5@example.com', 0, 1, '2024-08-13 14:57:56.722797', ''),
(8, 'pbkdf2_sha256$600000$STCBLF6CYwuPqj7sxcEFFw$KbJepZpfY3J7WeEtsvdiOPgrIJk2rXzy819rwKGOlh8=', NULL, 0, 'user6', '', 'user6@example.com', 0, 1, '2024-08-13 14:57:57.085911', ''),
(9, 'pbkdf2_sha256$600000$GgZbFgulOxwdc3TdMvu6c5$APodBzSz9SbrOMB1FwPZ7+nJPMOAmdPYA2KSBkLPGN0=', NULL, 0, 'user7', '', 'user7@example.com', 0, 1, '2024-08-13 14:57:57.452655', ''),
(10, 'pbkdf2_sha256$600000$7lh2vvHL1t3afCMHMbr4Tx$o70zEEMxtCsb7ktnwa1gtOk8TOO4b8et7nRGquEjwhY=', NULL, 0, 'user8', '', 'user8@example.com', 0, 1, '2024-08-13 14:57:57.809423', ''),
(11, 'pbkdf2_sha256$600000$Gi15dcX0YlFw1ieiIIj4o1$sUGD5lDfQ01C0uCkzOcuRjCUSD3FOZZJ63QYRwBWN6g=', NULL, 0, 'user9', '', 'user9@example.com', 0, 1, '2024-08-13 14:57:58.182188', ''),
(12, 'pbkdf2_sha256$600000$5lMcdJAZRIKN5MRVnelycc$VC03s87mGS4QobSa5Ss20uYWRxsx/7bwSMO0xfsH1xg=', NULL, 0, 'user10', '', 'user10@example.com', 0, 1, '2024-08-13 14:57:58.528499', ''),
(13, 'pbkdf2_sha256$600000$mFxP25Tken5cFkCNS4Ehfm$0V2ggeazFp6zgAXXNPj/RTYHWakDc8bWrhpSUuYYusM=', NULL, 0, 'user11', '', 'user11@example.com', 0, 1, '2024-08-13 14:57:58.884469', ''),
(14, 'pbkdf2_sha256$600000$2Rhk99CFjjj6yTyXCNSAJc$DYhCL/toRyDt8grt24cTQ3oJfpt0I5NxYHMvx3555Vo=', NULL, 0, 'user12', '', 'user12@example.com', 0, 1, '2024-08-13 14:57:59.228380', ''),
(15, 'pbkdf2_sha256$600000$TOajtP2ULDKUIP8GDXnioH$/84/4C2jn4meF5qUrOviiIjcMB4RYOxEe3lDtZGP4Bs=', NULL, 0, 'user13', '', 'user13@example.com', 0, 1, '2024-08-13 14:57:59.579723', ''),
(16, 'pbkdf2_sha256$600000$0O2OxRfYUbgUedjoHEHr3l$S5e6XtXJlQ+v1+T14Iq0IrnknO2ifEu0ut2LZqNDzOE=', NULL, 0, 'user14', '', 'user14@example.com', 0, 1, '2024-08-13 14:57:59.918919', ''),
(17, 'pbkdf2_sha256$600000$VFe0mNvchB1rqwuZGnq4mF$LzXgMT4Jk93+MQITu3w15g2mwLobRGjIT6hoJNsTDZU=', NULL, 0, 'user15', '', 'user15@example.com', 0, 1, '2024-08-13 14:58:00.290472', ''),
(18, 'pbkdf2_sha256$600000$QqUardlqbNS2Im6TcGFkJ3$WRJ3NBRRI52/veG3S7MuXBfmFiWQmfxsS29qn/QAGZk=', NULL, 0, 'user16', '', 'user16@example.com', 0, 1, '2024-08-13 14:58:00.658171', ''),
(19, 'pbkdf2_sha256$600000$PlvXZGWziGBjLm3YZ0ZPhC$JMWeOWjdrG0VyecxBKPOjlp2nKBw5K/Qew3wZe2Ql80=', NULL, 0, 'user17', '', 'user17@example.com', 0, 1, '2024-08-13 14:58:01.002583', ''),
(20, 'pbkdf2_sha256$600000$mvUbwRNRhOe7x3cBORXoe3$7wANcL0A3ppXH3Di3DAA8+ThquGkdxxMgi+F7Ru+wBE=', NULL, 0, 'user18', '', 'user18@example.com', 0, 1, '2024-08-13 14:58:01.381856', ''),
(21, 'pbkdf2_sha256$600000$wS697tHG7mIC1R8TpKq8Bh$FH4LwQf6zx2Jphf1uMNrEP1eCe1pubUP0nS6gG67qgk=', NULL, 0, 'user19', '', 'user19@example.com', 0, 1, '2024-08-13 14:58:01.751652', '');

CREATE TABLE IF NOT EXISTS "payment_payment" (
    "id" char(32) NOT NULL PRIMARY KEY,
    "source_amount" decimal NOT NULL,
    "source_currency" varchar(20) NOT NULL,
    "source_country" varchar(20) NOT NULL,
    "target_amount" decimal NOT NULL,
    "target_currency" varchar(20) NOT NULL,
    "target_country" varchar(20) NOT NULL,
    "created" datetime NOT NULL,
    "updated" datetime NOT NULL,
    "status" varchar(20) NOT NULL,
    "concept" varchar(255) NULL,
    "rate_exchange" decimal NOT NULL,
    "sender_full_name" varchar(255) NOT NULL,
    "receiver_full_name" varchar(255) NOT NULL
);

INSERT INTO payment_payment VALUES('dd40b9489f6740ca93b6a2557db66869',861.92999999999990734,'USD','AU',266.42000000000001236,'AUD','GB','2024-08-13 14:58:02.113411','2024-08-13 14:58:02.113440','Requested','Payment for order #1645',1.269690999999999903,'John Smith','Daniel Walker');
INSERT INTO payment_payment VALUES('4add0ab844e5425a828ebf7504f85b3e',907.11999999999992638,'EUR','JP',365.19999999999996909,'EUR','CN','2024-08-13 14:58:02.126502','2024-08-13 14:58:02.126530','Draft','Payment for order #6996',1.7875639999999998863,'James Anderson','Daniel Walker');
INSERT INTO payment_payment VALUES('5cae3f98982846e1992272234578812a',807.60000000000005115,'CAD','GB',753.36999999999996191,'EUR','IN','2024-08-13 14:58:02.136947','2024-08-13 14:58:02.136983','Deleted','Payment for order #7257',1.0416989999999999305,'John Smith','Amelia Hall');
INSERT INTO payment_payment VALUES('de325f01a2bf438e835fcc654b963da0',98.319999999999989626,'JPY','JP',771.38999999999997569,'USD','IN','2024-08-13 14:58:02.149647','2024-08-13 14:58:02.149694','Deleted','Payment for order #9017',1.5409500000000000419,'John Smith','Amelia Hall');
INSERT INTO payment_payment VALUES('766d0451e7394c83bb359008e4c9caca',82.300000000000004263,'INR','CN',467.9300000000000459,'USD','US','2024-08-13 14:58:02.160837','2024-08-13 14:58:02.160872','Requested','Payment for order #2919',1.5238339999999999108,'Amelia Hall','Olivia Davis');
INSERT INTO payment_payment VALUES('4047e76cacd94256be6c81d2dbe93d0f',137.86000000000000476,'AUD','CA',289.38000000000002387,'BRL','AU','2024-08-13 14:58:02.172445','2024-08-13 14:58:02.172485','Requested','Payment for order #7144',1.6283110000000000638,'Daniel Walker','Amelia Hall');
INSERT INTO payment_payment VALUES('f04106b51e0742d9b8e31e36105eb2af',144.39000000000000056,'JPY','GB',883.25999999999993406,'JPY','FR','2024-08-13 14:58:02.184198','2024-08-13 14:58:02.184225','Deleted','Payment for order #3515',1.7951269999999999171,'Sophia Martinez','Matthew King');
INSERT INTO payment_payment VALUES('63713b9df7534bcdae91ff210d5a4799',415.0999999999999801,'USD','FR',607.72000000000003794,'JPY','CN','2024-08-13 14:58:02.195040','2024-08-13 14:58:02.195068','Draft','Payment for order #7149',1.6077999999999999403,'Evelyn Scott','Robert Thomas');
INSERT INTO payment_payment VALUES('979e16396de945a78c568d604817e68f',330.18000000000000682,'EUR','BR',510.17000000000001236,'INR','DE','2024-08-13 14:58:02.205832','2024-08-13 14:58:02.205860','Paid','Payment for order #6870',1.0662069999999999048,'Amelia Hall','Emma Johnson');
INSERT INTO payment_payment VALUES('445b2700e1004b2cb30590ac7cf491b7',831.23000000000004661,'CNY','CA',363.83999999999998564,'CNY','DE','2024-08-13 14:58:02.217617','2024-08-13 14:58:02.217645','Paid','Payment for order #2893',1.8732770000000000365,'Sophia Martinez','Evelyn Scott');
INSERT INTO payment_payment VALUES('6efbe8138a384173b16515fee7699152',652,'BRL','CA',808.90000000000004121,'USD','AU','2024-08-13 14:58:02.228150','2024-08-13 14:58:02.228178','Paid','Payment for order #9058',1.5570600000000000662,'Emma Johnson','Amelia Hall');
INSERT INTO payment_payment VALUES('82b7d10b696e4fe18f377ad57a6f882f',254.15999999999998593,'INR','CA',316.53999999999999914,'EUR','JP','2024-08-13 14:58:02.240254','2024-08-13 14:58:02.240282','Draft','Payment for order #7147',1.5345699999999999896,'Joseph Lee','Joseph Lee');
INSERT INTO payment_payment VALUES('c26367ee525148858af3f7f1dc9a0fea',339.69000000000000305,'USD','BR',570.6000000000000405,'INR','GB','2024-08-13 14:58:02.250897','2024-08-13 14:58:02.250925','Paid','Payment for order #9943',1.472836000000000034,'Matthew King','Olivia Davis');
INSERT INTO payment_payment VALUES('e2fd1171975b4c5cad5e89fe885d205a',152.56999999999997896,'CAD','BR',36.579999999999999182,'BRL','BR','2024-08-13 14:58:02.261337','2024-08-13 14:58:02.261371','Requested','Payment for order #3362',1.1738560000000000105,'Emma Johnson','James Anderson');
INSERT INTO payment_payment VALUES('7887190a88ae47149da181a7eb07f0e3',90.719999999999991757,'CNY','IN',172.96000000000000262,'CNY','DE','2024-08-13 14:58:02.271281','2024-08-13 14:58:02.271308','Deleted','Payment for order #2600',1.8786910000000000664,'Isabella Taylor','Harper Young');
INSERT INTO payment_payment VALUES('79c1911f31bb4dc1bd35b521811a224c',654.83000000000002316,'AUD','IN',758.34999999999999076,'JPY','US','2024-08-13 14:58:02.282898','2024-08-13 14:58:02.282927','Deleted','Payment for order #4935',1.2335659999999999403,'Isabella Taylor','William Wilson');
INSERT INTO payment_payment VALUES('3f593339a4b7448396b483fed208a5a8',342.22000000000001307,'JPY','IN',695.76999999999999957,'BRL','US','2024-08-13 14:58:02.294575','2024-08-13 14:58:02.294603','Deleted','Payment for order #7435',0.79120500000000006934,'David Rodriguez','Ava Garcia');
INSERT INTO payment_payment VALUES('8c3d710fa95f44fa93b1fa9c66c176b1',734.08000000000006579,'AUD','CA',435.78999999999998848,'CAD','BR','2024-08-13 14:58:02.305446','2024-08-13 14:58:02.305473','Deleted','Payment for order #5852',1.0922989999999999,'Robert Thomas','Charlotte Clark');
INSERT INTO payment_payment VALUES('14e65ed124ed40af92391dc70ddfce5c',701.47000000000003794,'CNY','US',963.26000000000000511,'AUD','AU','2024-08-13 14:58:02.316870','2024-08-13 14:58:02.316897','Deleted','Payment for order #4369',1.1524680000000000479,'Harper Young','Amelia Hall');
INSERT INTO payment_payment VALUES('d570c48784e94f6cb2b320465f1eece8',715.58999999999999275,'CNY','DE',377.51999999999998891,'GBP','DE','2024-08-13 14:58:02.326799','2024-08-13 14:58:02.326826','Draft','Payment for order #4039',1.3510420000000000761,'James Anderson','Robert Thomas');
INSERT INTO payment_payment VALUES('242586106f3d4a44a807494683e23bd7',29.579999999999998294,'JPY','CN',575.25000000000003907,'CNY','DE','2024-08-13 14:58:02.337714','2024-08-13 14:58:02.337742','Approved','Payment for order #8012',1.1461010000000000363,'Isabella Taylor','Charlotte Clark');
INSERT INTO payment_payment VALUES('b775f3c989064b18b6199313957f06b4',854.08000000000008355,'JPY','AU',53.349999999999999644,'BRL','CA','2024-08-13 14:58:02.347263','2024-08-13 14:58:02.347290','Approved','Payment for order #6233',0.69059499999999998109,'Daniel Walker','Evelyn Scott');
INSERT INTO payment_payment VALUES('488dbb13d38f4401a58f1f6a66ee6a1a',106.06999999999999761,'BRL','GB',756.51999999999999246,'JPY','CN','2024-08-13 14:58:02.358237','2024-08-13 14:58:02.358265','Deleted','Payment for order #8594',0.52803500000000003211,'Mia Lopez','Michael Brown');
INSERT INTO payment_payment VALUES('c42ad3bcd7ce4cc6a9076461a0dc2090',292.42000000000004433,'CNY','BR',132.19999999999998419,'AUD','IN','2024-08-13 14:58:02.369734','2024-08-13 14:58:02.369761','Approved','Payment for order #7371',1.7337739999999999263,'Ava Garcia','Sophia Martinez');
INSERT INTO payment_payment VALUES('9cc03a22b7c8416b923e5621e28d35dc',437.53999999999999559,'JPY','GB',373.00999999999997491,'EUR','JP','2024-08-13 14:58:02.379800','2024-08-13 14:58:02.379828','Requested','Payment for order #9697',1.2710509999999999308,'Joseph Lee','Olivia Davis');
INSERT INTO payment_payment VALUES('88b8fd4302da4bdbbae83b15e210496c',605.38999999999996148,'BRL','IN',700.83000000000001961,'JPY','US','2024-08-13 14:58:02.390050','2024-08-13 14:58:02.390078','Requested','Payment for order #8153',1.4836759999999999948,'Isabella Taylor','William Wilson');
INSERT INTO payment_payment VALUES('132fb71184f14bb5b69b63ed7be76779',853.13999999999996504,'EUR','DE',556.25,'BRL','CA','2024-08-13 14:58:02.401380','2024-08-13 14:58:02.401407','Draft','Payment for order #6757',1.6660410000000000607,'Michael Brown','Christopher Allen');
INSERT INTO payment_payment VALUES('ebe620a6cb254e7c8168d45f6b14947e',483.64000000000002543,'USD','FR',772.75000000000000355,'BRL','GB','2024-08-13 14:58:02.412716','2024-08-13 14:58:02.412744','Requested','Payment for order #2577',1.458309000000000033,'Evelyn Scott','David Rodriguez');
INSERT INTO payment_payment VALUES('af1f3bb65ee54971b37502531a91d879',300.49000000000001264,'CNY','JP',232.71000000000001683,'JPY','IN','2024-08-13 14:58:02.423177','2024-08-13 14:58:02.423205','Draft','Payment for order #2223',1.3275150000000000005,'Robert Thomas','Mia Lopez');
INSERT INTO payment_payment VALUES('d55d2758d045442cb2b6913c03cedb1f',645.12999999999998124,'BRL','GB',504.83999999999999985,'EUR','JP','2024-08-13 14:58:02.433646','2024-08-13 14:58:02.433674','Requested','Payment for order #5881',1.1147819999999999396,'Charlotte Clark','Charlotte Clark');
INSERT INTO payment_payment VALUES('3ba4ffdb6504405ca01bf7978897695a',220.59000000000001939,'GBP','BR',244.91000000000000547,'USD','BR','2024-08-13 14:58:02.443859','2024-08-13 14:58:02.443895','Paid','Payment for order #7670',0.95130300000000005411,'Charlotte Clark','Robert Thomas');
INSERT INTO payment_payment VALUES('ee8d5dc33dc44fce952a47b49effbe6a',720.42999999999999261,'USD','AU',508.31999999999997186,'JPY','CN','2024-08-13 14:58:02.454285','2024-08-13 14:58:02.454322','Paid','Payment for order #4215',0.99833800000000003649,'Isabella Taylor','Mia Lopez');
INSERT INTO payment_payment VALUES('8ea6001e00974caca614d3bab8626ef1',985.92999999999992866,'CNY','AU',947.14999999999989199,'BRL','CA','2024-08-13 14:58:02.465437','2024-08-13 14:58:02.465477','Draft','Payment for order #3540',1.6837299999999999045,'David Rodriguez','James Anderson');
INSERT INTO payment_payment VALUES('4ad4c001574a44c5a23623428ae5c69f',270.4800000000000093,'EUR','CA',454.94000000000003325,'USD','US','2024-08-13 14:58:02.476101','2024-08-13 14:58:02.476129','Requested','Payment for order #5701',1.5543730000000000046,'Amelia Hall','David Rodriguez');
INSERT INTO payment_payment VALUES('c18275416478495e8a40e9ceb892dd2a',355.08999999999999452,'JPY','IN',171.0099999999999909,'CAD','BR','2024-08-13 14:58:02.487732','2024-08-13 14:58:02.487775','Requested','Payment for order #1433',0.93818199999999993821,'Isabella Taylor','William Wilson');
INSERT INTO payment_payment VALUES('e23c7290e0a14d9098ee1edae913c6ab',219.38999999999997392,'BRL','AU',759.17999999999992155,'CAD','BR','2024-08-13 14:58:02.502120','2024-08-13 14:58:02.502153','Approved','Payment for order #7168',1.2187680000000000735,'Charlotte Clark','Evelyn Scott');
INSERT INTO payment_payment VALUES('b6b8989315a147c3878ef5503432b518',981.40000000000000568,'CAD','BR',236.41000000000000902,'INR','AU','2024-08-13 14:58:02.516550','2024-08-13 14:58:02.516591','Deleted','Payment for order #4067',0.82957700000000009765,'Michael Brown','Daniel Walker');
INSERT INTO payment_payment VALUES('468a8e3b4469424f9e5316df284a3db4',576.63999999999999701,'BRL','IN',903.28999999999997072,'GBP','IN','2024-08-13 14:58:02.533453','2024-08-13 14:58:02.533511','Draft','Payment for order #8333',1.2928489999999999149,'Christopher Allen','Michael Brown');
INSERT INTO payment_payment VALUES('e999534eb11d4d9c87db90fe5cb5372c',603.65999999999999658,'CNY','IN',637.23999999999998422,'CNY','CN','2024-08-13 14:58:02.546749','2024-08-13 14:58:02.546778','Approved','Payment for order #1292',1.6684070000000000177,'John Smith','Ava Garcia');
INSERT INTO payment_payment VALUES('92a86456a4c74b7d9c8a056c428eeb5d',979.86000000000004206,'INR','CA',566.05999999999996319,'USD','JP','2024-08-13 14:58:02.558507','2024-08-13 14:58:02.558576','Approved','Payment for order #6224',1.2103889999999999371,'Sophia Martinez','Ava Garcia');
INSERT INTO payment_payment VALUES('6090880f17c54889a2a92e3e28f17586',710.92999999999992866,'AUD','DE',428.82999999999995566,'GBP','FR','2024-08-13 14:58:02.571345','2024-08-13 14:58:02.571439','Approved','Payment for order #9515',0.63553300000000003677,'David Rodriguez','Olivia Davis');
INSERT INTO payment_payment VALUES('d55b13a2f59c4625b3e7ab67ee3ecf4d',410.05000000000002557,'GBP','US',781.89999999999999502,'EUR','JP','2024-08-13 14:58:02.583466','2024-08-13 14:58:02.583501','Deleted','Payment for order #6195',1.7923249999999999459,'Olivia Davis','Mia Lopez');
INSERT INTO payment_payment VALUES('cb5965795e1543239b5bfa3b335e8da2',602.83000000000006579,'CNY','DE',237.78999999999999026,'BRL','CN','2024-08-13 14:58:02.593796','2024-08-13 14:58:02.593825','Paid','Payment for order #2788',1.624843999999999955,'Amelia Hall','James Anderson');
INSERT INTO payment_payment VALUES('7fe7974a0a6c4729bf4e2233f1bdd6e7',125.68999999999999062,'EUR','FR',439.98999999999997001,'AUD','FR','2024-08-13 14:58:02.603389','2024-08-13 14:58:02.603417','Paid','Payment for order #5765',1.9150659999999998461,'Robert Thomas','Isabella Taylor');
INSERT INTO payment_payment VALUES('6a1d27fe669448fb9845abf813cd61ed',188.56999999999999317,'GBP','IN',629.59000000000004959,'BRL','CN','2024-08-13 14:58:02.613010','2024-08-13 14:58:02.613039','Paid','Payment for order #9134',0.80422600000000006303,'Harper Young','Daniel Walker');
INSERT INTO payment_payment VALUES('4074782c87914ca8a4c281b65c04a5dc',543.03999999999996717,'CAD','FR',351.00999999999999978,'EUR','CA','2024-08-13 14:58:02.623367','2024-08-13 14:58:02.623395','Requested','Payment for order #4212',0.59885500000000000397,'Matthew King','Sophia Martinez');
INSERT INTO payment_payment VALUES('f7fa280d3bd84bc3b92b60b831a6e166',115.43000000000001037,'EUR','FR',259.10999999999999587,'CAD','US','2024-08-13 14:58:02.632864','2024-08-13 14:58:02.632892','Deleted','Payment for order #8591',0.68705199999999999604,'Olivia Davis','Isabella Taylor');
INSERT INTO payment_payment VALUES('a5e2c011711d454f927ee43fbd34d77b',713.37999999999999189,'INR','BR',791.58000000000008355,'BRL','IN','2024-08-13 14:58:02.642873','2024-08-13 14:58:02.642902','Draft','Payment for order #1804',0.56628599999999993386,'Emma Johnson','Christopher Allen');

CREATE TABLE IF NOT EXISTS "django_session" (
    "session_key" varchar(40) NOT NULL PRIMARY KEY,
    "session_data" text NOT NULL,
    "expire_date" datetime NOT NULL
);

-- Insertar un registro en la tabla django_session
INSERT INTO django_session (session_key, session_data, expire_date)
VALUES ('eskr2sr8nga7lcm4r7ph2akmvd2hdd00', 
        '.eJxVjDsOwjAQBe_iGlm2418o6TmDtd7d4ACypTipEHeHSCmgfTPzXiLBtpa0dV7STOIstDj9bhnwwXUHdId6axJbXZc5y12RB-3y2oifl8P9OyjQy7fmcYhmnIIdnFIaOBpQ5FTM4I2bEFmDzxSYrGNr0WT0WoUwaFKWNQbx_gDYsje9:1sdsyU:zo49j9OaoXEKRenLgB8-shPwtj5oGBSbaalgQJjFk_s',
        '2024-08-27 14:58:14.055327');

-- Ajustar las secuencias en PostgreSQL (equivalente a sqlite_sequence)
-- Este paso asegura que las secuencias de los ID sean correctas después de insertar los datos

SELECT setval('django_migrations_id_seq', 19);
SELECT setval('django_admin_log_id_seq', 0);
SELECT setval('django_content_type_id_seq', 7);
SELECT setval('auth_permission_id_seq', 28);
SELECT setval('auth_group_id_seq', 0);
SELECT setval('auth_user_id_seq', 21);

-- Crear índices (estos son válidos para PostgreSQL y deberían funcionar sin cambios)
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" 
    ON "auth_group_permissions" ("group_id", "permission_id");

CREATE INDEX "auth_group_permissions_group_id_b120cbf9" 
    ON "auth_group_permissions" ("group_id");

CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" 
    ON "auth_group_permissions" ("permission_id");

CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" 
    ON "auth_user_groups" ("user_id", "group_id");

CREATE INDEX "auth_user_groups_user_id_6a12ed8b" 
    ON "auth_user_groups" ("user_id");

CREATE INDEX "auth_user_groups_group_id_97559544" 
    ON "auth_user_groups" ("group_id");

CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" 
    ON "auth_user_user_permissions" ("user_id", "permission_id");

CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" 
    ON "auth_user_user_permissions" ("user_id");

CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" 
    ON "auth_user_user_permissions" ("permission_id");

CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" 
    ON "django_admin_log" ("content_type_id");

CREATE INDEX "django_admin_log_user_id_c564eba6" 
    ON "django_admin_log" ("user_id");

CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" 
    ON "django_content_type" ("app_label", "model");

CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" 
    ON "auth_permission" ("content_type_id", "codename");

CREATE INDEX "auth_permission_content_type_id_2f476e4b" 
    ON "auth_permission" ("content_type_id");

CREATE INDEX "django_session_expire_date_a5c62663" 
    ON "django_session" ("expire_date");


COMMIT;
