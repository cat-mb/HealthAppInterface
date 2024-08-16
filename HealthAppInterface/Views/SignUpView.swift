//
//  SignUpView.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/11/24.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ContentView(), label: {signInGoogle()})
                    .padding(.bottom, 25)
                NavigationLink(destination: ContentView(), label: {signInEmail()})
            }
            
        }
    }
}

#Preview {
    SignUpView()
}
