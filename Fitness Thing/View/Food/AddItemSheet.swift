//
//  AddItemSheet.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/26/24.
//

import SwiftUI
import SwiftData

struct AddItemSheet: View {
    @Environment(\.modelContext) var context
    
    @State private var isAdding: Bool = false
    @Query private var mealTemplates: [MealTemplate] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(mealTemplates) {mealTemplate in
                }
            }
        }
        .sheet(isPresented: $isAdding) {
            AddItemSheet()
        }
    }
}

#Preview {
    AddItemSheet()
        .modelContainer(for: [FoodDay.self, MealTemplate.self, IngredientTemplate.self], inMemory: true)
}
