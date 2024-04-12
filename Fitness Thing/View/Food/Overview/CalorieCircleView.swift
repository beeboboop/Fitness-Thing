//
//  CalorieOverviewView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import SwiftUI

struct CalorieCircleView: View {
    let target : Int
    let current : Int
    
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
                Text("\(current)/\(target)")
                Text("cal")
            }
        }
    }
}

extension CalorieCircleView {
    var percentOfTarget : Double {
        Double(current)/Double(target)
    }
}

#Preview {
    CalorieCircleView(target: 4000, current: 2400)
}
