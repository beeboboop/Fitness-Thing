//
//  DailyFoodView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/2/24.
//

import SwiftUI
import SwiftData

struct DailyFoodView: View {
    @Environment(\.modelContext) var context
    
    @State private var selectedDate: Date = Date()
    @State private var isAdding: Bool = false
    @Query private var foodDays: [FoodDay] = []
    
    var foodDay: FoodDay? {
        foodDays.first(where:) {
            Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                PlusButton(action: {})
                    .frame(width: 32, height: 32)
                    .padding(.leading)
                    .hidden()
                Spacer()
                DateView(selectedDate: $selectedDate)
                Spacer()
                PlusButton(action: {isAdding = true})
                    .frame(width: 32, height: 32)
                    .padding(.trailing)
            }
            
            if let day = foodDay {
                DailyOverviewView(foodDay: day)
                ScrollView(.vertical) {
                    MealsEatenView(mealsEaten: day.mealsEaten)
                }
            }
        }
        .onAppear() {
            if foodDay == nil {
                context.insert(FoodDay(date: selectedDate, targetCalories: DebugConstants.targetCal, targetProtein: DebugConstants.targetProtein, targetFat: DebugConstants.targetFat, targetCarbs: DebugConstants.targetCarbs, mealsEaten: []))
            }
        }
        .onChange(of: selectedDate) {
            if foodDay == nil {
                context.insert(FoodDay(date: selectedDate, targetCalories: DebugConstants.targetCal, targetProtein: DebugConstants.targetProtein, targetFat: DebugConstants.targetFat, targetCarbs: DebugConstants.targetCarbs, mealsEaten: [Meal.standard]))
            }
        }
        .sheet(isPresented: $isAdding) {
            AddItemSheet()
        }
    }
}

#Preview {
    DailyFoodView()
        .environment(FoodManager())
        .modelContainer(for: [FoodDay.self, MealTemplate.self, IngredientTemplate.self], inMemory: true)
}
