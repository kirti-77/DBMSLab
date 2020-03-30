
CREATE DATABASE Pokedex;
USE Pokedex;
CREATE TABLE Abilities
    (Name char(15) primary key DEFAULT "?",
    Effect char(250));
drop table types;
CREATE TABLE Types (
    Type CHAR(10) PRIMARY KEY,
    NOR float(4, 2),
    FIR float(4, 2),
    WAT float(4, 2),
    ELE float(4, 2),
    GRA float(4, 2),
    ICE float(4, 2),
    FIG float(4, 2),
    POI float(4, 2),
    GRO float(4, 2),
    FLY float(4, 2),
    PSY float(4, 2),
    BUG float(4, 2),
    ROC float(4, 2),
    GHO float(4, 2),
    DRA float(4, 2),
    DAR float(4, 2),
    STE float(4, 2),
    FAI float(4, 2)
);
CREATE TABLE Pokemon
    (ID int primary key DEFAULT 0,
    Name char(15) DEFAULT '?',
    Type1 char(10) references Types.Type,
    Type2 char(10) references Types.Type,
    Ability1 char(15) references Abilities.Name,
    Ability2 char(15) references Abilities.Name,
    AbilityH char(15) references Abilities.Name);
CREATE TABLE EV
    (ID int primary key references Pokemon.ID,
    HP int DEFAULT 0,
    ATK int DEFAULT 0,
    DEF int DEFAULT 0,
    SPATK int DEFAULT 0,
    SPDEF int DEFAULT 0,
    SPD int DEFAULT 0);
CREATE TABLE Base_Stats
    (ID int primary key references Pokemon.ID,
    HP int DEFAULT 10,
    ATK int DEFAULT 10,
    DEF int DEFAULT 10,
    SPATK int DEFAULT 10,
    SPDEF int DEFAULT 10,
    SPD int DEFAULT 10);
CREATE TABLE Move_Descriptions
    (MID int primary key,
    Name char(15),
    Type char(10) references Types.Type,
    Power int DEFAULT 10,
    Accuracy int DEFAULT 100,
    Details char(250));
CREATE TABLE Moves_by_Leveling
    (ID int references Pokemon.ID,
    MID int references Move_Descriptions.MID,
    Level int DEFAULT 5);
CREATE TABLE Moves_by_TM_or_HM
    (ID int references Pokemon.ID,
    MID int references Move_Descriptions.MID,
    TM_or_HM char(5));
CREATE TABLE Moves_by_Tutor
    (ID int references Pokemon.ID,
    MID int references Move_Descriptions.MID);
CREATE TABLE Images
	(ID int primary key references Pokemon.ID,
    url varchar(200));
    
