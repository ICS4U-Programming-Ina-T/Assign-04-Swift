//
// TriangleInventory.swift
//
// Created by Ina Tolo
// Created on 2022-5-27
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The TriangleInventory program implements an application
// that reads side lengths from a file, then calls a
// separate class to calculate various characteristics.

import Foundation

class Triangle {
    // properties
    private var sideA: Double
    private var sideB: Double
    private var sideC: Double

    init(lengthA: Double, lengthB: Double, lengthC: Double) {
        // referencing values in triangle object
        self.sideA = lengthA
        self.sideB = lengthB
        self.sideC = lengthC
    }

    // determines if triangle is valid
    internal func isTriangleValid() -> Bool {
        let valid: Bool

        // checks if sums of side lengths can create a triangle
        if (sideA + sideB > sideC) && (sideB + sideC > sideA) && (sideC + sideA > sideB) {
            valid = true
        } else {
            valid = false
        }

        return valid
    }

    // calculates the area
    func calcArea() -> Double {
        // calculates the semiperimeter
        let semiP: Double = (sideA + sideB + sideC) / 2

        let area: Double = sqrt(semiP * (semiP - sideA)
            * (semiP - sideB) * (semiP - sideC))

        // rounds area to two decimals
        let roundedArea = String(format: "%.2f", (area * 100) / 100)

        var finalArea = 0.0
        finalArea = Double(roundedArea) ?? -4.5

        return finalArea
    }

    // calculates the perimeter
    func calcPer() -> Double {
        // adds up all sides
        let perimeter: Double = sideA + sideB + sideC

        // rounds perimeter to two decimals
        let roundedPer = String(format: "%.2f", (perimeter * 100) / 100)

        var finalPer = 0.0
        finalPer = Double(roundedPer) ?? -4.5

        return finalPer
    }

    // determines the type of angle
    func typeBySide() -> String {
        // declaring variables
        var listOfSides: [Double] = []
        var longestSide: Double = -1
        var anglesType: String = ""

        // adds each side length to list
        listOfSides.append(sideA)
        listOfSides.append(sideB)
        listOfSides.append(sideC)

        // checks which side is the longest
        if sideA > sideB && sideA > sideC {
            listOfSides.remove(at: (listOfSides.firstIndex(of: sideA)!))
            longestSide = sideA
        } else if sideB > sideA && sideB > sideC {
            listOfSides.remove(at: (listOfSides.firstIndex(of: sideB)!))
            longestSide = sideB
        } else if sideC > sideA && sideC > sideB {
            listOfSides.remove(at: (listOfSides.firstIndex(of: sideC)!))
            longestSide = sideC
        }

        // checks angle type
        if pow(longestSide, 2) == (pow(listOfSides[0], 2) + (pow(listOfSides[1], 2))) {
            anglesType = "right"
        } else if pow(longestSide, 2) < (pow(listOfSides[0], 2) + (pow(listOfSides[1], 2))) {
            anglesType = "acute"
        } else if (pow(longestSide, 2)) > ((pow(listOfSides[0], 2)) + (pow(listOfSides[1], 2))) {
            anglesType = "obtuse"
        }

        return anglesType
    }

    // determines the type of triangle inputted, using the angles
    func typeByAngle() -> String {
        var sidesType: String = ""

        if sideA == sideB && sideA == sideC {
            sidesType = "equilateral"
        } else if (sideA == sideB && sideA != sideC)
            || (sideA == sideC && sideA != sideB)
            || (sideB == sideC && sideB != sideA) {
            sidesType = "isosceles"
        } else {
            sidesType = "scalene"
        }

        return sidesType
    }

    // determines the value of each angle in triangle
    func triangleAngle() -> [Double] {
        // declaring variables
        var listOfAngles: [Double] = []
        var angleAStepOne: Double
        var angleBStepOne: Double
        var angleCStepOne: Double
        var angleAStepTwo: Double
        var angleBStepTwo: Double
        let angleAString: String
        let angleBString: String
        let angleCString: String
        var angleA: Double = 0.0
        var angleB: Double = 0.0
        var angleC: Double = 0.0

        angleAStepOne = ((pow(sideB, 2) + pow(sideC, 2))
            - pow(sideA, 2)) / (2 * (sideB * sideC))
        angleAStepTwo = (acos(angleAStepOne) * 180) / Double.pi
        angleAString = String(format: "%.2f", (angleAStepTwo * 100) / 100)
        angleA = Double(angleAString) ?? -4.5

        angleBStepOne = ((pow(sideC, 2) + pow(sideA, 2))
            - pow(sideB, 2)) / (2 * (sideC * sideA))
        angleBStepTwo = (acos(angleBStepOne) * 180) / Double.pi
        angleBString = String(format: "%.2f", (angleBStepTwo * 100) / 100)
        angleB = Double(angleBString) ?? -4.5

        angleCStepOne = 180 - (angleA + angleB)
        angleCString = String(format: "%.2f", (angleCStepOne * 100) / 100)
        angleC = Double(angleCString) ?? -4.5

        // adding angles to array
        listOfAngles.append(angleA)
        listOfAngles.append(angleB)
        listOfAngles.append(angleC)

        return listOfAngles
    }

    // calculates height of triangle
    func calcHeight() -> Double {
        // calculates the semiperimeter
        let semiP: Double = (sideA + sideB + sideC) / 2

        let area: Double = sqrt(semiP * (semiP - sideA)
            * (semiP - sideB) * (semiP - sideC))

        // rounds area to two decimals
        let roundedArea = String(format: "%.2f", (area * 100) / 100)

        var finalArea = 0.0
        finalArea = Double(roundedArea) ?? -4.5

        // calculates and round height to two decimal places
        let height: Double = 2 * (finalArea / sideA)

        // rounds perimeter to two decimals
        let roundedHeight = String(format: "%.2f", (height * 100) / 100)

        var finalHeight = 0.0
        finalHeight = Double(roundedHeight) ?? -4.5

        return finalHeight
    }
}

// main section of program code

// declaring variables
let lengthsLocation = "/home/runner/Assign-04-Swift/input.txt"
let text = ""
var resultsString: String = ""
var strArray: [String] = []

// reads file with strings into an array
let listOfSides: String = try String(contentsOfFile: lengthsLocation)
let lengthsArrayFile: [String] = listOfSides.components(separatedBy: "\n")

try text.write(to: URL(fileURLWithPath: "/home/runner/Assign-04-Swift/output.txt"),
    atomically: false, encoding: .utf8)

if let fileWriter = try? FileHandle(forUpdating:
    URL(fileURLWithPath: "/home/runner/Assign-04-Swift/output.txt")) {

    print("Done triangle calaculations. Look below and check the output file.")
    print("--------------------------\n")

    for loopCounter in 0..<lengthsArrayFile.count {
        var tempList: [Double] = []
        let numArray = lengthsArrayFile[loopCounter].components(separatedBy: " ")

        for element in numArray {
            let num: Double = Double(element) ?? -545.0

            tempList.append(num)
        }

        let myTriangle = Triangle(lengthA: tempList[0], lengthB: tempList[1], lengthC: tempList[2])

        // check if triangle is valid
        if myTriangle.isTriangleValid() == true {
            // declaring triangle number
            let triangleNum: Int = loopCounter + 1

            // displays results to console
            print("Triangle \(triangleNum):\nThe side lengths of this triangle are "
                + "\(tempList[0]) ft, \(tempList[1])"
                + " ft, and \(tempList[2]) ft.\n"
                + "The height is \(myTriangle.calcHeight()) ft.\n"
                + "It has an area of "
                + "\(myTriangle.calcArea()) ft^2 and a perimeter of "
                + "\(myTriangle.calcPer()) ft.\nIt is "
                + "\(myTriangle.typeByAngle()) with a "
                + "\(myTriangle.typeBySide()) angle.\nThe angle "
                + "between sides a and b is "
                + "\(myTriangle.triangleAngle()[2]) degrees.\n"
                + "The angle between sides a and c is "
                + "\(myTriangle.triangleAngle()[1]) degrees.\n"
                + "The angle between sides b and c is "
                + "\(myTriangle.triangleAngle()[0]) degrees.\n\n")

            // adds results to the output file
            resultsString = "Triangle \(triangleNum):\nThe side lengths of this triangle are "
                + "\(tempList[0]) ft, \(tempList[1])"
                + " ft, and \(tempList[2]) ft.\n"
                + "The height is \(myTriangle.calcHeight()) ft.\n"
                + "It has an area of "
                + "\(myTriangle.calcArea()) ft^2 and a perimeter of "
                + "\(myTriangle.calcPer()) ft.\nIt is "
                + "\(myTriangle.typeByAngle()) with a "
                + "\(myTriangle.typeBySide()) angle.\nThe angle "
                + "between sides a and b is "
                + "\(myTriangle.triangleAngle()[2]) degrees.\n"
                + "The angle between sides a and c is "
                + "\(myTriangle.triangleAngle()[1]) degrees.\n"
                + "The angle between sides b and c is "
                + "\(myTriangle.triangleAngle()[0]) degrees.\n\n"

        } else {
            // declaring triangle number
            let triangleNum: Int = loopCounter + 1

            // displays results to console
            print("Triangle \(triangleNum):\nThe side lengths of this triangle are "
                + "\(tempList[0]) ft, \(tempList[1])"
                + " ft, and \(tempList[2]) ft.\n"
                + "It is not valid.\n")

            // adds results to the output file
            resultsString = "Triangle \(triangleNum):\n"
                + "The side lengths of this triangle are \(tempList[0])"
                + " ft, \(tempList[1]) ft, and "
                + "\(tempList[2]) ft.\n"
                + "It is not valid.\n\n"
        }
        // writes the new altered strings to the output file
        fileWriter.seekToEndOfFile()
        fileWriter.write(resultsString.data(using: .utf8)!)

        // print("")
        // resultsString += "\n\n"
    }
    fileWriter.closeFile()
}

print("--------------------------")
