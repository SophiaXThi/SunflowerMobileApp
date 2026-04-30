//
//  GardenCellView.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/17/26.
//

import SwiftUI

struct GardenCellView: View {
    
    let cell: GardenCell
    let plant: Plant?
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(Color.white)
                .overlay(
                    Rectangle()
                        .stroke(Color.gray.opacity(0.7), lineWidth: 1)
                )
            
            if let plant = plant {
                Image(plant.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(4)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    GardenCellView(
        cell: GardenCell(row: 0, column: 0),
        plant: nil
    )
}
