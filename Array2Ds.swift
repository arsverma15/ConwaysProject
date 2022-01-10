import Foundation
struct Array2DS : CustomStringConvertible {
  var values : [Int] = []
  var numberRows: Int
  var numberCols: Int

  init(numberRows: Int, numberCols: Int){
    self.numberCols = numberCols
    self.numberRows = numberRows
    //self.values = [Int]()
    for _ in 0..<(numberRows * numberCols){
      values.append(0)
    }
  }


  func index(row: Int, col: Int) -> Int{
    let _ = numberCols
    let index = numberCols * row + col
    if check(row: row, col: col) == true{
      return(index)
    } else{
      return(3)
    }  
  }



  func check(row: Int, col: Int)-> Bool {
    if col > numberCols - 1{
      return(false)
    } else if row > numberRows - 1 {
      return (false)
    } else if col < 0{
      return (false)
    } else if row < 0{
      return (false)
    } else{
      return (true)
    }
  }


  mutating func set(row: Int, col: Int, val: Int){
    if check(row: row, col: col) == true{
      if val == 0 || val == 1{
        values[index(row: row, col: col)] = val
      }
    }
  }

  func get(row: Int, col: Int) -> Int{
    if check(row: row, col: col) == false{
      return 0
    }
    return (values[index(row: row, col: col)])
  }

  var description: String {
    var mystr = ""
    for row in 0..<numberRows{
      for col in 0..<numberCols{
        let val = values[index(row: row, col: col)]
        if val == 0{
          mystr += " . "
        } else if val == 1{
          mystr += " * "
        }
      }
      mystr += "\n"  
    }
    return mystr
  }



  subscript(row: Int, col: Int) -> Int{
    get {
      return self.get(row: row, col: col)
    } set (newval) {
      self.set(row: row, col: col, val: newval)
    }
  }
  
}


/*Get retrieves the number stored in The array
(Everything defaults to 0 at the beginning)
Set allows the user to change what is stored into the given value */