//
//  DashboardMain.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/27/24.
//

import SwiftUI

struct DashboardMain: View {
    var body: some View {
        ScrollView { // Add ScrollView to enable scrolling
            VStack {
                HStack {
                    Text("hey user!")
                        .font(
                            Font.custom("SF Pro Text", size: 32)
                                .weight(.bold)
                        )
                        .foregroundColor(.black)
                        .padding(.trailing, 160)
                    profileTab()
                }
                dashboardWidgetTop(title: "recipe here recipe here recipe here")
                HStack {
                    squareWidget()
                    squareWidget()
                }
                oblongWidget()
                HStack {
                    squareWidget()
                    squareWidget()
                }
                
                
            }
            .padding() // Optional: Add padding around the VStack
        }
        .edgesIgnoringSafeArea(.bottom)
        // Optional: Extend to the bottom edge
    }
}

#Preview {
    DashboardMain()
}
