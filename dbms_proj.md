# DBMS Lab Project

## Pokedex

## Tables:

- Pokemon
    - ID: int **(PK)**
    - Name: string
    - Type1: string (references Types.Type)
    - Type2: string (references Types.Type)
    - Ability1: string (references Abilities.Name)
    - Ability2: string (references Abilities.Name)
    - AbilityH: string (references Abilities.Name)
      
- Types
    - Type: string **(PK)**
    - Compatibility: int[18]
    
- Images
    - ID: int **(PK)**(references Pokemon.ID)
    - Front: string (url to image)
    
- Abilities
    - Name: string **(PK)**
    - Effect: string

- EV
    - ID: int **(PK)**(references Pokemon.ID)
    - HP: int
    - ATK: int
    - DEF: int
    - SPATK: int
    - SPDEF: int
    - SPD: int
    
- Base_Stats
    - ID: int **(PK)**(references Pokemon.ID)
    - HP: int
    - ATK: int
    - DEF: int
    - SPATK: int
    - SPDEF: int
    - SPD: int
    
- Move_Descriptions
    - MID: int **(PK)** 
    - Name: string
    - Type: string (references Types.Type)
    - Power: int
    - Accuracy: int
    - Details: string
    
- Moves_by_Leveling
    - ID: int **(PK)**(references Pokemon.ID)
    - MID: int **(PK)**(references Move_Descriptions.MID)
    - Level: int
    
- Move_by_TM_or_HM
    - ID: int **(PK)**(references Pokemon.ID)
    - MID: int **(PK)**(references Move_Descriptions.MID)
    - TM_or_HM: string
    
- Moves_by_Tutor
    - ID: int **(PK)**(references Pokemon.ID)
    - MID: int **(PK)**(references Move_Descriptions.MID)

## Relations:

- *Pokemon* have *Types*
- *Pokemon* have *Images*
- *Pokemon* have *Abilities*
- *Pokemon* grow acccording to *Base_Stats*
- *Pokemon* yield *EVs*
- *Pokemon* learn *Moves_by_Leveling*
- *Pokemon* learn *Moves_by_TM/HM*
- *Pokemon* learn *Moves_by_Tutor*
- *Moves_by_Leveling/TM/TM/Tutor* have *Move Descriptions*