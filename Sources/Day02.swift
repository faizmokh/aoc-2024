import Algorithms

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    let reports = entities.map { Report(levels: $0) }
//    for report in reports {
//      print("[L] \(report.levels) [S] \(report.isSafe) [A] \(report.isAdjacentSafe) [O] \(report.isSorted)")
//    }
      
    return reports.filter { $0.isSafe }.count
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    let reports = entities.map { Report(levels: $0) }
    
    return reports.filter { $0.isProblemDampenerSafe }.count
  }
}

extension Day02 {
  struct Report {
    let levels: [Int]
        
    var isSafe: Bool {
      return isSorted && isAdjacentSafe
    }
    
    var isSorted: Bool {
      return levels.sorted() == levels || levels.sorted() == levels.reversed()
    }
    
    var isAdjacentSafe: Bool {
      return levels.sorted().adjacentPairs()
        .allSatisfy { $1 - $0 >= 1 && $1 - $0 <= 3 }
    }
    
    var isProblemDampenerSafe: Bool {
      for i in 0..<levels.count {
        var copyLevel = levels
        // remove item at index i and see if the report is still safe
        copyLevel.remove(at: i)
        let report = Report(levels: copyLevel)
        if report.isSafe {
          return true
        } else {
          continue
        }
      }
      return false
    }
  }
}
