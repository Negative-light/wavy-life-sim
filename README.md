# wavy-life-sim

This is a school project the goal is to make a LIfe Simulation that uses Wave Funciton Collapse.

Check out our [discord](https://discord.gg/vJMGvk5KaZ)!

To see our project backlog [click here](https://github.com/users/Negative-light/projects/1)

## Inital Concept

Use a Wave Function collapse algorithm to generate the body of creatures that survive in a artifical life simulation.

This is a novel use of the Wave Function Collapse Algorithm which is typically used to generate unique structures, puzzels and

## Project Requirments

- Creatures shall have a body generated using Wave Function Collapse
- A genetic algorithm shall be used for the weights on rules

## Inital Design

### Creature Lifetime

```mermaid
stateDiagram-v2
    [*]-->CHECK_STATUS

    MOVE-->ACTIVATE_PART
    ACTIVATE_PART-->PICK_NEXT_PART



    CHECK_STATUS-->MOVE


    state CHECK_STATUS {
        [*]-->IS_ALIVE
        IS_ALIVE-->UNDER_ATTACK:YES
        UNDER_ATTACK-->ACTIVATE_DEFENSES: YES
        UNDER_ATTACK-->[*]:NO
        ACTIVATE_DEFENSES-->[*]

        state ACTIVATE_DEFENSES {
            [*]-->ACTIVATE_ALL_PARTS
            ACTIVATE_ALL_PARTS-->CHECK_ENERGY
            CHECK_ENERGY-->CHECK_HEALTH
            CHECK_HEALTH-->IS_STILL_ALIVE
            IS_STILL_ALIVE-->[*]: YES
        }
    }
    IS_STILL_ALIVE-->[*]:NO
    IS_ALIVE-->[*]:NO
    PICK_NEXT_PART-->UPDATE_STATS
    UPDATE_STATS-->CHECK_STATUS
```

### Inital Classes

```mermaid
classDiagram
    creature --> "*" part
    creature --> "1" ruleset
    creature --> "1" brain

    ruleset --> "*" rule


    class part {
        + Bool[4] *Faces -> IF A FACE IS AVALIBLE
        + Vector2D direction
        + Vector2D position
        - float *energyUsage
        - float *weight
        + _activeEffect()
        + _defenseEffect()
        + _initEffect() -> Used to increase/decrease values of creature
    }

    class rule {
        + part Base
        + part Connection
        + Vector2D direction
    }

    part --|> spike
    part --|> void
    part --|> hand
    hand --|> claw
    claw --|> mouth

    part --|> leg

    part --|> Armor

    class Armor {
        + _defenseEffect() -> IF This part is being attacked absorbe damage
    }

    class leg {
        float speed
        - flaot *energyUseage = 2.0
        + _initEffect() -> Add speed to player velocity (Useage = speed*energyUsage)
    }
    leg --|> powerLeg
    class powerLeg {
        bool isSprinting
        + _activeEffect() -> Add 2*speed IF isSprinting
    }

    class spike {
        - float *energyUsage = 1.0
        + _doEffect() -> IF Touching Other Creature Reduce Health
        + Bool[4] *Faces[False, False, True, Flase]
    }

    class hand {
        - float *energyUseage = 1.0
        + bool isClosed
        + Node isHolding
        + _activeEffect -> If Somthing is there grab it
        + Bool[4] *Faces[False, False, True, False]
    }

    class claw {
        + _activeEffect() -> If Holding A Creature Damage it
    }

    class hand {
        + _doEffect() -> If Holding food Consume it
    }

    class creature {
        + float hunger -> if < 0 then reduce health
        + float health -> if < 0 then dead
        + float energy
        + bool dead
        + bool asleep
        + bool canReproduce
        + int gender
        + float totalWeight
        + Vector2D position
        + Vecotr2D direction
        + Vector2D velocity
        + Move()

    }



    class Food {
        + float energy
        + Vecotr2D position
    }


    class NOTES {
        <<note>>
        At the start all connection types will be generated.
        Order does not matter.
        Therefore we would generate
        A Parts direction is set to be in line w/ the generated direction in the rule
        Ruleset will be generated at the begining of the simulation
    }
```

### Wave Function Collapse Alogrithm

```mermaid
graph TD
    %%RULE GENERATION%%
    START-->A
    A(Grab Next Part)-->B(Get Next Face)-->C{Can Place}
    C--->|YES|D(Grab Next Part)
    subgraph CHECK Connection
        D-->E(Get Opposite Face)-->F{Can Place}
        F-->|YES|G(Create Rule)-->H{Last Part}
        F-->|NO|H
        H-->|NO|D
    end

    H-->|YES|I{Last Face}
    I-->|NO|B
    I-->|YES|J{Last Part}
    J-->|NO|A
    J-->|YES|K[[Create Creatures]]-->END
```

## State of Completion

- [x] Creature Parts
- [ ] Effects System
- [ ] Wave Function Collapse Algorithm
- [ ] Creature Gentic Algorithm
- [ ] Creature Brain
