import Algorithms

struct Day04: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Character]] {
    return data.split(separator: "\n").map { Array($0) }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    print(entities)
    // Calculate the sum of the first set of input data
    return 0
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    return 0
  }
}
