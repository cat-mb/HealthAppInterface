//
//  navBar.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/27/24.
//

import SwiftUI

struct navBar: View {
    var body: some View {
        ZStack{
            Text("")
                .frame(width: 393, height: 75)
                .background(Color("MintGreen"))
            HStack {
                dashboardTab()
                foodlogTab()
                recipebookTab()
                activityTab()
            }
            .padding(.horizontal, 10)
            
        }
    }
}

#Preview {
    navBar()
}
