//
//  SignUpEmailViewModel.swift
//  HealthAppInterface
//
//  Created by Catalina Barnes on 8/11/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class SignUpEmailViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() async throws {
           guard validate() else {
            return
        }
        
       let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let userID = result.user.uid
            self.insertUserRecord(id: userID)
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email
                           )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}

