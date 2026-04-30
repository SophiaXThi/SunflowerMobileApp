//
//  GardenCell.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/17/26.
//

import Foundation

struct GardenCell: Identifiable, Codable {
    let id: UUID
    var row: Int
    var column: Int
    var plantID: String?
    
    init( id: UUID = UUID(),
          row: Int,
          column: Int,
          plantID: String? = nil
    ) {
        self.id = id
        self.row = row
        self.column = column
        self.plantID = plantID
    }
}
