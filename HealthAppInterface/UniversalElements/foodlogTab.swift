//
//  foodlogTab.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/27/24.
//

import SwiftUI

struct foodlogTab: View {
    var body: some View {
        VStack{
            Image(systemName: "pencil.and.outline")
                .font(.system(size: 26))
                .foregroundColor(Color("ForestGreen"))
            Text("Food Log")
              .font(Font.custom("SF Pro Text", size: 12))
              .multilineTextAlignment(.center)
              .foregroundColor(Color("ForestGreen"))
              .frame(width: 73, height: 15.90909, alignment: .top)
        }
    }
}

#Preview {
    foodlogTab()
}
