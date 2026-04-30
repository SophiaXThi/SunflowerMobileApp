//
//  BedDesignerViewModel.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/17/26.
//


// This class loads the beds, the plants from CSV, and loads the Grid Sq
import Foundation

final class BedDesignerViewModel: ObservableObject {
    
    @Published var bed: GardenBed
    @Published var plants: [Plant] = []
    @Published var cells: [GardenCell] = []
    @Published var selectedPlant: Plant?
    @Published var eraseMode = false
    
    
    init(bed: GardenBed) {
        self.bed = bed
        
        loadPlants()
        
        if bed.cells.isEmpty {
            generateGrid()
        }
        else {
            cells = bed.cells
        }
    }
    
    
    // Load plants from icon.csv
    func loadPlants() {
        plants = PlantCatalogLoader.loadPlants()

// Added this to test to make sure it can read the csv
//        plants = [
//            Plant(id: "tomato", name: "Tomato", imageName: "tomato", attributeHTML: ""),
//            Plant(id: "bell-pepper", name: "Bell Pepper", imageName: "bell-pepper", attributeHTML: ""),
//            Plant(id: "carrot", name: "Carrot", imageName: "carrot", attributeHTML: "")
//        ]
        print("Loaded plants count: \(plants.count)")
        print("Loaded plants: \(plants)")
        
        if selectedPlant == nil {
            selectedPlant = plants.first
        }
    }
    
    
    // Build grid from bed dimensions
    func generateGrid() {
        var generatedCells: [GardenCell] = []
        for row in 0..<bed.width {
            for column in 0..<bed.length {
                generatedCells.append(
                    GardenCell(
                        row: row,
                        column: column
                    )
                )
            }
        }
        cells = generatedCells
    }
    
    // Select a plant. Such cute icons
    func selectPlant(_ plant: Plant) {
        selectedPlant = plant
        eraseMode = false
    }
    
    // Toggle erase mode so you can add/erase without messing with flow
    func toggleEraseMode() {
        eraseMode.toggle()
    }
    
    
    // Place or erase plant in cell
    func handleCellTap(_ cell: GardenCell) {
        
        guard let index = cells.firstIndex(where: { $0.id == cell.id }) else {
            return
        }
        
        if eraseMode {
            cells[index].plantID = nil
        }
        else if let plant = selectedPlant {
            cells[index].plantID = plant.imageName
        }
    }
    
    // Helper functions hereeeeee :D
    
    // Clear all plants if the user isn't happy with the bed
    func clearGrid() {
        
        for index in cells.indices {
            cells[index].plantID = nil
        }
    }
    
    // Creates a saved copy of the bed with all the plants and placement in the bed
    func bedWithCurrentCells() -> GardenBed {
        GardenBed(
            id: bed.id,
            userID: bed.userID,
            name: bed.name,
            length: bed.length,
            width: bed.width,
            cells: cells
        )
    }
}
