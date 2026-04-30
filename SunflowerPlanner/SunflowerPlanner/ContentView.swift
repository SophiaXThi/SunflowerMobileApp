//
//  ContentView.swift
//  SunflowerPlanner
//
//  Created by Sophia Thi on 4/18/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var savedBedsVM = SavedBedsViewModel()
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 30) {
                
                Spacer()
                
                Text("Sunflower Planner")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                NavigationLink("Create Bed") {
                    CreateBedView(savedBedsVM: savedBedsVM)
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("View Saved Beds") {
                    SavedBedsView(viewModel: savedBedsVM)
                }
                .buttonStyle(.bordered)
                
                NavigationLink("Credits") {
                    CreditsView()
                }
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
