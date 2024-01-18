

DROP TABLE League;
DROP TABLE Team;
DROP TABLE Player;
DROP TABLE PStats;
DROP TABLE Pincome;
DROP TABLE Match;
DROP TABLE Schedule;
--tables


--table League
/
CREATE TABLE League (
    Lno int NOT NULL,
    Lname varchar(50) NOT NULL,
    Ltype int NOT NULL,
    CONSTRAINT L_PK PRIMARY KEY (Lno)
);

--table Team
/
CREATE TABLE Team(
    Teamno int NOT NULL,
    TeamName varchar(50) NOT NULL,
    Country varchar(50) NOT NULL,
    Founded date NOT NULL,
    Lno int NOT NULL,

    CONSTRAINT Team_PK PRIMARY KEY (Teamno)
);

--table Player
/
CREATE TABLE Player(
    Playerno int NOT NULL,
    Pname varchar(50) NOT NULL,
    Psurname varchar(50) NOT NULL,
    Pnationality varchar(50) NOT NULL,
    Position varchar(50) NOT NULL,
    Teamno int NOT NULL,
    CONSTRAINT Player_PK PRIMARY KEY (Playerno)
);

--table Player Stats
/
CREATE TABLE PStats(
    Pstatsno int NOT NULL,
    Goals int ,
    Assists int,
    yellowCards int,
    redCards int,
    Playerno int NOT NULL,
    CONSTRAINT Pstats_PK PRIMARY KEY (Pstatsno)
);

--table Player Income
/
CREATE TABLE Pincome(
    Pincomeno int NOT NULL,
    Salary int NOT NULL,
    Bonus int NOT NULL,
    Playerno int NOT NULL,
    CONSTRAINT Pincome_PK PRIMARY KEY (Pincomeno)
);
--table Match
/
CREATE TABLE Match(
    Matchno int NOT NULL,
    Mdate DATE NOT NULL,
    HomeTeamno int NOT NULL,
    AwayTeamno int NOT NULL,
    CONSTRAINT Matchno PRIMARY KEY (Matchno)
);
--table Schedule
/
CREATE TABLE Schedule(
    Scheduleno int NOT NULL,
    Matchno int NOT NULL,
    CONSTRAINT Scheduleno_PK PRIMARY KEY (Scheduleno)
);

/
ALTER TABLE Match
ADD HomeTeamGoals int;
ALTER TABLE Match
ADD AwayTeamGoals int ;

--foreign keys
--Reference: Team_League_FK
/
ALTER TABLE Team ADD CONSTRAINT Team_League_FK
    FOREIGN KEY (Lno)
    REFERENCES League (Lno);

--Reference: Player_Team_FK
/
ALTER TABLE Player ADD CONSTRAINT Player_Team_FK
    FOREIGN KEY(Teamno)
    REFERENCES Team (Teamno);

--Reference Player_Income_Player_FK
/
ALTER TABLE Pincome ADD CONSTRAINT Player_Income_Player_FK
    FOREIGN KEY(Playerno)
    REFERENCES Player (Playerno);

--Reference Player_Stats_Player_FK
/
ALTER TABLE PStats ADD CONSTRAINT Player_Stats_Player_FK
    FOREIGN KEY (Playerno)
    REFERENCES Player (Playerno);

--Reference Match_Team1_FK
/
ALTER TABLE Match ADD CONSTRAINT Match_Team1_FK
    FOREIGN KEY (HomeTeamno)
    REFERENCES Team (Teamno);
--Reference Match_Team2_FK
/
ALTER TABLE Match ADD CONSTRAINT Match_Team2_FK
    FOREIGN KEY (AwayTeamno)
    REFERENCES Team (Teamno);

--Reference Schedule_Match_FK
/
ALTER TABLE Schedule ADD CONSTRAINT Schedule_Match_FK
    FOREIGN KEY (Matchno)
    REFERENCES Match (Matchno);





--Inserting values
/
INSERT INTO League(Lno, Lname, Ltype)
VALUES(1, 'PREMIER LEAGUE', 1);
INSERT INTO League(Lno, Lname, Ltype)
VALUES(2, 'LA LIGA', 1);
INSERT INTO League(Lno, Lname, Ltype)
VALUES(3, 'LIGUE 1', 1);
INSERT INTO League(Lno, Lname, Ltype)
VALUES(4, 'SERIE A', 1);
INSERT INTO League(Lno, Lname, Ltype)
VALUES(5, 'EKSTRAKLASA', 1);
INSERT INTO League(Lno, Lname, Ltype)
VALUES(6, 'BUNDESLIGA', 1);


INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES(1, 'ARSENAL', 'ENGLAND', TO_DATE('1886-12-1'), 1);
INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES(2, 'REAL MADRID', 'SPAIN', TO_DATE('1902-03-06'), 2);
INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES (3, 'PSG', 'FRANCE', TO_DATE('1970-06-26'), 3);
INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES(4, 'MILAN', 'ITALY', TO_DATE('1899-12-16'), 4);
INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES(5, 'LEGIA WARSZAWA', 'POLAND', TO_DATE('1916-05-08'), 5);
INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES(6, 'BORUSSIA DORTMUND', 'GERMANY', TO_DATE('1909-12-19'), 6);

INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(1, 'Martin', 'Odegard', 'Norway', 'Midfielder', 1);
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(2, 'Bukayo', 'Saka', 'England', 'Forward', 1);
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(3, 'TONI', 'KROSS', 'Germany', 'Midfielder', 2);
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(4, 'LUKA', 'MODRIC', 'Croatia', 'Midfielder', 2);
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(5, 'Kylian', 'Mbappe', 'France', 'Forward' , 3 );
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(6, 'Achraf', 'Hakimi', 'Maroco', 'Defender', 3);
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(7, 'Olivier', 'Giroud', 'France', 'Striker', 4);
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(8, 'Kacper', 'Tobiasz', 'Poland', 'Goalkeeper', 5);
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(9, 'Rafal', 'Augustyniak', 'Poland', 'Defender', 5);
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(10, 'Rafael', 'Leao', 'Portugal', 'Forward', 4);
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(11, 'Marco', 'Reus', 'Germany', 'Forward', 6);
INSERT INTO Player(Playerno, Pname, Psurname, Pnationality, Position, Teamno)
VALUES(12, 'Emre', 'Can', 'Germany', 'Midfielder', 6);

INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(1, 5000, 2000, 1);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(2, 18000, 10000, 2);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(3, 8000, 350, 3);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(4, 6000, 1000, 4);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(5, 7500, 0, 5);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(6, 12000, 2500, 6);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(7, 5000, 0, 7);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(8, 2500, 0, 8);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(9, 3000, 100, 9);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(10, 6000, 1500, 10);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(11, 8000, 950, 11);
INSERT INTO Pincome(Pincomeno, Salary, Bonus, Playerno)
VALUES(12, 14000, 3000, 12);

INSERT INTO PStats(Pstatsno, Goals, Assists, yellowCards, redCards, Playerno)
VALUES(1, 3, 5, 2, 0,1);
INSERT INTO PStats(Pstatsno, Goals, Assists, yellowCards, redCards, Playerno)
VALUES(2, 7, 2, 0, 1,2);
INSERT INTO PStats(Pstatsno, Goals, Assists, yellowCards, redCards, Playerno)
VALUES(3 , 1, 10, 1, 0,3);
INSERT INTO PStats(Pstatsno, Goals, Assists, yellowCards, redCards, Playerno)
VALUES(4, 0, 6, 3, 0,4);

INSERT INTO Match(Matchno, Mdate, HomeTeamno, AwayTeamno, HomeTeamGoals, AwayTeamGoals)
VALUES(1, TO_DATE('2020-06-04'), 1, 2, 2, 2);
INSERT INTO Match(Matchno, Mdate, HomeTeamno, AwayTeamno, HomeTeamGoals, AwayTeamGoals)
VALUES(2, TO_DATE('2021-02-07'), 3, 4, 1,3);
INSERT INTO Match(Matchno, Mdate, HomeTeamno, AwayTeamno, HomeTeamGoals, AwayTeamGoals)
VALUES(3, TO_DATE('2020-07-05'), 4, 2, 4, 2);
INSERT INTO Match(Matchno, Mdate, HomeTeamno, AwayTeamno, HomeTeamGoals, AwayTeamGoals)
VALUES(4, TO_DATE('2020-10-27'), 5,6, 0,0);


INSERT INTO Schedule(Scheduleno, Matchno)
VALUES(1, 1);
INSERT INTO Schedule(Scheduleno, Matchno)
VALUES(2, 2);
INSERT INTO Schedule(Scheduleno, Matchno)
VALUES(3, 3);
INSERT INTO Schedule(Scheduleno, Matchno)
VALUES(4, 4);




SELECT* FROM League;
SELECT Team.*, League.Lname
FROM Team
INNER JOIN League  ON Team.Lno = League.Lno;
SELECT Player.*, Team.TeamName
FROM Player
INNER JOIN Team ON Player.Teamno = Team.Teamno;
SELECT*FROM PStats;
SELECT*FROM Pincome;
SELECT*FROM Match;
SELECT*FROM Schedule;


-- PROCEDURA GetPlayerStats
/
CREATE OR REPLACE PROCEDURE GetPlayerStats (p_TeamName VARCHAR2)
AS
    v_TeamID Team.Teamno%TYPE;
    v_PlayerName Player.Pname%TYPE;
    v_PlayerSurname Player.Psurname%TYPE;
    v_Goals Pstats.Goals%Type;
    v_Assists Pstats.Assists%Type;
    v_YellowCards Pstats.yellowCards%Type;
    v_RedCards Pstats.redCards%Type;

    CURSOR PlayerStatsCursor IS
        SELECT P.Pname, P.Psurname, PS.Goals, PS.Assists, PS.yellowCards, PS.redCards
        FROM Player P
        INNER JOIN PStats PS ON P.Playerno = PS.Playerno
        WHERE P.Teamno = v_TeamID;
BEGIN


    SELECT Teamno INTO v_TeamID FROM Team WHERE p_TeamName = TeamName;

    OPEN PlayerStatsCursor;
    LOOP
        FETCH PlayerStatsCursor INTO v_PlayerName,v_PlayerSurname,v_Goals,v_Assists,v_YellowCards,v_RedCards;
        EXIT WHEN PlayerStatsCursor%NOTFOUND;
        /* v_PlayerName := v_Record.Pname;
        v_PlayerSurname := v_Record.Psurname;
        v_Goals := v_Record.Goals;
        v_Assists := v_Record.Assists;
        v_YellowCards := v_Record.yellowCards;
        v_RedCards := v_Record.redCards;*/

        DBMS_OUTPUT.PUT_LINE('Player: ' || v_PlayerName || ' ' || v_PlayerSurname);
        DBMS_OUTPUT.PUT_LINE('Goals: ' || v_Goals);
        DBMS_OUTPUT.PUT_LINE('Assists: ' || v_Assists);
        DBMS_OUTPUT.PUT_LINE('Yellow Cards: ' || v_YellowCards);
        DBMS_OUTPUT.PUT_LINE('Red Cards: ' || v_RedCards);
        DBMS_OUTPUT.PUT_LINE('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    END LOOP;
    CLOSE PlayerStatsCursor;
END;

--CALL DBMS_OUTPUT.ENABLE();

BEGIN
    GetPlayerStats('ARSENAL');
END;

--Wyzwalacz UpdatePlayerStats
--Dodawanie goli do statystyk zawodnikow po meczu, gole z kazdej druzyny rozdzielane sa po rowno na kazego zawodnika
/
CREATE OR REPLACE TRIGGER UpdatePlayerStats
AFTER INSERT ON Match
FOR EACH ROW
DECLARE
    v_HomeGoals INT;
    v_AwayGoals INT;
BEGIN
    -- Pobranie liczby goli dla obu drużyn w meczu
    SELECT :NEW.HomeTeamGoals, :NEW.AwayTeamGoals
    INTO v_HomeGoals, v_AwayGoals
    FROM dual;

    -- Aktualizacja statystyk zawodników dla drużyny gospodarzy
    UPDATE PStats
    SET Goals = Goals + v_HomeGoals
    WHERE Playerno IN (SELECT Playerno FROM Player WHERE Teamno = :NEW.HomeTeamno);

    -- Aktualizacja statystyk zawodników dla drużyny gości
    UPDATE PStats
    SET Goals = Goals + v_AwayGoals
    WHERE Playerno IN (SELECT Playerno FROM Player WHERE Teamno = :NEW.AwayTeamno);
END;
/
SELECT* FROM PStats;
INSERT INTO Match(Matchno, Mdate, HomeTeamno, AwayTeamno, HomeTeamGoals, AwayTeamGoals)
VALUES(5, TO_DATE('2022-01-20'), 1, 4, 3, 1);