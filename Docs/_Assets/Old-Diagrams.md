## Inital Creature Actions List

This was the original concept of the creatues "daily" activities this has since been simplfied due to changes in the parts class.

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

## Inital Wave Fuinction Collapse Algorithm

This was the original concept for the Wave Funciton Collapse Algoirthm. This does not follow the actual model for a wave function collapse algoirhtm leading to design issues.

This would be a good design for a random body generator. A key funciton of Wave Funciton collapse is taking advantage of the concept of entropy.

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
