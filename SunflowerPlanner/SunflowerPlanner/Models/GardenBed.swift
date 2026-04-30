//
//  GardenBed.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/17/26.

// Based on the dimensions of the JS class

import Foundation

// Needs to be Identifiable AND Codable
// Identifiable means the data has a unique ID to track a specific bed
// The UUID will be like the PK id I created in MySQL
// Codable combines Encodable and Decodable
// It allows the data in the struct to be converted to/from stored data
// Codable Ref: https://www.hackingwithswift.com/articles/119/codable-cheat-sheet
struct GardenBed: Identifiable, Codable {
    // For storing the info
    let id: UUID
    var userID: String?
    
    // The Bed info
    var name: String
    var length: Int
    var width: Int
    var cells: [GardenCell]

    // Gets the size
    var displaySize: String {
        "\(length) x \(width)"
    }
    
    // Gets the total number of cells for debugging purposes
    var totalCells: Int {
        length * width
    }
    
    init(
        id: UUID = UUID(),
        userID: String? = nil,
        name: String,
        length: Int,
        width: Int,
        cells: [GardenCell] = []
    ){
        self.id = id
        self.userID = userID
        self.name = name
        self.length = length
        self.width = width
        self.cells = cells
    }
}
