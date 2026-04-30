//
//  PlantCatalogLoader.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/17/26.
//

// I created a csv to store my icons, this reads it
// like how MySQL did

import Foundation

final class PlantCatalogLoader {
    // Calls in the file name as a string
    static func loadPlants(from fileName: String = "plant_icon") -> [Plant] {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "csv") else {
            print("Could not find \(fileName).csv in the app bundle.")
            return []
        }
        
        print("Found CSV at: \(url)")
        
        do {
            let csvString = try String(contentsOf: url, encoding: .utf8)
            print("CSV loaded successfully.")
            
            let rows = csvString
                .components(separatedBy: .newlines)
                .filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
            
            print("Row count including header: \(rows.count)")
            
            guard rows.count > 1 else {
                print("CSV file does not contain any plant rows.")
                return []
            }
            
            var plants: [Plant] = []
            
            for row in rows.dropFirst() {
                let rawColumns = row.components(separatedBy: ",")
                
                guard rawColumns.count >= 3 else {
                    print("Skipping malformed CSV row: \(row)")
                    continue
                }
                
                let plantName = rawColumns[0].trimmingCharacters(in: .whitespacesAndNewlines)
                let imageFileName = rawColumns[1].trimmingCharacters(in: .whitespacesAndNewlines)
                let attributeHTML = rawColumns.dropFirst(2).joined(separator: ",")
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                
                let imageName = imageFileName.replacingOccurrences(of: ".png", with: "")
                let generatedID = imageName
                
                let plant = Plant(
                    id: generatedID,
                    name: plantName,
                    imageName: imageName,
                    attributeHTML: attributeHTML
                )
                
                plants.append(plant)
            }
            
            print("Loaded \(plants.count) plants.")
            return plants
            
        } catch {
            print("Error reading CSV file: \(error.localizedDescription)")
            return []
        }
    }
}
