//
//  DateView.swift
//  Fitness Thing
//
//  Created by Elliott Salvatori on 4/3/24.
//

import SwiftUI

struct DateView: View {
    let date = Date()
    let dateFormatter = DateFormatter()
    
    init() {
        self.dateFormatter.dateFormat = "MM/dd/yy"
    }
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            }
            Text(dateFormatter.string(from: date))
                .font(.title)
            Button(action: {}) {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.black)
            }
        }
    }
}

extension DateView {
    
}

#Preview {
    DateView()
}
