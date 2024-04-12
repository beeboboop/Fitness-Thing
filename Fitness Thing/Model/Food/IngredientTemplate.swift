//
//  IngredientTemplate.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import Foundation
import SwiftData

@Model
class IngredientTemplate {
    var name: String
    var servingSize: Double
    var caloriesPerServing: Double
    var proteinPerServing: Double
    var fatPerServing: Double
    var carbsPerServing: Double
    
    init(name: String, servingSize: Double, caloriesPerServing: Double, proteinPerServing: Double, fatPerServing: Double, carbsPerServing: Double) {
        self.name = name
        self.servingSize = servingSize
        self.caloriesPerServing = caloriesPerServing
        self.proteinPerServing = proteinPerServing
        self.fatPerServing = fatPerServing
        self.carbsPerServing = carbsPerServing
    }
}

extension IngredientTemplate {
    var expectedCaloriesPerServing: Double {
        (proteinPerServing * 4) + (fatPerServing * 9) + (carbsPerServing * 4)
    }
}
