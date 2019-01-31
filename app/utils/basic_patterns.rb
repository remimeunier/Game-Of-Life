# still :
BLOCK = { form: [[0,0], [1,1], [0,1], [1,0]], size: [2,2], name: 'Block', code: 1 }
BEEHIVE = { form:  [[1,0],[2,0],[0,1],[3,1],[1,2],[2,2]], size: [4,3], name: 'Beehive', code: 2 }
BOAT = { form: [[0,0],[1,0],[0,1],[2,1],[1,2]], size: [4,4], name: 'BOAT', code: 3 }
LOAF = { form:  [[1,0],[2,0],[2,0], [0,1], [3,1], [1,2], [3,2], [2,3]], size: [4,4],
         name: 'Loaf', code: 4 }
TUBE = { form: [[1,0], [0,1], [2,1], [1,2]], size: [3,3], name: 'Tube', code: 5 }
STILL = [BLOCK, BEEHIVE, BOAT, LOAF, TUBE]

# Oscillaters
BLINKER = { form: [[0,0],[1,0],[2,0]], size: [3,1], name: 'Blinker', code: 6, period: 2 }
TOAD = { form: [[1,0],[2,0],[3,0],[0,1],[1,1],[2,1]], size: [4,2],
         name: 'Toad', code: 7, period: 2 }
BEACON = { form: [[0,0], [1,1], [0,1], [1,0], [2,2], [2,3], [3,2], [3,3]], size: [4,4],
           name: 'Block', code: 8, period: 2 }
PULSAR = { form: [[2,0], [3,0], [4,0], [8,0], [9,0], [10,0],
                  [0,2], [5,2], [7,2], [12,2],
                  [0,3], [5,3], [7,3], [12,3],
                  [0,4], [5,4], [7,4], [12,4],
                  [2,5], [3,5], [4,5], [8,5], [9,5], [10,5],
                  [2,7], [3,7], [4,7], [8,7], [9,7], [10,7],
                  [0,8], [5,8], [7,8], [12,8],
                  [0,9], [5,9], [7,9], [12,9],
                  [0,10], [5,10], [7,10], [12,10],
                  [2,12], [3,12], [4,12], [8,12], [9,12], [10,12],
                  ], size: [12, 12], name: 'Pulsar', code: 9, period: 3 }
PENTADECATHLON = { form: [[1,0], [0,1], [1,1], [2,1],
                          [0,4], [1,4], [2,4],
                          [0,6], [2,6],
                          [0,7], [2,7],
                          [0,9], [1,9], [2,9],
                          [0,12], [1,12], [2,12],[1,13]
                         ], size: [3,13], name: 'Pentadecathlon', code: 10, period: 15 }
OSCILLATERS = [BLINKER, TOAD, BEACON, PULSAR, PENTADECATHLON]

# spaceships
GLIDER = { form: [[1,0], [2,1], [0,2], [1,2], [2,2]], size: [3,3], name: 'Glider', code: 11 }
LIGHTWEIGHT_SPACESHIP = { form: [[2,0], [3,0], [0,1], [1,1], [3,1], [4,1],
                                 [0,2], [1,2], [2,2], [3,2],
                                 [1,3], [2,3]], size: [5, 4],
                          name: 'Lightweight Spaceship', code: 12 }
HEAVYWEIGHT_SPACESHIP = { form: [[0,0], [1,0], [2,0], [3,0], [4,0], [5,0],
                                 [0,1], [6,1],
                                 [0,2],
                                 [1,3], [6,3],
                                 [3,4], [4,4]], size: [6, 4],
                          name: 'Heavyweight Spaceship', code: 13 }
SPACESHIPS = [GLIDER, LIGHTWEIGHT_SPACESHIP, HEAVYWEIGHT_SPACESHIP]

BASIC_PATTERNS_DISPLAY = [['Still', STILL],
                          ['Oscillaters', OSCILLATERS],
                          ['Spaceships', SPACESHIPS]]

ALL_PATTERNS = STILL + OSCILLATERS + SPACESHIPS
