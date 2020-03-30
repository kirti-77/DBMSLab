USE Pokedex;

-- 1 show pokemon whose types do 2x damage to bug
SELECT * FROM Pokemon
WHERE EXISTS 
(SELECT * FROM Types
WHERE (Type=Pokemon.Type1 or Type=Pokemon.Type2) AND Bug=2);				

-- 2 show names of moves learnt by tm/hm 
SELECT Name FROM move_descriptions
WHERE EXISTS 
(SELECT m2.MID FROM moves_by_tm_or_hm as m2 
where m2.MID=move_descriptions.MID);

-- 3 show pokemon names whose total base stats are greater than 500
SELECT Name FROM Pokemon
WHERE 
(SELECT HP+ATK+DEF+SPATK+SPDEF+SPD AS Total FROM Base_Stats
WHERE Base_Stats.ID=Pokemon.ID)>500;

-- 4 show name and power of moves learnt by leveling by pokemon "Bulbasaur
SELECT m1.Name, m1.Power FROM move_descriptions m1, moves_by_leveling m2
where
m2.ID=(SELECT ID FROM Pokemon
WHERE (Name="Bulbasaur")) AND
m1.MID=M2.MID;

-- 5 show the name and base stats of pokemon having highest base stat in HP
SELECT Pokemon.ID, HP, ATK, DEF, SPATK, SPDEF, SPD FROM Pokemon, base_stats
WHERE Pokemon.ID IN
(SELECT ID FROM base_stats
WHERE HP=(SELECT MAX(HP) from base_stats)) AND
Pokemon.ID=Base_Stats.ID;

-- 6 show the id, name and base stats of all pokemon
SELECT Pokemon.Name, Base_Stats.*
FROM 
Pokemon RIGHT JOIN Base_Stats
ON Pokemon.ID=Base_Stats.ID;

-- 7 show the average base stats of every available primary type
SELECT Pokemon.Type1, AVG(HP), AVG(ATK), AVG(dEF), AVG(SPATK), AVG(SPDEF), AVG(SPD) FROM
Pokemon RIGHT JOIN Base_Stats
ON Pokemon.ID=Base_Stats.ID
GROUP BY Pokemon.Type1;

-- 8 show the highest power move that does 0.5x damage on flying
select MAX(Move_descriptions.Power) FROM Move_descriptions
WHERE Move_Descriptions.Name in
(SELECT Move_descriptions.Name from
Move_descriptions RIGHT JOIN Types
ON Move_descriptions.Type=Types.Type
WHERE Types.FLY=0.5); 

-- 9 show moves learnt by tm or hm for pokemon with highest spd stat
SELECT Moves_by_tm_or_hm.* FROM Moves_by_tm_or_hm, 
Pokemon RIGHT JOIN Base_stats
ON Pokemon.ID=Base_Stats.ID
WHERE Pokemon.ID=Moves_by_tm_or_hm.ID AND
SPD IN
(SELECT MAX(SPD) FROM Base_stats);

-- 10 create a view showing pokemon with hidden ability along with their base stats
create view v as
select pokemon.name, base_stats.* from 
pokemon right join base_stats on pokemon.id=Base_Stats.id
WHERE pokemon.AbilityH is not null;

select * from v;
