import Algorithms

struct Day05: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: (rule: [Rule], pages: [Pages]) {
    let components = data.components(separatedBy: "\n\n")
    guard components.count >= 2 else { return ([], []) }
    let ruleStrings = components[0].trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n")
    let rules = ruleStrings.compactMap { line -> Rule? in
      let parts = line.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "|")
      guard parts.count == 2,
            let x = Int(parts[0].trimmingCharacters(in: .whitespacesAndNewlines)),
            let y = Int(parts[1].trimmingCharacters(in: .whitespacesAndNewlines)) else {
        return nil
      }
      return Rule(x: x, y: y)
    }
    let pageStrings = components[1].trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n")
    let pages = pageStrings.map { line -> Pages in
      let updates = line.components(separatedBy: ",")
        .compactMap { Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
      return Pages(updates: updates)
    }
    
    return (rules, pages)
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    let (rules, pages) = entities
    var newPages = [Pages]()
    for page in pages {
      let isValid = checkIfValid(updates: page.updates, rules)
      if isValid {
        newPages.append(page)
      }
    }
    
    var total  = 0
    for page in newPages {
      guard let middle = page.updates.middle else { continue }
      total += middle
    }
    return total
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    let (rules, pages) = entities
    var newPages = [Pages]()
    for page in pages {
      let isValid = checkIfValid(updates: page.updates, rules)
      if !isValid {
        let newUpdates = sortedUpdates(page.updates, basedOn: rules)
        newPages.append(Pages(updates: newUpdates))
      }
    }
    
    var total  = 0
    for page in newPages {
      guard let middle = page.updates.middle else { continue }
      total += middle
    }
    return total
  }
}

extension Day05 {
  func sortedUpdates(_ updates: [Int], basedOn rules: [Rule]) -> [Int] {
    var sorted = updates
    var changed = true
    
    while changed {
      changed = false
      for rule in rules {
        if let xIndex = sorted.firstIndex(of: rule.x),
           let yIndex = sorted.firstIndex(of: rule.y),
           xIndex >= yIndex {
          sorted.swapAt(xIndex, yIndex)
          changed = true
        }
      }
    }
    return sorted
  }
  
  func checkIfValid(updates: [Int], _ rules: [Rule]) -> Bool {
    for rule in rules {
      let x = rule.x
      let y = rule.y
      // skip if either x or y are not in updates
      guard let xIndex = updates.firstIndex(of: x),
            let yIndex = updates.firstIndex(of: y) else {
        continue
      }
      
      if xIndex >= yIndex {
        return false
      }
    }
    return true
  }
    
  struct Rule {
    let x: Int
    let y: Int
  }
  
  struct Pages {
    let updates: [Int]
  }
}

extension Array {
    // https://stackoverflow.com/questions/50248752/select-middle-value-in-array-swift
    var middle: Element? {
        guard count != 0 else { return nil }

        let middleIndex = (count > 1 ? count - 1 : count) / 2
        return self[middleIndex]
    }
}
