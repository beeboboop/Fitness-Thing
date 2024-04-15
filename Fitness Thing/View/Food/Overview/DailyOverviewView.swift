//
//  DailyOverviewView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import SwiftUI

struct DailyOverviewView: View {
    let foodDay: FoodDay
    var body: some View {
        HStack{
            CalorieCircleView(foodDay: foodDay)
                .padding()
            VStack {
                MacroBarView(macro: .protein,
                             target: foodDay.targetProtein,
                             current: foodDay.totalProtein)
                MacroBarView(macro: .fat,
                             target: foodDay.targetFat,
                             current: foodDay.totalFat)
                MacroBarView(macro: .carbs,
                             target: foodDay.targetCarbs,
                             current: foodDay.totalCarbs)
            }
            .padding()
        }
    }
}

#Preview {
    DailyOverviewView(foodDay: FoodDay.standard)
        .environment(FoodManager())
}
