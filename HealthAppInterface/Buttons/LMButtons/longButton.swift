//
//  longButton.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/11/24.
//

import SwiftUI

struct longButton: View {
    var text: String
    var body: some View {
        Text(text)
            .font(
            Font.custom("SF Pro Text", size: 16)
            .weight(.medium)
            )
            .foregroundColor(.black)
            .frame(width: 331, height: 50)
            .background(Color("MutedGreen"))
            .cornerRadius(20)
    }
}

#Preview {
    longButton(text: "Hello")
}
