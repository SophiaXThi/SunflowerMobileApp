//
//  CreateBedView.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/18/26.
//

import SwiftUI

struct CreateBedView: View {
    
    @ObservedObject var savedBedsVM: SavedBedsViewModel

    @State private var bedName = ""
    @State private var lengthText = ""
    @State private var widthText = ""

    @State private var createdBed: GardenBed?

    var body: some View {

        VStack(spacing: 20) {

            Text("Create Garden Bed")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Bed Name", text: $bedName)
                .textFieldStyle(.roundedBorder)

            TextField("Length in whole numbers", text: $lengthText)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)

            TextField("Width in whole numbers", text: $widthText)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)

            Button("Create Bed") {

                guard let length = Int(lengthText),
                      let width = Int(widthText)
                else {
                    return
                }

                createdBed = GardenBed(
//                    id: UUID(),
                    name: bedName,
                    length: length,
                    width: width
                )
            }
            .buttonStyle(.borderedProminent)

            if let bed = createdBed {

                Text("Bed Created")
                    .font(.headline)

                Text("Size: \(bed.displaySize)")

                Text("Squares: \(bed.totalCells)")

                NavigationLink(
                    "Open Bed Designer",
                    destination: BedDesignerView(bed: bed,
                                                 savedBedsVM: savedBedsVM)
                )
                .buttonStyle(.bordered)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Create Bed")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CreateBedView(savedBedsVM: SavedBedsViewModel())
    }
}
