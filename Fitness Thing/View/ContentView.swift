//
//  ContentView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        TabView {
            DailyFoodView()
                .tabItem {
                    Label("Food", systemImage: "fork.knife")
                }
            MealRow(meal: Meal.standard)
                .tabItem {
                    Label("Test", systemImage: "circle")
                }
            WorkoutView()
                .tabItem {
                    Label("Workout", systemImage: "dumbbell")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}

