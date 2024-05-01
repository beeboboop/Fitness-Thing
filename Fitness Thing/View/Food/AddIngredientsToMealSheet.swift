//
//  AddIngredientsToMealSheet.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/30/24.
//

import SwiftUI
import SwiftData

struct AddIngredientsToMealSheet: View {
    @Environment(\.modelContext) var context
    
    @Query private var ingredientTemplates: [IngredientTemplate] = []
    
    var mealTemplate: MealTemplate
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("Current Ingredients")
            FoodItemList(foodItems: mealTemplate.ingredients, isEditable: true)
            Text("Add Ingredients")
            FoodItemList(foodItems: ingredientTemplates, containingMeal: mealTemplate, isEditable: false)
            WideButton(action: {isPresented = false},
                       title: "Save and close", fillColor: .appPrimary,
                       accentColor: .appSecondary)
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    AddIngredientsToMealSheet(mealTemplate: MealTemplate.standard, isPresented: .constant(true))
        .modelContainer(for: [FoodDay.self, MealTemplate.self, IngredientTemplate.self], inMemory: true)
        .environment(FoodManager())
}
