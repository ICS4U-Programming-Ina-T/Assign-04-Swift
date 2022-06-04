//
// VehicleInventory.swift
//
// Created by Ina Tolo
// Created on 2022-5-16
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The VehicleInventory program implements an application
// that creates two vehicles and calls separate classes
// to properly print the information and alter the speed.

class Triangle {
    // properties
    var sideA: Double
    var sideB: Double
    var sideC: Double

    init(lengthA: Double, lengthB: Double, lengthC: Double) {
        // referencing values in triangle object
        self.sideA = lengthA
        self.sideB = lengthB
        self.sideC = lengthC
    }

    // determines if triangle is valid
    internal func isTriangleValid() -> Bool {
        let valid: Bool

        if (_sideA + _sideB > _sideC)
            && (_sideB + _sideC > _sideA)
            && (_sideC + _sideA > _sideB) {
            valid = true
        } else {
            valid = false
        }

        return valid
    }

    // calculates the area
    func calcArea() -> Double {
        var semiP: Double = (sideA + sideB + sideC) / 2

        var area: Double
    }

    // calculates the perimeter
    func calcPer() -> Double {
        
    }

    // determines the type of angle
    func typeBySide() -> String {
        
    }

    // determines the type of triangle inputted, using the angles
    func typeByAngle() -> String {
        
    }

    // determines the value of each angle in triangle
    func triangleAngle() -> [Double] {
        
    }

    // calculates height of triangle
    func calcHeight() -> Double {
        
    }
}

// main section of program code

// declaring variables
let lengthsLocation = "/home/runner/Assign-04-Swift/input.txt"
let text = ""
var resultsString: String = ""

// reads file with strings into an array
let listOfSides: String = try String(contentsOfFile: lengthsLocation)
let lengthsArrayFile: [String] = listOfSides.components(separatedBy: "\n")

for loopCounter in 0..<lengthsArrayFile.count {
    var tempList = lengthsArrayFile[loopCounter].components(separatedBy: " ")

    for i in tempList {
        let num = Double(i) ?? -545 
    }

    var myTriangle = Triangle(sideA: tempList[0], sideB: tempList[1], sideC: tempList[2])

    // check if triangle is valid
    if myTriangle.isTriangleValid() == true {
        // declaring triangle number
        var triangleNum: Int = loopCounter + 1;

        // writes the new altered strings to the output file
        try text.write(to: URL(fileURLWithPath: "/home/runner/Assign-04-Swift/output.txt"),
            atomically: false, encoding: .utf8)

        if let fileWriter = try? FileHandle(forUpdating:
            URL(fileURLWithPath: "/home/runner/Assign-04-Swift/output.txt")) {
            // adds each string to the output file
            resultsString = "Triangle " + String(triangleNum) + ":\n" + "The side lengths are "
                + String(tempList[0]) + " ft, " + String(tempList[1]) + " ft, and " + String(tempList[2]) + " ft.\n"
                + "The height is " + String(myTriangle.calcHeight()) + " ft.\n"
                + "It has an area of "
                + String(myTriangle.calcArea()) + " ft^2 and a perimeter of "
                + String(myTriangle.calcPer()) + " ft.\nIt is "
                + String(myTriangle.typeByAngle()) + " with a "
                + String(myTriangle.typeBySide()) + " angle.\nThe angle "
                + "between sides a and b is "
                + String(myTriangle.triangleAngle()[2]) + " degrees.\n"
                + "The angle between sides a and c "
                + String(myTriangle.triangleAngle()[1]) + " degrees.\n"
                + "The angle between sides b and c "
                + String(myTriangle.triangleAngle[0]) + " degrees."

            fileWriter.seekToEndOfFile()
            fileWriter.write(resultsString.data(using: .utf8)!)

            resultsString += "\n\n"
            fileWriter.closeFile()
        }
    } else {
        // declaring triangle number
        var triangleNum: Int = loopCounter + 1;

        // writes the new altered strings to the output file
        try text.write(to: URL(fileURLWithPath: "/home/runner/Assign-04-Swift/output.txt"),
            atomically: false, encoding: .utf8)

        if let fileWriter = try? FileHandle(forUpdating:
            URL(fileURLWithPath: "/home/runner/Assign-04-Swift/output.txt")) {

            resultsString = "Triangle " + String(triangleNum) + ":\n" + "The side lengths are "
                + String(tempList[0]) + " ft, " + String(tempList[1]) + " ft, and " + String(tempList[2]) + " ft.\n"
                + "It is not valid."

            fileWriter.seekToEndOfFile()
            fileWriter.write(resultsString.data(using: .utf8)!)

            resultsString += "\n\n"
            fileWriter.closeFile()
        
    }
}
