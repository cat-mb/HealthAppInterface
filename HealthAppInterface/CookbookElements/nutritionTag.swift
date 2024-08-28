//
//  nutritionTag.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/27/24.
//

import SwiftUI

struct nutritionTag: View {
    var title: String
    var body: some View {
        Text(title)
          .font(
            Font.custom("SF Pro", size: 11)
              .weight(.light)
          )
          .multilineTextAlignment(.center)
          .foregroundColor(.black)
          .frame(width: 63.33333, height: 12, alignment: .top)
          .foregroundColor(.clear)
          .frame(width: 66.66666, height: 15)
          .background(Color("NeonGreen"))
          .cornerRadius(5)
    }
}

#Preview {
    nutritionTag(title: "High Fiber")
}
