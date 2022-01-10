struct Colony: CustomStringConvertible{
  var colonySize: Int
  var num: Array2DS
  var array: Array2DS
  init(colonySize: Int){
    self.colonySize = colonySize
    num = Array2DS(numberRows: colonySize, numberCols: colonySize)
    array = Array2DS(numberRows: colonySize, numberCols: colonySize)
    //self.colonySize = colonySize
    //array = Array2DS(numberRows: colonySize, //numberCols: colonySize)
 }


  func helper(xCoor: Int, yCoor: Int)-> Int{
   let a = num[xCoor-1,yCoor]+num[xCoor,yCoor-1]
   let b = num[xCoor+1,yCoor]+num[xCoor,yCoor+1]
   let c = num[xCoor+1,yCoor+1]+num[xCoor-1,yCoor-1]
   let d = num[xCoor-1,yCoor+1]+num[xCoor+1,yCoor-1]
   let e = a+b+c+d
   return e
 }


 var numberLivingCells: Int {
   var living = 0
   for x in 0...(colonySize-1){
     for y in 0...(colonySize-1){
       if isCellAlive(xCoor: x, yCoor: y) == true{
         living += 1
       }
     }
   }
   return living 
 }


 mutating func setCellAlive(xCoor: Int, yCoor: Int){
   array[xCoor, yCoor]=1
 }


 mutating func setCellDead(xCoor: Int, yCoor: Int){
   array[xCoor,yCoor]=0
 }


 mutating func resetColony(){
   for x in 0...(colonySize-1){
     for y in 0...(colonySize-1){
       array[x,y] = 0
     }
   }
 }


 var description: String{
   return array.description
 }

 func isCellAlive(xCoor: Int, yCoor: Int) -> Bool{
  if array[xCoor, yCoor] != 0{
    return true
  } else{
    return false
  }
 }


 mutating func evolve(){
   for x in 0..<array.numberRows{
     for y in 0..<array.numberCols{
       if (helper(xCoor:x, yCoor:y))==3{
         array[x,y] = 1
       } else if (helper(xCoor:x, yCoor: y))>3{
         array[x,y] = 0
       } else if array[x,y] == 1{
         array[x,y] = 1
       } else if (helper(xCoor:x, yCoor:y)) < 2{
         array[x,y] = 0
       } else{
         array[x,y] = 0
       }
     }
   }
   num = array
 }



}

/*
 mutating func evolve(row: Int, col: Int){
   let goUP = array.get(row: row + 1, col: col)
   let goDOWN = array.get(row: row-1, col: col)
   let goRIGHT = array.get(row: row, col:col+1)
   let goLEFT = array.get(row: row, col:col-1)
   let first = array.get(row:row+1, col:col+1)
   let second = array.get(row:row-1, col:col-1)
   let third = array.get(row: row-1, col: col+1)
   let fourth = array.get(row:row+1, col: col-1)
   if goUP + goDOWN + goRIGHT + goLEFT + first + second + third + fourth > 3 || goUP + goDOWN + goRIGHT + goLEFT + first + second + third + fourth < 2{
     setCellDead(xCoor:col, yCoor: row)
   } else if goUP + goDOWN + goRIGHT + goLEFT + first + second + third + fourth == 3{
     setCellAlive(xCoor: col, yCoor: row)
   }
 }

 mutating func secondEvolve() {
   for abc in 0...array.numberCols-1{
     for xyz in 0...array.numberRows-1{
       evolve(row: xyz, col: abc)
     }
   }
   print(array)
 }

*/