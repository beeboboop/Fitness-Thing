//
//  NewIngredientTemplateSheet.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/30/24.
//

import SwiftUI
import TextFieldStepper

struct NewIngredientTemplateSheet: View {
    @Environment(\.modelContext) var context
    
    var ingredientTemplate: IngredientTemplate
    @Binding var isPresented: Bool
    
    init(existingIngredientTemplate: IngredientTemplate? = nil, isPresented: Binding<Bool>) {
        if let existingIngredientTemplate {
            self.ingredientTemplate = existingIngredientTemplate
        } else {
            self.ingredientTemplate = IngredientTemplate()
        }
        
        self._isPresented = isPresented
    }
    
    let stepperConfig = TextFieldStepperConfig(
        increment: 1,
        minimum: 0.0,
        maximum: .infinity,
        decrementImage: TextFieldStepperImage(image: Image(systemName: "minus.circle.fill"), color: .appPrimary),
        incrementImage: TextFieldStepperImage(image: Image(systemName: "plus.circle.fill"), color: .appPrimary),
        maximumDecimalPlaces: 2
    )
    
    var body: some View {
        @Bindable var ingredientTemplateBinding = ingredientTemplate
        VStack {
            HStack {
                TextField("Enter ingredient name", text: $ingredientTemplateBinding.name)
                    .font(.largeTitle)
                    .autocorrectionDisabled()
                Button(action: {isPresented = false}) {
                    Image(systemName: "xmark")
                        .scaleEffect(1.5)
                        .foregroundStyle(.appPrimary)
                }
            }
            FoodItemRow(foodItem: ingredientTemplate, showName: false)
            TextFieldStepper(doubleValue: $ingredientTemplateBinding.servingSize, unit: " g", label: "Serving Size", config: stepperConfig)
                .padding()
            Divider()
            TextFieldStepper(doubleValue: $ingredientTemplateBinding.proteinPerServing, unit: " g", label: "Protein", config: stepperConfig)
                .padding()
            Divider()
            TextFieldStepper(doubleValue: $ingredientTemplateBinding.fatPerServing, unit: " g", label: "Fat", config: stepperConfig)
                .padding()
            Divider()
            TextFieldStepper(doubleValue: $ingredientTemplateBinding.carbsPerServing, unit: " g", label: "Carbs", config: stepperConfig)
                .padding()
            Divider()
            TextFieldStepper(doubleValue: $ingredientTemplateBinding.caloriesPerServing, unit: " cal", label: "Calories (~\(Int(ingredientTemplate.expectedCaloriesPerServing)) expected)", config: stepperConfig)
                .padding()
            Spacer()
            WideButton(action: {insertAndExit()}, title: "Save and close", fillColor: .appPrimary, accentColor: .appSecondary)
        }
        .padding()
    }
}

extension NewIngredientTemplateSheet {
    func insertAndExit() {
        context.insert(ingredientTemplate)
        isPresented = false
    }
}

#Preview {
    NewIngredientTemplateSheet(isPresented: .constant(true))
        .modelContainer(for: [FoodDay.self, MealTemplate.self, IngredientTemplate.self], inMemory: true)
        .environment(FoodManager())
}
