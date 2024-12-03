import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: ([Int], [Int]) {
    // split data into two arrays, left side and right side
    let splitData = data.split(separator: "\n")
    let firstArray = splitData.map { Int($0.split(separator: " ")[0])! }
    let secondArray = splitData.map { Int($0.split(separator: " ")[1])! }
    return (firstArray, secondArray)
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    let (first, second) = entities
    assert (first.count == second.count)
    
    // sort arrays in ascending order
    let sortedFirst = first.sorted()
    let sortedSecond = second.sorted()
    
    var totalDistance = 0
    for i in 0..<first.count {
      let distance = max(sortedFirst[i], sortedSecond[i]) - min(sortedFirst[i], sortedSecond[i])
      totalDistance += distance
//      print("[1]: \(sortedFirst[i]) [2]: \(sortedSecond[i]) [D]: \(distance)")
    }
    
    return totalDistance
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    let (first, second) = entities
    
    var countArray = [Int]()
    for x in first {
      let count = second.filter { $0 == x }.count
      countArray.append(count)
    }

    var total = 0
    for i in 0..<first.count {
      total += first[i] * countArray[i]
//      print ("[F]: \(first[i]) [C]: \(countArray[i]) [T]: \(first[i] * countArray[i])")
    }
    return total
  }
}
