//
//  PlantPaletteView.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/17/26.
//

import SwiftUI

struct PlantPaletteView: View {
    
// Plants come from the CSV. There are a fixed set of value
// New plants will be add there to save me a lot of hassle
// Plants are Hashable so... less stress there
    let plants: [Plant]
    let selectedPlant: Plant?
    let onPlantSelected: (Plant) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 12) {
                ForEach(plants) { plant in
                    VStack(spacing: 6) {
                        Image(plant.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        selectedPlant == plant
                                        ? Color.green.opacity(0.25)
                                        : Color.gray.opacity(0.12)
                                    )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(
                                        selectedPlant == plant
                                        ? Color.green
                                        : Color.gray.opacity(0.4),
                                        lineWidth: selectedPlant == plant ? 2 : 1
                                    )
                            )
                        Text(plant.name)
                            .font(.caption)
                    }
                    .onTapGesture {
                        onPlantSelected(plant)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
//    let testPlants = [
//        Plant(id: "tomato", name: "Tomato", imageName: "tomato", attributeHTML: ""),
//        Plant(id: "bell-pepper", name: "Bell Pepper", imageName: "bell-pepper", attributeHTML: "")
//    ]

//    return PlantPaletteView(
//        plants: testPlants,
//        selectedPlant: testPlants[0],
//        onPlantSelected: { _ in }
//    )
}
