CREATE DATABASE Pokedex;
USE Pokedex;
CREATE TABLE Abilities
    (Name char(15) primary key DEFAULT "?",
    Effect char(250));
CREATE TABLE Types (
    Type CHAR(10) PRIMARY KEY,
    NOR INT DEFAULT 1,
    FIR INT DEFAULT 1,
    WAT INT DEFAULT 1,
    ELE INT DEFAULT 1,
    GRA INT DEFAULT 1,
    ICE INT DEFAULT 1,
    FIG INT DEFAULT 1,
    POI INT DEFAULT 1,
    GRO INT DEFAULT 1,
    FLY INT DEFAULT 1,
    PSY INT DEFAULT 1,
    BUG INT DEFAULT 1,
    ROC INT DEFAULT 1,
    GHO INT DEFAULT 1,
    DRA INT DEFAULT 1,
    DAR INT DEFAULT 1,
    STE INT DEFAULT 1,
    FAI INT DEFAULT 1
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