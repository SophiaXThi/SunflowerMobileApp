//
//  CreditsView.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/24/26.
//

import SwiftUI

struct CreditsView: View {
    
    @StateObject private var viewModel = CreditsViewModel()

    var body: some View {
        List(viewModel.plants) { plant in
            HStack(alignment: .top, spacing: 12) {
                Image(plant.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)

                VStack(alignment: .leading, spacing: 6) {
                    Text(plant.name)
                        .font(.headline)

                    Text(cleanAttributionText(plant.attributeHTML))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Credits")
        .onAppear {
            viewModel.loadPlants()
        }
    }
    
    // Added function to make the link string more readable
    private func cleanAttributionText(_ html: String) -> String {
        // Looks for the start and end of the html strings
        guard let start = html.range(of: "\">"),
              let end = html.range(of: "</a>") else {
            return html
        }
        
        let visibleText = html[start.upperBound..<end.lowerBound]
        
        return visibleText.description.replacingOccurrences(of: "&amp;", with: "&")
    }
}
