# DBMS Lab Project

## Pokedex

## Tables:

- Pokemon
    - ID: int **(PK)**
    - Name: string
    - ImageF: image (references Images.Front)
    - ImageB: image (references Image.Back)
    - Type1: string (references Types.Name)
    - Type2: string (references Types.Name)
    - Ability1: string (references Abilities.Name)
    - Ability2: string (references ABilities.Name)
    - AbilityH: string (references Abilities.Names)
      
- Types
    - Name: char **(PK)**
    - Compatibility: int[18]
    
- Images
    - ID: int **(PK)**
    - Front: image
    - Back: image
    
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
    
- Base Stats
    - ID: int **(PK)**(references Pokemon.ID)
    - HP: int
    - ATK: int
    - DEF: int
    - SPATK: int
    - SPDEF: int
    - SPD: int
    
- Move Descriptions
    - MID: int **(PK)** 
    - Name: string
    - Type: string (references Types.Name)
    - Power: int
    - Accuracy: int
    - Details: string
    
- Moves by leveling
    - ID: int **(PK)**(references Pokemon.ID)
    - MID: int **(PK)**(references Moves.MID)
    - Level: int
    
- Move by TM/HM
    - ID: int **(PK)**(references Pokemon.ID)
    - MID: int **(PK)**(references Moves.MID)
    - TM/HM_no: string
    
- Moves by Tutor
    - ID: int **(PK)**(references Pokemon.ID)
    - MID: int **(PK)**(references Moves.MID)

## Relations:

- *Pokemon* have *Types*
- *Pokemon* have *Images*
- *Pokemon* have *Abilities*
- *Pokemon* grow acccording to *Base Stats*
- *Pokemon* yield *EVs*
- *Pokemon* learn *Moves by Leveling*
- *Pokemon* learn *Moves by TM/HM*
- *Pokemon* learn *Moves by Tutor*
- *Moves by Leveling/TM/TM/Tutor* have *Move Descriptions*