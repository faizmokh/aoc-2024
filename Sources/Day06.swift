import Algorithms

struct Day06: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Character]] {
    return data.split(separator: "\n").map { Array($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    var map = entities
    var gc = getGuardCoordinate(map: map)
    
    // up, right, down, left
    let directions = [(0, -1), (1, 0), (0, 1), (-1, 0)]
    var currentDirection = 0
    
    while true {
      map[gc.y][gc.x] = "X"
      
      let (dx, dy) = directions[currentDirection]
      let nextX = gc.x + dx
      let nextY = gc.y + dy
      
      // check if out of bounds
      if nextY < 0 || nextY >= map.count || nextX < 0 || nextX >= map[nextY].count {
        break
      }
      
      // check if hit wall and turn right
      if map[nextY][nextX] == "#" {
        currentDirection = (currentDirection + 1) % 4
        continue
      }
      
      gc.x = nextX
      gc.y = nextY
    }
        
//    prettyPrint(map)
    
    return getUniqueTrailCount(map: map)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    return 0
  }
}

private extension Day06 {
  func getUniqueTrailCount(map: [[Character]]) -> Int {
    var count = 0
    for row in map {
      for cell in row {
        if cell == "X" {
          count += 1
        }
      }
    }
    return count
  }

  func getGuardCoordinate(map: [[Character]]) -> (x: Int, y: Int) {
    for (y, row) in map.enumerated() {
      for (x, cell) in row.enumerated() {
        if cell == "^" {
          return (x, y)
        }
      }
    }
    return (0, 0)
  }
  
  func prettyPrint(_ map: [[Character]]) {
    for row in map {
      print(row.map { String($0) }.joined())
    }
  }
}
