
# Pyoro


This is my attempt at recreating Pyoro, a game that originated from the WarioWare series.

My gameplay logic will be largely based off of the findings found on [Squid's blog](https://n64squid.com/homebrew/roms/pyoro-64/).


## Gameplay Logic

The goal of the game is to accrue points. This is an arcade game, so it cannot be "beaten".

The player moves along a row of tiles at the bottom of the screen. Sprouts of different types will spawn and fall from the top of the screen at a random horizontal position. The player is able to stick out their tongue to eat the sprouts as they fall from the sky, and this is how points are obtained. Sprouts appear to spawn at a consistent rate, where the interval only decreases as the player scores more points. If a sprout is able to collide with a tile at the bottom of the screen, the sprout and the tile gets destroyed. The player can neither jump nor fall off ledges, so destroyed tiles greatly decreases mobility. Tiles can be respawned by eating white and rainbow coloured sprouts. The game is over when a sprout collides with player.

### Sprout Types

**Green Sprout**: This is the normal type of sprout.

**White Sprout**: Eating this type of sprout respawns the nearest destroyed tile. It appears to have a 20% chance of spawning.

**Rainbow Sprout**: Eating this type of sprout respawns the nearest 10 destroyed tiles and destroys all other sprouts on screen at the time of eating it for 50 points each. It appears to have a 10% chance of spawning, but only after the player achieves 5,000 points. They also fall slower than the other two types of sprouts.

### Point System

Points are based on how high sprout is when the player eat them.

- Sprouts eaten directly above the player score **10 points**.
- Sprouts eaten below halfway down the screen score **50 points**.
- Sprouts eaten above halfway down the screen score **100 points**.
- Sprouts eaten a few seconds after they spawn score **500 points**.
- Sprouts eaten right as they spawn score **1000 points**.


## Feature Checklist

### Pyoro 1

- [x] add tiles
- [x] add sprouts
- [x] add player
- [x] add tile destruction
- [x] add ability to eat sprouts
- [x] add tile replenishing
- [x] add scoring
- [x] add difficulty scaling
- [ ] add life system
- [ ] add pausing
- [ ] add sprites
- [ ] add sounds
- [ ] add highscores
- [ ] add main menu
- [ ] add settings
- [ ] add sound settings
- [ ] add configurable controls
- [ ] add configurable screen size

### Pyoro 2

- [ ] add pyoro 2
- [ ] replace tongue with blowing
- [ ] replace scoring system with combo system
- [ ] add 2 player mode

### Pyoro 3

- [ ] add rings
- [ ] add customizable level layout
- [ ] add levels
- [ ] add level editor
- [ ] add enemies
- [ ] add other mechanics


## Acknowledgements

- [Pyoro 64 - N64 Squid](https://n64squid.com/homebrew/roms/pyoro-64/)
- [Pyoro (minigame) - Super Mario Wiki](https://www.mariowiki.com/Pyoro_(minigame))
- [Pyoro 2 - Super Mario Wiki](https://www.mariowiki.com/Pyoro_2)
- [Super Pyoro - Super Mario Wiki](https://www.mariowiki.com/Super_Pyoro)
- [The History of Pyoro from WarioWare and His Minigames - YouTube](https://youtu.be/qlfjt4uRZI8)