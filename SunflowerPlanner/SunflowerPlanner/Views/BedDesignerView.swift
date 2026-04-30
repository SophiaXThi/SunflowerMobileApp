//
//  BedDesignerView.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/17/26.
//

import SwiftUI

struct BedDesignerView: View {
    
    @ObservedObject var savedBedsVM: SavedBedsViewModel
    @StateObject private var viewModel: BedDesignerViewModel
    @State private var saveMessage = ""
    
    init(bed: GardenBed, savedBedsVM: SavedBedsViewModel) {
        self.savedBedsVM = savedBedsVM
        _viewModel = StateObject(
            wrappedValue: BedDesignerViewModel(bed: bed)
        )
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(viewModel.bed.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
// The Text() was used to debug and to make sure the size and squares was correct
//                Text("Size: \(viewModel.bed.displaySize)")
//                Text("Squares: \(viewModel.bed.totalCells)")
                
                // Plant Palette
                Text("Plant Palette")
                    .font(.headline)
                
                PlantPaletteView(
                    plants: viewModel.plants,
                    selectedPlant: viewModel.selectedPlant,
                    onPlantSelected: { plant in
                        viewModel.selectPlant(plant)
                    }
                )
                                
                // Tools
                HStack(spacing: 12) {
                    Button(
                        viewModel.eraseMode
                        ? "Erase Mode On"
                        : "Erase Mode Off"
                    ) {
                        viewModel.toggleEraseMode()
                    }
                    .buttonStyle(.bordered)
        
                    Button("Clear Grid") {
                        viewModel.clearGrid()
                    }
                    .buttonStyle(.bordered)
                    
                    Button("Save Bed") {
                        savedBedsVM.addBed(viewModel.bedWithCurrentCells())
                        saveMessage = "Bed Saved :D! "
                    }
                    .buttonStyle(.bordered)
                }
                
                // Garden Grid
                Text("Garden Grid")
                    .font(.headline)
                
                GardenGridView(
                    bed: viewModel.bed,
                    cells: viewModel.cells,
                    plants: viewModel.plants,
                    onCellTap: { cell in
                        viewModel.handleCellTap(cell)
                    }
                )
            }
            .padding()
        }
        .navigationTitle("Bed Designer")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BedDesignerView(
            bed: GardenBed(
                name: "Test Bed",
                length: 8,
                width: 4
            ),
            savedBedsVM: SavedBedsViewModel()
        )
    }
}
