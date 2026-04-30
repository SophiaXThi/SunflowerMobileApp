//
//  GardenGridView.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/17/26.
//

import SwiftUI

struct GardenGridView: View {
    
    let bed: GardenBed
    let cells: [GardenCell]
    let plants: [Plant]
    let onCellTap: (GardenCell) -> Void
    
    
    var body: some View {
        
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: 0),
            count: max(bed.length, 1)
        )
        
// Builds the square grid
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(cells) { cell in
                GardenCellView(
                    cell: cell,
                    plant: plantForCell(cell)
                )
                .onTapGesture {
                    onCellTap(cell)
                }
            }
        }
        .background(Color.gray.opacity(0.2))
    }
    
    
    func plantForCell(_ cell: GardenCell) -> Plant? {
// I really love the guard keyword because it's like little gatekeeper
// It checks to make sure an optional exist and exits.
// Works similar to a python lambda
// So polite and demure
        guard let plantID = cell.plantID else {
            return nil
        }
        return plants.first(where: { $0.id == plantID })
    }
}


#Preview {

    let testBed = GardenBed(
        name: "Test Bed",
        length: 4,
        width: 4
    )

    let testCells = [
        GardenCell(row: 0, column: 0),
        GardenCell(row: 0, column: 1)
    ]

    return GardenGridView(
        bed: testBed,
        cells: testCells,
        plants: [],
        onCellTap: { _ in }
    )
}
