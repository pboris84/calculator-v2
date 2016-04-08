//
//  main.swift
//  calculator-V2
//  This is a more complex calculator, with more complex functionality

//  Created by Boris Pavlov on 4/8/16.
//  Copyright © 2016 Boris Pavlov. All rights reserved.
//

import Foundation

print("Welcome to Boris's calculator :D")
print("-You can use the Standard calulator feature by entering a number, then an operation (+, -, *, /, %), then another number")
print("-You can use the Count feature like this: 10 4 25 17 5 count => 5")
print("-You can use the Average feature like this: 2 4 6 8 10 avg => 6")
print("-You can use the Factorial feature like this: 5 fact => 120 (one value only)")

print()
print("-To exit calculator please type \"exit\" ")

// Loops forever until you type exit
while (true) {
    print()
    print("Please enter something below:")
    
    var response = readLine(stripNewline: true)!
    response = response.lowercaseString
    response = response.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    
    if (response == "") {  // Empty No entry condition prevents errors
        
        
    } else if (response == "exit") {    // exit condition
        exit(0)
        
        // Standard Calculator
    } else {    // some value entered condition
        let userInput = response.characters.split{$0 == " "}.map(String.init) //split around spaces
        if (userInput.count == 1) {   // standard calculator entry Test: one input entered
            if (Int(userInput[0]) != nil) { // first value is convertable to int Test
                
                var firstInt = Int(userInput[0])
                print("Enter operation (+, -, *, /, %): ")
                var operationInput = readLine(stripNewline: true)!
                operationInput = operationInput.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                
                // Valid operator Test
                if (operationInput == "+" || operationInput == "-" || operationInput == "*" || operationInput == "/"  || operationInput == "%") {
                    var operation = operationInput
                    
                    print("Enter second value: ")
                    var secondValueInput = readLine(stripNewline: true)!
                    secondValueInput = secondValueInput.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                    
                    if (Int(secondValueInput) != nil) { // second value convertable to int Test
                        var secondInt = Int(secondValueInput)
                        
                        var finalResult = 0;
                        switch(operation) {     // Which operation to perform
                        case "+":
                            finalResult = firstInt! + secondInt!
                            print("\(firstInt!) " + operation + " \(secondInt!) = \(finalResult)")
                            
                        case "-":
                            finalResult = firstInt! - secondInt!
                            print("\(firstInt!) " + operation + " \(secondInt!) = \(finalResult)")
                            
                        case "*":
                            finalResult = firstInt! * secondInt!
                            print("\(firstInt!) " + operation + " \(secondInt!) = \(finalResult)")
                            
                        case "/":
                            if (secondInt == 0) {
                                print("Division by zero error!! Please reboot universe")
                            } else {
                                // decimals condition
                                var firstDouble = Double(firstInt!)
                                var SecondDouble = Double(secondInt!)
                                var finalresultDouble = Double(finalResult)
                                finalresultDouble = firstDouble / SecondDouble
                                print("\(firstInt!) " + operation + " \(secondInt!) = \(finalresultDouble)")
                            }
                            
                        case "%":
                            if (secondInt == 0) {
                                print("I refuse to let you modulo by zero, go home and think about what you did.")
                            } else {
                                finalResult = firstInt! % secondInt!
                                print("\(firstInt!) " + operation + " \(secondInt!) = \(finalResult)")
                            }
                            
                        default:
                            print("Invalid operation")
                        }
                    } else { // Second value invalid
                        print("Not a valid entry")
                    }
                } else {  // Valid operator test failed
                    print ("Invalid operation")
                }
            } else {   // First value invalid
                print("Not a valid entry")
            }
            
            // Count, Average, or Fractorial Feature
        } else if (userInput[userInput.count - 1] == "count") || (userInput[userInput.count - 1] == "avg") || (userInput[userInput.count - 1] == "fact") {
            var onlyValues: [Int] = [];
            let keyWord = userInput[userInput.count - 1]
            var exitCondition = false;
            for index in 0 ..< userInput.count - 1 {
                if (Int(userInput[index]) != nil) { // All Previous values are Ints Test
                    onlyValues.append(Int(userInput[index])!)
                    
                } else {  // Previous values all Ints Test Failed
                    exitCondition = true;
                }
            }
            
            if (exitCondition == false) {
                // Which feature to execute
                switch (keyWord) {
                case "count":
                    print("\(onlyValues) has \(onlyValues.count) Values")
                    
                case "avg":
                    var sum = 0
                    for index in 0 ..< onlyValues.count {
                        sum += onlyValues[index]
                    }
                    var sumDouble = Double(sum)
                    var onlyValuesDouble = Double(onlyValues.count)
                    var average = sumDouble / onlyValuesDouble
                    print("Average of \(onlyValues) = \(average)")
                    
                case "fact":
                    if (onlyValues.count == 1) && (onlyValues[0] >= 0) { // Factorial of one non-negative number Test
                        if (onlyValues[0] == 0) { // Factorial of zero will break loops
                            print("\(onlyValues[0])! = 1")
                        } else {
                            var sumFact = 1
                            for index in 1 ..< onlyValues[0] + 1 {
                                sumFact = sumFact * index
                            }
                            print("\(onlyValues[0])! = \(sumFact)")
                        }
                    } else {
                        print("Factorial only works for one positive number")
                    }
                    
                default:
                    print("Invalid entry")
                }
            } else {
                print("One or more of your entries was invalid")
            }
            // All Tests failed, invalid entry
        } else {
            print("Not a valid entry")
        }
    }
} // End of While loop