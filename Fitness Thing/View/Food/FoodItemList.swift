//
//  MealsEatenView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import SwiftUI

struct FoodItemList<T:FoodItem>: View {
    var foodItems: [T]
    var containingMeal: MealTemplate?
    var isEditable: Bool
    var removeAction: (T) -> Void
    
    @State private var selectedItems: [T] = []
    
    var body: some View {
        List {
            ForEach(foodItems) { foodItem in
                FoodItemRow(foodItem: foodItem)
                    .onTapGesture {
                        if let containingMeal, let ingredientTemplate = foodItem as? IngredientTemplate {
                            containingMeal.ingredients.append(Ingredient(template: ingredientTemplate))
                        } else if isEditable {
                            
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        if isEditable {
                            Button(action: {}) {
                                Image(systemName: "trash")
                            }
                        }
                    }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    FoodItemList(foodItems: [Ingredient.standard, Ingredient.standard, Ingredient.standard], isEditable: false, removeAction: {_ in })
        .environment(FoodManager())
}
