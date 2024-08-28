//
//  dashboardWidgetTop.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/27/24.
//

import SwiftUI

struct dashboardWidgetTop: View {
    var title: String
    var body: some View {
        ZStack{
        
            Image("recipeimagedashboard")
              .frame(width: 348, height: 200)
              .background(
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: .white.opacity(0), location: 0.19),
                    Gradient.Stop(color: Color(red: 0.05, green: 0.12, blue: 0.02), location: 0.95),
                  ],
                  startPoint: UnitPoint(x: 0.5, y: 0),
                  endPoint: UnitPoint(x: 0.5, y: 1)
                )
              )

            Text(title)
              .font(
                Font.custom("SF Pro", size: 16)
                  .weight(.semibold)
              )
              .foregroundColor(.white)
              .padding(.top, 100)
            
            HStack{
                nutritionTag(title: "High Fiber")
                nutritionTag(title: "Low Sodium")
            }
            .padding(.top, 150)
            .padding(.trailing, 160)
        }
    }
}

#Preview {
    dashboardWidgetTop(title: "Recipe Name Recipe Name Recipe Name")
}
