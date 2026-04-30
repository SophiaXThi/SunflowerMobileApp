//
//  SavedBedsView.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/24/26.
//

import SwiftUI

struct SavedBedsView: View {
    
    @ObservedObject var viewModel: SavedBedsViewModel

    var body: some View {
        List {
            if viewModel.savedBeds.isEmpty {
                Text("No saved beds yet.")
                    .foregroundColor(.secondary)
            } else {
                ForEach(viewModel.savedBeds) { bed in
                    NavigationLink {
                        BedDesignerView(
                            bed: bed,
                            savedBedsVM: viewModel
                        )
                    } label: {
                        VStack(alignment: .leading, spacing: 6) {
                            
                            Text(bed.name)
                                .font(.headline)
                            
                            Text(bed.displaySize)
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Text("Cells: \(bed.totalCells)")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .onDelete(perform: viewModel.deleteBed)
            }
        }
        .navigationTitle("Saved Beds")
    }
}
