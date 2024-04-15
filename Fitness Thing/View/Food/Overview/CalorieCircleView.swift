//
//  CalorieOverviewView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import SwiftUI

struct CalorieCircleView: View {
    @Environment(FoodManager.self) var foodManager
    
    let foodDay: FoodDay
    var calorieText: String {
        foodManager.formatMacro(foodDay.totalCalories) + "/" +
        foodManager.formatMacro(foodDay.targetCalories)
    }
    var body: some View {
        ZStack{
            Circle()
                .rotation(.degrees(120))
                .trim(from:0, to: 0.833)
                .stroke(.gray, style: StrokeStyle(lineWidth: 20, lineCap: .round))
            Circle()
                .rotation(.degrees(120))
                .trim(from:0, to: percentOfTarget*0.833)
                .stroke(Color.appPrimary, style: StrokeStyle(lineWidth: 20, lineCap: .round))
            VStack {
                Text(calorieText)
                Text("cal")
            }
        }
    }
}

extension CalorieCircleView {
    var percentOfTarget: Double {
        foodDay.totalCalories/foodDay.targetCalories
    }
}

#Preview {
    CalorieCircleView(foodDay: FoodDay.standard)
        .environment(FoodManager())
}
