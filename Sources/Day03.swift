import Algorithms
import Foundation

struct Day03: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [(Int, Int)] {
    let regexPattern = #"(do\(\)|don't\(\)|mul\((\d+),(\d+)\))"#
    let regex = try? NSRegularExpression(pattern: regexPattern)
    let matches = regex?.matches(in: data, range: NSRange(data.startIndex..., in: data)) ?? []
    print(matches)
    var results: [(Int, Int)] = []
    var isEnabled = true
    for match in matches {
      let range = Range(match.range, in: data)!
      let matchString = String(data[range])
//      print(matchString)
      if matchString == "do()" {
        isEnabled = true
      } else if matchString == "don't()" {
        isEnabled = false
      }
      guard isEnabled else { continue }
      
      guard let xRange = Range(match.range(at: 2), in: data),
            let yRange = Range(match.range(at: 3), in: data),
            let x = Int(data[xRange]),
            let y = Int(data[yRange]) else { continue }
      results.append((x, y))
    }
    return results
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    var total = 0
    for entity in entities {
      total += entity.0 * entity.1
    }
    return total
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    var total = 0
    for entity in entities {
      total += entity.0 * entity.1
    }
    return total
  }
}
