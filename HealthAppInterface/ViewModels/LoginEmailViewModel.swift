//
//  LoginEmailViewModel.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/11/24.
//

import FirebaseAuth
import Foundation

class LoginEmailViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() async throws {
        guard validate() else {
            return
        }
        
        //try to log user in
       try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        
        return true
    }
}

