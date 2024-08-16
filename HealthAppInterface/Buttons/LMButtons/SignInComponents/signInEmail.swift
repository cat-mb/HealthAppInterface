//
//  signInEmail.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/16/24.
//

import SwiftUI

struct signInEmail: View {
    var body: some View {
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 327, height: 48)
              .background(Color("MintGreen"))
              .cornerRadius(15)
            HStack{
                Image("EmailLogo")
                    .frame(width: 25, height: 25)
                Text("CONTINUE WITH EMAIL")
                  .font(
                    Font.custom("SF Pro Text", size: 20)
                      .weight(.bold)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(.black)
            }
        
        }
    }
}

#Preview {
    signInEmail()
}
