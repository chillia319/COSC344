DROP TABLE venue;
DROP TABLE game;
DROP TABLE sponsorship;
DROP TABLE sponsor;
DROP TABLE player;
DROP TABLE team;
DROP TABLE coach;

CREATE TABLE coach(
    CoachID int NOT NULL PRIMARY KEY,
    Start_Date date DEFAULT sysdate,
    Phone_Number int NOT NULL,
    First_Name varchar(255) NOT NULL,
    Last_Name varchar(255) NOT NULL
);

INSERT INTO coach VALUES
('1001',TO_DATE('22-05-2008','DD-MM-YYYY'),'0123456','Andrew','Trotman');
INSERT INTO coach VALUES
('1002',TO_DATE('22-05-2009','DD-MM-YYYY'),'6543210','Richard','Keefe');
INSERT INTO coach VALUES
('1003',TO_DATE('22-05-2010','DD-MM-YYYY'),'0123654','Nick','Meek');
INSERT INTO coach VALUES
('1004',TO_DATE('22-05-2010','DD-MM-YYYY'),'3210456','Haibo','Zhang');

CREATE TABLE team(
    Team_Name varchar(255) NOT NULL PRIMARY KEY,
    CoachID int,
    CONSTRAINT FK_TeamCoach FOREIGN KEY (CoachID)
    REFERENCES coach(CoachID)
);

INSERT INTO team VALUES
('Team 1', '1001');
INSERT INTO team VALUES
('Team 2', '1002');
INSERT INTO team VALUES
('Team 3', '1003');
INSERT INTO team VALUES
('Team 4', '1004');

CREATE TABLE player(
    PlayerID int NOT NULL PRIMARY KEY,
    Phone_Number int NOT NULL,
    Address varchar(255),
    Date_of_Birth date NOT NULL,
    Gender varchar(255) NOT NULL,
    Subs_Paid int DEFAULT 0,
    First_Name varchar(255) NOT NULL,
    Last_Name varchar(255) NOT NULL,
    Team_Name varchar(255) NOT NULL,
    CONSTRAINT FK_TeamName FOREIGN KEY (Team_Name)
    REFERENCES team(Team_Name)
);

INSERT INTO player VALUES
('10001','12345678','20 mill street', TO_DATE('22-05-1988','DD-MM-YYYY'),'M','1', 'Alex', 'Baker', 'Team 1'); 
INSERT INTO player VALUES
('10002','87654321','29 queen street', TO_DATE('22-06-1988','DD-MM-YYYY'),'M','1', 'Bob', 'Clark', 'Team 1');
INSERT INTO player VALUES
('10003','13572468','29 sederick street', TO_DATE('22-07-1988','DD-MM-YYYY'),'M','1', 'Charles', 'Dyer', 'Team 2');
INSERT INTO player VALUES
('10004','24681357','100 may street', TO_DATE('22-08-1988','DD-MM-YYYY'),'M','1', 'David', 'Fisher', 'Team 2');
INSERT INTO player VALUES
('10005','86427531','290 goerge street', TO_DATE('22-09-1988','DD-MM-YYYY'),'M','1', 'Edwin', 'Grant', 'Team 3');
INSERT INTO player VALUES
('10006','75318642','150 park street', TO_DATE('10-10-1988','DD-MM-YYYY'),'M','1', 'Fred', 'Harmon', 'Team 3');
INSERT INTO player VALUES
('10007','12348765','10 union street', TO_DATE('10-11-1988','DD-MM-YYYY'),'M','1', 'Goerge', 'Jackson', 'Team 4');
INSERT INTO player VALUES
('10008','56784321','50 main street', TO_DATE('10-12-1988','DD-MM-YYYY'),'M','1', 'Herbert', 'Kingston', 'Team 4');



CREATE TABLE sponsor(
    SponsorID int NOT NULL PRIMARY KEY,
    Name varchar(255) NOT NULL
);

INSERT INTO sponsor VALUES
('001','anz');
INSERT INTO sponsor VALUES
('002','bnz');
INSERT INTO sponsor VALUES
('003','air new zealand');
INSERT INTO sponsor VALUES
('004','Whitcoulls');

CREATE TABLE sponsorship(
    Team_Name varchar(255) NOT NULL UNIQUE,
    SponsorID int,
    CONSTRAINT FK_TeamSponsor FOREIGN KEY (SponsorID)
    REFERENCES sponsor(SponsorID),
    CONSTRAINT FK_SupportTeam FOREIGN KEY (Team_Name)
    REFERENCES team(Team_Name) 
);


INSERT INTO sponsorship VALUES
('Team 1', '001');
INSERT INTO sponsorship VALUES
('Team 2', '002');
INSERT INTO sponsorship VALUES
('Team 3', '003');
INSERT INTO sponsorship VALUES
('Team 4', '004');


CREATE TABLE game(
    Home_Team_Name varchar(255) NOT NULL,
    Away_Team_Name varchar(255) NOT NULL,
    Home_Score int DEFAULT 0 NOT NULL,
    Away_Score int DEFAULT 0 NOT NULL,
    Game_Date date DEFAULT sysdate NOT NULL,
    CONSTRAINT PK_Game PRIMARY KEY (Home_Team_Name, Away_Team_Name),
    CONSTRAINT CHK_Score CHECK (Home_Score >= 0 AND Away_Score >= 0) 
);

INSERT INTO game VALUES
('Team 1','Team 2','2','0',TO_DATE('22-05-2016','DD-MM-YYYY'));
INSERT INTO game VALUES
('Team 2','Team 3','1','1',TO_DATE('22-06-2016','DD-MM-YYYY'));
INSERT INTO game VALUES
('Team 3','Team 4','0','3',TO_DATE('22-07-2016','DD-MM-YYYY'));
INSERT INTO game VALUES
('Team 4','Team 1','3','1',TO_DATE('22-08-2016','DD-MM-YYYY'));

CREATE TABLE venue(
    Name varchar(255) NOT NULL UNIQUE,
    Location varchar(255) NOT NULL,
    CONSTRAINT PK_Venue PRIMARY KEY (Name, Location)   
);

INSERT INTO venue VALUES
('Sir Woolf Fisher Arena Vodafone Events Centre','Auckland');
INSERT INTO venue VALUES
('The trust arena','Auckland');
INSERT INTO venue VALUES
('TSB Bank Arena','Wellington');
INSERT INTO venue VALUES
('Westpac Stadium','Wellington');
INSERT INTO venue VALUES
('Forsyth Barr Stadium','Dunedin');
INSERT INTO venue VALUES
('AMI Stadium','Christchurch');

COMMIT;

