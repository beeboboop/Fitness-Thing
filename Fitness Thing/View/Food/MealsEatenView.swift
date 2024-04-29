//
//  MealsEatenView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import SwiftUI

struct MealsEatenView: View {
    var mealsEaten : [Meal]
    var body: some View {
        ForEach(mealsEaten) { meal in
            //MealRow(meal: meal)
        }
    }
}

#Preview {
    MealsEatenView(mealsEaten: [Meal.standard, Meal.standard])
        .environment(FoodManager())
}
