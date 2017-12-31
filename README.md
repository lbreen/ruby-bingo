# Bingo

Classic game of Bingo! built with plain Ruby.

## Description

The game creates a 5x3 board from random numbers between 1 and 49.

Example:
```
+ -- + -- + -- + -- + -- +
| 01 | 12 | 25 | 30 | 43 |
+ -- + -- + -- + -- + -- +
| 04 | 13 | 28 | 35 | 44 |
+ -- + -- + -- + -- + -- +
| 06 | 19 | 29 | 37 | 49 |
+ -- + -- + -- + -- + -- +
```

Then proceeds to randomly select numbers, within the above range, and replace any successful numbers with a 'XX'.

Example:
```
selected_numbers = [05, 13, 37, 42]

+ -- + -- + -- + -- + -- +
| 01 | 12 | 25 | 30 | 43 |
+ -- + -- + -- + -- + -- +
| 04 | XX | 28 | 35 | 44 |
+ -- + -- + -- + -- + -- +
| 06 | 19 | 29 | XX | 49 |
+ -- + -- + -- + -- + -- +
```

Once all the numbers on the board have been selected the player has "BINGO!".

Example:
```
+ -- + -- + -- + -- + -- +
| XX | XX | XX | XX | XX |
+ -- + -- + -- + -- + -- +
| XX | XX | XX | XX | XX |
+ -- + -- + -- + -- + -- +
| XX | XX | XX | XX | XX |
+ -- + -- + -- + -- + -- +

**BINGO!!**
```

Future releases will add additional players

