# Test Plans

This document is the high level test paln for the overall project. This includes integration testing of the Creature, Parts and GUI of the system.

## Creature
- Spawn a new creature
- Each of the parts should be connecting only to and by connectable sides
- All the parts initEffects should activate immediately and the attributes should be modified accordingly
- The Creature should automatically move a certain distance reducing it's energy attribute based on the distance traveled. It can only move as far as it has energy. It also doesn't have to use all of it's energy.
- All the parts should move and rotate together.
- The Creature should deal damage to other creatures when it is touching them with a damaging part.
- If the creature is in contact with another creatures damaging part, it should trigger its attacked signal and activate defense effects and take damage.
- The creature should sleep gaining back some of its energy
- Setting the creature's health to 0 should kill it causing it to despawn.
- Setting the creature's hunger to 0 should cause the creature to start taking damage.


## New Part
- Add new part to creature
- Part should appear and only connect on one of it's connectable sides
- The initEffect of the part should be activated modifying the creatures cooresponding attribute by the specified amount only once.
- The active effect should continuously activate each "turn" modifying the cooresponding attributes
- The defense effect should activate if the creature is under attack.


## GUI
- Start of opening game default state is paused
- Clicking the play button changes the state to active, highlighting the play button and greying out the pause button
- The Game should now start
- Clicking the pause button changes the state to pause, highlighting the pause button and greying out the play button
- All the creatures should freeze
