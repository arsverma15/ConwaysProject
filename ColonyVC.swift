import Foundation
struct ColonyVC{
  var d: Colony
  init(){
    print("Colony Size", terminator:"...")
    let mySize = Int(readLine()!)
    d = Colony(colonySize : mySize!)
  }


  mutating func coordinates(){
    print("Enter x y coordinates of living cells, blank line when done")
    print("Coor", terminator:": ")
    var nums = splitStringIntoParts(readLine()!)
    if nums.isEmpty{
      print("Running evolution.")
    } else{
        var xCoor = Int(nums[0])!
        var yCoor = Int(nums[1])!
        while nums.isEmpty == false{
          d.setCellAlive(xCoor: xCoor, yCoor: yCoor)
          xCoor = Int(nums[0])!
          yCoor = Int(nums[1])!
          print("Coor", terminator:": ")
          nums = splitStringIntoParts(readLine()!)
          if nums.isEmpty ==  false{
            xCoor = Int(nums[0])!
            yCoor = Int(nums[1])!
          } else{
              print("Running Evolution.")
              getCommand()
          }
        }
      }
    }


  mutating func newevolveVC(){
    print("Command", terminator:"...")
    var command = readLine()!
    var gen = 0
    while (command != "Q" && command != "q"){
      if Int(command)==nil{
        gen += 1
        print("Generation #\(gen)")
        d.evolve()
        print(d)
        print("Command", terminator:"...")
        command = readLine()!
      } else{
          let myInt = Int(command)!
          for _ in 1...myInt{
            gen+=1
            print("Generation #\(gen)")
            d.evolve()
            print(d)
          }
          print("Command", terminator:"...")
          command = readLine()!
        }
    }
    print("Program ended with exit code: 0")
  }


  mutating func getCommand(){
    print("Commands are: \nEnter an Int, evolve that number generation \nQ, quit \nAny other text evolve one generation \nGeneration #0")
    print(d)
    newevolveVC()
  }

  func splitStringIntoParts(_ f: String) -> [String]{
    return f.split{$0 == " "}.map{ String($0) }
  }




}


/*

  mutating func newevolveVC(){
    print("Commands are: \nEnter an int, evolve that number generation \nQ, quit \nGeneration #0")
    print(d)
    var gen = 0
    var command = getCommand()
    while command[0] != "q"{
      if Int(command[0]) != nil && Int(command[0])! > 1 {
        for _ in 1...Int(command[0])! {
          gen += 1
          print("Generation #\(gen)")
          d.evolve()
        }
      } else{
        gen += 1
        print("Generation #\(gen)")
        d.evolve()
      }
      command = getCommand()
    }
    print("program exited with exit code = 0")
  }



  mutating func coordinates(){
    print("Enter x y coordinates of living cells, blank line when done")
    var coordinates = "does it matter"
    while coordinates != ""{
      print("Coor", terminator: ": ")
      coordinates = readLine()!
      let splitCoordinates = splitStringIntoParts(coordinates)
      if coordinates == ""{
        print("Got it!")
      } else {
        d.setCellAlive(xCoor: Int(splitCoordinates[0])!, yCoor: Int(splitCoordinates[1])!)
      }
    }
    print("Running evolution")
    newevolveVC()
  }



  func getCommand() -> [String] {
    print("Command...", terminator: " -> ")
    let userinput1 = readLine()!
    let userinput2 = splitStringIntoParts(userinput1)
    return userinput2
  }


  */