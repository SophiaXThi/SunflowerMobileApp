//
//  CreditsViewModel.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/24/26.
//

import Foundation

final class CreditsViewModel: ObservableObject {
    @Published var plants: [Plant] = []
    
    func loadPlants() {
        plants = PlantCatalogLoader.loadPlants()
    }
}
