//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Nasir on 06/01/2024.
//

import FirebaseAuth
import Foundation


class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.currentUserId = user?.uid ?? ""
        }
    }
    
    public var isSingnedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
