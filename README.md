
# Pyoro


This is my attempt at recreating Pyoro, a game that originated from the WarioWare series.

My gameplay logic will be largely based off of the findings found on Squid's blog[^1].


## Gameplay Logic

The goal of the game is to accrue points. This is an arcade game, so it cannot be "beaten".

The player moves along a row of tiles at the bottom of the screen. Sprouts of different types will spawn and fall from the top of the screen at a random horizontal position. The player is able to stick out their tongue to eat the sprouts as they fall from the sky, and this is how points are obtained. Sprouts appear to spawn at a consistent rate, where the interval only decreases as the player scores more points. If a sprout is able to collide with a tile at the bottom of the screen, the sprout and the tile gets destroyed. The player can neither jump nor fall off ledges, so destroyed tiles greatly decreases mobility. Tiles can be respawned by eating white and rainbow coloured sprouts. The game is over when a sprout collides with player.

### Sprout Types

**Green Sprout**: This is the normal type of sprout.

**White Sprout**: Eating this type of sprout respawns the nearest destroyed tile. It appears to have a 20% chance of spawning.

**Rainbow Sprout**: Eating this type of sprout respawns the nearest 10 destroyed tiles and destroys all other sprouts on screen at the time of eating it for 50 points each. It appears to have a 10% chance of spawning, but only after the player achieves 5,000 points.

### Point System

Points are based on how high sprout is when the player eat them.

- Sprouts eaten directly above the player score **10 points**.
- Sprouts eaten below halfway down the screen score **50 points**.
- Sprouts eaten above halfway down the screen score **100 points**.
- Sprouts eaten a few seconds after they spawn score **500 points**.
- Sprouts eaten right as they spawn score **1000 points**.


## Acknowledgements

[^1]: [Pyoro 64 - N64 Squid](https://n64squid.com/homebrew/roms/pyoro-64/)
[^2]: [Pyoro (minigame) - Super Mario Wiki](https://www.mariowiki.com/Pyoro_(minigame))
[^3]: [Pyoro 2 - Super Mario Wiki](https://www.mariowiki.com/Pyoro_2)
[^4]: [Super Pyoro - Super Mario Wiki](https://www.mariowiki.com/Super_Pyoro)