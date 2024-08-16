//
//  FrontPageSignInView.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/16/24.
//

import SwiftUI

struct FrontPageSignInView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                // MAIN TITLE
                Text("Coco")
                    .font(
                        Font.custom("SF Pro Text", size: 32)
                            .weight(.bold)
                    )
                    .foregroundColor(.black)
                    .padding(.bottom, 500)
                
                // COCO LOGO HERE
                
                
                // SIGN UP BUTTON
                NavigationLink(destination: SignUpView(), label: {Text("GET STARTED")
                        .foregroundColor(.white)
                        .frame(width: 245, height: 48)
                        .background(Color("ForestGreen"))
                    .cornerRadius(15)})
                
                // SIGN IN BUTTON
                HStack{
                    Text("ALREADY HAVE AN ACCOUNT?")
                        .font(Font.custom("SF Pro Text", size: 14))
                    NavigationLink(destination: LogInView(), label: {Text("Log In")
                            .foregroundColor(Color("ForestGreen"))
                        .font(Font.custom("SF Pro Text", size: 14))})
                }
            }
        }
    }
}


#Preview {
    FrontPageSignInView()
}
