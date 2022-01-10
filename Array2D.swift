import Foundation
struct Array2D : CustomStringConvertible{
  var values : [Int]
  var numberRows: Int
  var numberCols: Int

  init(numberRows: Int, numberCols: Int){
    self.numberCols = numberCols
    self.numberRows = numberRows
    self.values = [Int]()
    for _ in 0..<(numberRows * numberCols){
      values.append(0)
    }
  }


  func index(row: Int, col: Int) -> Int{
    let index = numberCols * row + col
    if outOfBounds(row: row, col: col) == true {
      return index
    } else {
      print("out of bounds")
      exit(0)
    }
  }



  mutating func set(row: Int, col: Int, val: Int){
    if val == 0 || val == 1{
      values[index(row: row, col: col)] = val
    } else {
      print("not a valid value")
      exit(0)
    }
  }

  func get(row: Int, col: Int) -> Int{
    return values[index(row: row, col: col)]
  }



  var description: String {
  var mystr = ""
  for row in 0...(numberRows-1){
    for col in 0...(numberCols-1){
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


    func outOfBounds(row: Int, col: Int)-> Bool {
    if col > numberCols - 1{
      print("the array doesn't have this many columns")
      return(false)
    } else if row > numberRows - 1 {
      print("the array doesn't have this many rows")
      return (false)
    } else if col < 0{
      print("there can't be any negative columns")
      return (false)
    } else if row < 0{
      print("there can't be any negative rows")
      return (false)
    } else{
      return (true)
    }
  }

  /*
  func outOfBounds(row: Int, col: Int){
    if row>(numberRows-1) || row<0{
      print("error: row has a minimum value of 0.")
    }
    if col > (numberCols-1) || col<0{
      print("error: columns has a minimum value 0.")
    }
    if row>(numberRows-1) || col>(numberCols-1) || row<0 || col<0{
      exit(0)
    }
  }

*/



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