USE Pokedex;

/*show all pokemon*/
SELECT * FROM Pokemon;

-- show pokemon of poison type
SELECT * FROM Pokemon 
WHERE (Type1="Poison" OR Type2="Poison");

-- show type names that do 2x damage to dragon type
SELECT Type FROM Types
WHERE (DRA=2);

-- show moves that have power of 100 or more
SELECT * FROM move_descriptions
WHERE (Power>=100);
  
-- show moves whose names start form "A"
SELECT * FROM move_descriptions
WHERE (Name LIKE "A%");

-- show all water type moves
SELECT * from move_descriptions
WHERE (Type="Water");

-- show pokemon having a secondary type
SELECT * FROM pokemon
WHERE (Type2 is not null);

-- show all pokemon with hidden ability
SELECT * FROM pokemon 
WHERE (AbilityH is not null);

-- show base stats of pokemon with id 9
SELECT * FROM Base_Stats
WHERE ID=9;

-- show EV yield of 1st 3 pokemon
SELECT * FROM EV
WHERE ID<=3;