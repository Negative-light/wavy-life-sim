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
- Creature Parts shall be rotatable.

## Inital Design

### Creature Lifetime

During the simulation the creature will go through a few stages. If we treated a set of actions as a day this is how craetures would act.

```mermaid
graph LR
    START([Wake-up])-->
    A[Check Life Stats]-->B[Move]-->C[Activate Parts]-->D{Under Attack}
    D-->|YES|E[Activate Defenses]-->END
    D-->|NO|END
    END([Sleep])

    END-->START
```

### Inital Classes

The following classes would be needed based on our inital analysis. Please see the [State of Completion Section](#state-of-completion).

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

Wave Function Collapse is similar to filling a empty Sodoku board. Start by picking a cell and filling it with a random value. This changes a Block, Row and Column to have one less possible values. In other terms the cells in the effect Block, Row and Column have lower **entory**. In Wavefunciton collapse you pick on of these lower entropy cells and set a new value. This cycle repeats until the last cell on the board is filled.

Commonly Wavefunction collpase will use a image as a baseline to determin what pieces can connect. Then rules are dynamically generated based on a window size (typeically 3x3) of a a pixelart image. This dynamic rule genration is useful for us, but it doesn't neccesarily work this way since our parts do not rely on a visual model.

Because the parts of the creatures should be rotatable we need to be able to generate a dynamic set of rules based on

1. The Inital Parts connections
2. The Secondary Parts connections

This will give us a allowed and denied list of locations.

For the sake of simplification the design decision was made to have all parts exist on a grid and for the time being the parts will not have any movment outside of the creatures movement.

## State of Completion

- [x] Creature Parts
- [ ] Effects System
- [ ] Wave Function Collapse Algorithm
- [ ] Creature Gentic Algorithm
- [ ] Creature Brain

### Project Needs

Multithreading of part activation becuase there will be upwards of 100 parts for a creature. Since all of these will have a a number of actions.

Check on solutions to migration to Godot 4.0. This new version of Godot brings massive change and massive imporvments. Since this is a opensource game engine there may be existing tools. Exploration should be done to find these.
