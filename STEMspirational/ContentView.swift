//
//  ContentView.swift
//  STEMspirational
//
//  Created by Scholar on 4/20/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        ZStack {
            
//            Color(red: 201/255, green: 24/255, blue: 74/255)
//                .ignoresSafeArea()
// red background
            
            Color(red: 200/255, green: 182/255, blue: 255/255)
                .ignoresSafeArea()
            
            
            VStack(alignment: .leading, spacing: 10.0) {
                Image("RosalindFranklin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding()
                
                HStack {
                    Text("Rosalind Frankin")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Chemist")
                }
                
                
                
                Text("Dr. Frankin's scientific contributions were cruical to discovering the molecular structure of DNA.")
                    .padding()
            }
            .background(Rectangle()
                .foregroundColor(.white))
                    .cornerRadius(15)
                    .shadow(radius: 15)
            .padding()
            
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
