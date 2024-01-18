USE [2019SBD]



--Deleting tables
DROP TABLE League;
DROP TABLE Team;
DROP TABLE Player;
DROP TABLE PStats;
DROP TABLE Pincome;
DROP TABLE Match;
DROP TABLE Schedule;
--tables


--tabel League
GO
CREATE TABLE League (
    Lno int NOT NULL,
    Lname varchar(50) NOT NULL,
    Ltype int NOT NULL,
    CONSTRAINT L_PK PRIMARY KEY (Lno)
);

--table Team
GO
CREATE TABLE Team(
    Teamno int NOT NULL,
    TeamName varchar(50) NOT NULL,
    Country varchar(50) NOT NULL,
    Founded date NOT NULL,                      
    Lno int NOT NULL,

    CONSTRAINT Team_PK PRIMARY KEY (Teamno)
);

--table Player
GO
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
GO
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
GO 
CREATE TABLE Pincome(
    Pincomeno int NOT NULL,
    Salary int NOT NULL,
    Bonus int NOT NULL,
    Playerno int NOT NULL,
    CONSTRAINT Pincome_PK PRIMARY KEY (Pincomeno)
);
--table Match 
GO
CREATE TABLE Match(
    Matchno int NOT NULL,
    Mdate DATE NOT NULL,
    HomeTeamno int NOT NULL,
    AwayTeamno int NOT NULL,
    CONSTRAINT Matchno PRIMARY KEY (Matchno) 
);
--table Schedule
GO
CREATE TABLE Schedule(
    Scheduleno int NOT NULL,
    Matchno int NOT NULL,
    CONSTRAINT Scheduleno_PK PRIMARY KEY (Scheduleno)
);

GO
ALTER TABLE Match
ADD HomeTeamGoals int ,
AwayTeamGoals int ;

--foreign keys
--Reference: Team_League_FK
GO 
ALTER TABLE Team ADD CONSTRAINT Team_League_FK
    FOREIGN KEY (Lno)
    REFERENCES League (Lno);

--Reference: Player_Team_FK
GO 
ALTER TABLE Player ADD CONSTRAINT Player_Team_FK
    FOREIGN KEY(Teamno)
    REFERENCES Team (Teamno);

--Reference Player_Income_Player_FK
GO 
ALTER TABLE Pincome ADD CONSTRAINT Player_Income_Player_FK
    FOREIGN KEY(Playerno)
    REFERENCES Player (Playerno);

--Reference Player_Stats_Player_FK
GO
ALTER TABLE PStats ADD CONSTRAINT Player_Stats_Player_FK
    FOREIGN KEY (Playerno)
    REFERENCES Player (Playerno);

--Reference Match_Team1_FK
GO 
ALTER TABLE Match ADD CONSTRAINT Match_Team1_FK
    FOREIGN KEY (HomeTeamno)
    REFERENCES Team (Teamno);
--Reference Match_Team2_FK
GO 
ALTER TABLE Match ADD CONSTRAINT Match_Team2_FK
    FOREIGN KEY (AwayTeamno)
    REFERENCES Team (Teamno);

--Reference Schedule_Match_FK
GO 
ALTER TABLE Schedule ADD CONSTRAINT Schedule_Match_FK
    FOREIGN KEY (Matchno)
    REFERENCES Match (Matchno);





--Inserting values
GO 
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
VALUES(1, 'ARSENAL', 'ENGLAND', CONVERT(DATE, '01-12-1886', 105), 1);
INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES(2, 'REAL MADRID', 'SPAIN', CONVERT(DATE, '06-03-1902',105), 2);
INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES (3, 'PSG', 'FRANCE', CONVERT(DATE, '26-06-1970',105), 3);
INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES(4, 'MILAN', 'ITALY', CONVERT(DATE,'16-12-1899', 105), 4);
INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES(5, 'LEGIA WARSZAWA', 'POLAND', CONVERT(DATE, '08-05-1916',105), 5);
INSERT INTO Team(Teamno, TeamName, Country, Founded, Lno)
VALUES(6, 'BORUSSIA DORTMUND', 'GERMANY', CONVERT(DATE, '19-12-1909',105), 6);

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

DELETE FROM Match
INSERT INTO Match(Matchno, Mdate, HomeTeamno, AwayTeamno, HomeTeamGoals, AwayTeamGoals)
VALUES(1, CONVERT(DATE, '04-06-2020',105), 1, 2, 2, 2);
INSERT INTO Match(Matchno, Mdate, HomeTeamno, AwayTeamno, HomeTeamGoals, AwayTeamGoals)
VALUES(2, CONVERT(DATE, '07-02-2021',105), 3, 4, 1,3);
INSERT INTO Match(Matchno, Mdate, HomeTeamno, AwayTeamno, HomeTeamGoals, AwayTeamGoals)
VALUES(3, CONVERT(DATE, '05-07-2020',105), 4, 2, 4, 2);
INSERT INTO Match(Matchno, Mdate, HomeTeamno, AwayTeamno, HomeTeamGoals, AwayTeamGoals)
VALUES(4, CONVERT(DATE, '27-10-2020',105), 5,6, 0,0);


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

--PROCEDURY I KURSORY

--PROCEDURA GetPlayerStats 
-- przyjmuje nazwe druzyny jako parametr i zwraca statystyki zawodnikow

CREATE PROCEDURE GetPlayerStats 
@TeamName varchar(50) 
AS
BEGIN
	DECLARE @TeamID int,
			@PlayerName varchar(50),
			@PlayerSurname varchar(50),
			@Goals int,
			@Assists int,
			@YellowCards int,
			@RedCards int


	SELECT @TeamID = Teamno
	FROM Team
	WHERE @TeamName = TeamName;

	DECLARE PlayerStatsCursor CURSOR FOR
	SELECT P.Pname, P.Psurname, PS.Goals, PS.Assists, Ps.yellowCards, Ps.redCards
	FROM Player P
	INNER JOIN PStats PS ON P.Playerno = PS.Playerno
	WHERE P.Teamno = @TeamID;

	OPEN PlayerStatsCursor
	

	FETCH NEXT FROM PlayerStatsCursor
	INTO @PlayerName, @PlayerSurname, @Goals, @Assists, @yellowCards, @redCards;
	

	WHILE @@FETCH_STATUS=0
	BEGIN
		PRINT 'Player: ' +  @PlayerName + ' ' + @PlayerSurname;
		PRINT 'Goals: ' + CAST(@Goals AS varchar(10));
		PRINT 'Assists: ' + CAST(@Assists AS varchar(10));
		PRINT 'Yellow Cards: ' + CAST(@yellowCards AS varchar(10));
		PRINT 'Red Cards: ' + CAST(@redCards AS varchar(10));
		PRINT 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

		FETCH NEXT FROM PlayerStatsCursor
		INTO @PlayerName, @PlayerSurname, @Goals, @Assists, @yellowCards, @redCards;
	END;

	CLOSE PlayerStatsCursor;
	DEALLOCATE PlayerStatsCursor;
END;

EXEC GetPlayerStats @TeamName = 'Arsenal';

--Wyzwalacz UpdatePlayerStats
--Dodawanie goli do statystyk zawodnikow po meczu, gole z kazdej druzyny rozdzielane sa po rowno na kazego zawodnika
CREATE TRIGGER UpdatePlayerStats
ON Match
AFTER INSERT
AS
BEGIN
	DECLARE @Playerno INT;
	DECLARE @Goals INT;

	DECLARE PlayerCursor CURSOR FOR
	SELECT DISTINCT Playerno
	FROM PStats
	 WHERE Playerno IN (SELECT HomeTeamno FROM inserted)
       OR Playerno IN (SELECT AwayTeamno FROM inserted);
	 
	 OPEN PlayerCursor;

	 FETCH NEXT FROM PlayerCursor INTO @PlayerNo;
	 WHILE @@FETCH_STATUS = 0
	 
	 BEGIN
		SELECT @Goals = 
			CASE
				WHEN @PlayerNo IN (SELECT HomeTeamno FROM inserted) THEN HomeTeamGoals
                WHEN @PlayerNo IN (SELECT AwayTeamno FROM inserted) THEN AwayTeamGoals
                ELSE 0
            END

		FROM inserted
		WHERE @PlayerNo IN (SELECT HomeTeamno FROM inserted) OR @PlayerNo IN (SELECT AwayTeamno FROM inserted);
		
		UPDATE PStats
        SET Goals = Goals + @Goals
        WHERE Playerno = @PlayerNo;

		FETCH NEXT FROM PlayerCursor INTO @PlayerNo;
    END;

	CLOSE PlayerCursor;
    DEALLOCATE PlayerCursor;
END;

--Wyzwalacz Check SalaryBonus
--sprawdzanie czy przy wstawianiu nowego zawodnika, jego pensja jest wieksza niz bonus
CREATE TRIGGER CheckSalaryBonus
ON Pincome
FOR INSERT
AS
BEGIN
DECLARE @Salary MONEY,
		@Bonus MONEY;
SELECT @Salary = Salary FROM Inserted;
SELECT @Bonus = Bonus FROM Inserted;
    IF @Salary<@Bonus
		BEGIN
			ROLLBACK;
			RAISERROR('Salary cant be higher than bonus.', 1, 2)
			
        
		END;
	END;

	