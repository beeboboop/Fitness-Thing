//
//  AddItemSheet.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/26/24.
//

import SwiftUI
import SwiftData

struct AllTemplatesSheet: View {
    @Environment(\.modelContext) var context
    
    @Query private var mealTemplates: [MealTemplate] = []
    @Query private var ingredientTemplates: [IngredientTemplate] = []

    @State private var isAdding: Bool = false
    @State private var searchString: String = ""
    @State private var templateType: TemplateType = .meal
    @FocusState private var isTyping: Bool

    var body: some View {
        VStack {
            SearchBar(searchString: $searchString, isAdding: $isAdding, isTyping: $isTyping)
                .padding([.horizontal, .top])
            Picker("Display", selection: $templateType) {
                ForEach(TemplateType.allCases) {type in
                    Text(type.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            switch templateType {
            case .meal:
                FoodItemList(foodItems: mealTemplates, isEditable: true)
            case .ingredient:
                FoodItemList(foodItems: ingredientTemplates, isEditable: true)
            }
            Spacer()
        }
        .sheet(isPresented: $isAdding) {
            switch templateType {
            case .meal:
                NewMealTemplateSheet(isPresented: $isAdding)
            case .ingredient:
                NewIngredientTemplateSheet(isPresented: $isAdding)
            }
        }
    }
}

#Preview {
    AllTemplatesSheet()
        .modelContainer(for: [FoodDay.self, MealTemplate.self, IngredientTemplate.self], inMemory: true)
}
