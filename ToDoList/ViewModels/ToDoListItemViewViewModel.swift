//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Nasir on 06/01/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


class ToDoItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
