BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Role" (
	"Role_ID"	INTEGER,
	"Role_Names"	NVARCHAR(50),
	PRIMARY KEY("Role_ID")
);
CREATE TABLE IF NOT EXISTS "user" (
	"User_ID"	INTEGER,
	"First_name"	NVARCHAR(50),
	"Second_name"	NVARCHAR(50),
	"Email"	NVARCHAR(50),
	"Username"	NVARCHAR(50),
	"Password"	NVARCHAR(50),
	"Role_ID"	INTEGER,
	FOREIGN KEY("Role_ID") REFERENCES "Role"("Role_ID") ON DELETE CASCADE,
	PRIMARY KEY("User_ID")
);
CREATE TABLE IF NOT EXISTS "comment" (
	"Comment_ID"	INTEGER,
	"Comment_content"	NVARCHAR(50),
	"Comment_Date"	DATE,
	"User_ID"	INTEGER,
	FOREIGN KEY("User_ID") REFERENCES "User"("User_ID") on DELETE CASCADE,
	PRIMARY KEY("Comment_ID")
);
CREATE TABLE IF NOT EXISTS "category" (
	"category_ID"	INTEGER,
	"category_Name"	Nvarchar(50),
	PRIMARY KEY("category_ID")
);
CREATE TABLE IF NOT EXISTS "Article" (
	"Article_ID"	INTEGER,
	"Article_Date"	DATE,
	"Article_title"	NVARCHAR(50),
	"User_ID"	INTEGER,
	"category_ID"	INTEGER,
	FOREIGN KEY("category_ID") REFERENCES "category"("category_ID") ON DELETE CASCADE,
	FOREIGN KEY("User_ID") REFERENCES "user"("User_ID") ON DELETE CASCADE,
	PRIMARY KEY("Article_ID")
);
INSERT INTO "Role" VALUES (1,'admin');
INSERT INTO "Role" VALUES (2,'member');
INSERT INTO "user" VALUES (1,'Admin','Admin','Admin@blog.com','Admin','pwijmqe1981',1);
INSERT INTO "user" VALUES (2,'Adam','said','Adam@blog.com','adamsaid','pwkomqe12131',2);
INSERT INTO "user" VALUES (3,'Jane','Smith','jane@example.com','janesmith','password',2);
INSERT INTO "user" VALUES (4,'Michael','Johnson','michael@example.com','michaeljohnson','password',2);
INSERT INTO "user" VALUES (5,'Emily','Brown','emily@example.com','emilybrown','password',2);
INSERT INTO "user" VALUES (6,'David','Wilson','david@example.com','davidwilson','password',2);
INSERT INTO "comment" VALUES (1,'Comment 1','2024-04-01',1);
INSERT INTO "comment" VALUES (2,'Comment 2','2024-04-02',2);
INSERT INTO "comment" VALUES (3,'Comment 3','2024-04-03',3);
INSERT INTO "comment" VALUES (4,'Comment 4','2024-04-04',4);
INSERT INTO "comment" VALUES (5,'Comment 5','2024-04-05',5);
INSERT INTO "category" VALUES (1,'Category 1');
INSERT INTO "category" VALUES (2,'Sports 2');
INSERT INTO "category" VALUES (3,'Health 3');
INSERT INTO "category" VALUES (4,'Category 4');
INSERT INTO "category" VALUES (5,'Category 5');
INSERT INTO "category" VALUES (6,'Category 6');
INSERT INTO "Article" VALUES (1,'2024-04-01','Article 1',1,1);
INSERT INTO "Article" VALUES (2,'2024-04-02','Article 2',1,2);
INSERT INTO "Article" VALUES (3,'2024-04-03','Article 3',2,1);
INSERT INTO "Article" VALUES (4,'2024-04-04','Article 4',2,2);
INSERT INTO "Article" VALUES (5,'2024-04-05','Article 5',3,1);
COMMIT;
