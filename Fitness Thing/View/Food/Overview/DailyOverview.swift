//
//  DailyOverviewView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import SwiftUI

struct DailyOverview: View {
    let foodDay: FoodDay
    var body: some View {
        HStack{
            CalorieCircle(foodDay: foodDay)
                .padding()
            VStack {
                DailyMacroBar(macro: .protein,
                             target: foodDay.targetProtein,
                             current: foodDay.totalProtein)
                DailyMacroBar(macro: .fat,
                             target: foodDay.targetFat,
                             current: foodDay.totalFat)
                DailyMacroBar(macro: .carbs,
                             target: foodDay.targetCarbs,
                             current: foodDay.totalCarbs)
            }
            .padding()
        }
    }
}

#Preview {
    DailyOverview(foodDay: FoodDay.standard)
        .environment(FoodManager())
}
