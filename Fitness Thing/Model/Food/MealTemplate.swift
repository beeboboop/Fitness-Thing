//
//  MealTemplate.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/2/24.
//

import Foundation
import SwiftData

@Model
class MealTemplate {
    var name: String
    var servingSize: Double
    var ingredients: [Ingredient]
    
    init(name: String, servingSize: Double, ingredients: [Ingredient]) {
        self.name = name
        self.servingSize = servingSize
        self.ingredients = ingredients
    }
}

extension MealTemplate {
    var caloriesPerServing: Double {
        ingredients.reduce(0) {
            $0 + $1.totalCalories
        }
    }
}

extension MealTemplate {
    static let standard = MealTemplate(name: "Example Meal", servingSize: 100,
                               ingredients: [Ingredient.standard])
}
