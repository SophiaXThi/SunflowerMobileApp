//
//  SavedBedsViewModel.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/24/26.
//

import Foundation

final class SavedBedsViewModel: ObservableObject {
    
    @Published var savedBeds: [GardenBed] = [] {
        didSet {
            saveBeds()
        }
    }
    
    private let savedBedsKey = "savedBeds"

    init() {
        loadBeds()
    }
    
    func addBed(_ bed: GardenBed) {
        if let index = savedBeds.firstIndex(where: { $0.id == bed.id}) {
            savedBeds[index] = bed
        } else{
            savedBeds.append(bed)
        }
    }
    
    func deleteBed(at offsets: IndexSet) {
        savedBeds.remove(atOffsets: offsets)
    }
    
    private func saveBeds() {
        do {
            let encodedBeds = try JSONEncoder().encode(savedBeds)
            UserDefaults.standard.set(encodedBeds, forKey: savedBedsKey)
        } catch {
            print("Could not save beds: \(error)")
        }
    }
    
    private func loadBeds() {
        guard let savedData = UserDefaults.standard.data(forKey: savedBedsKey) else {
            return
        }
        
        do {
            savedBeds = try JSONDecoder().decode([GardenBed].self, from: savedData)
        } catch {
            print("Could not load beds: \(error)")
        }
    }
}
