//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Nasir on 06/01/2024.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login () {
        guard validate() else {
            return
        }
        
        // log user in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate () -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        // simple email validation
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Plase enter a valid email."
            return false
        }
        
        return true
    }
}
