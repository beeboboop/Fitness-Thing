//
//  NewItemSheet.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/30/24.
//

import SwiftUI

struct NewMealTemplateSheet: View {
    @Environment(\.modelContext) var context
    
    var mealTemplate: MealTemplate
    @Binding var isPresented: Bool
    @State private var isAddingIngredients: Bool = false
    
    init(existingMealTemplate: MealTemplate? = nil, isPresented: Binding<Bool>) {
        if let existingMealTemplate {
            self.mealTemplate = existingMealTemplate
        } else {
            self.mealTemplate = MealTemplate()
        }
        
        self._isPresented = isPresented
    }
    
    var body: some View {
        @Bindable var mealTemplateBinding = mealTemplate
        VStack {
            HStack {
                TextField("Enter meal name", text: $mealTemplateBinding.name)
                    .font(.largeTitle)
                    .autocorrectionDisabled()
                Button(action: {isPresented = false}) {
                    Image(systemName: "xmark")
                        .scaleEffect(1.5)
                        .foregroundStyle(.appPrimary)
                }
            }
            FoodItemRow(foodItem: mealTemplate,
                        showName: false)
            Divider()
                .padding()
            HStack {
                Text("Ingredients")
                    .font(.title2)
                Spacer()
                PlusButton(action: {isAddingIngredients = true})
            }
            FoodItemList(foodItems: mealTemplate.ingredients, isEditable: true)
            Spacer()
            WideButton(action: {insertAndExit()}, title: "Save and close", fillColor: .appPrimary, accentColor: .appSecondary)
        }
        .padding()
        .sheet(isPresented: $isAddingIngredients) {
            AddIngredientsToMealSheet(mealTemplate: mealTemplate, isPresented: $isAddingIngredients)
        }
    }
}

extension NewMealTemplateSheet {
    func insertAndExit() {
        context.insert(mealTemplate)
        isPresented = false
    }
}

#Preview {
    NewMealTemplateSheet(isPresented: .constant(true))
        .modelContainer(for: [FoodDay.self, MealTemplate.self, IngredientTemplate.self], inMemory: true)
        .environment(FoodManager())
}
