//
//  MealsEatenView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/4/24.
//

import SwiftUI

struct MealsEatenView: View {
    var mealsEaten : [MealTemplate]
    var body: some View {
        Text("\(mealsEaten[0].name)")
    }
}

#Preview {
    MealsEatenView(mealsEaten: [MealTemplate.standard, MealTemplate.standard])
}
