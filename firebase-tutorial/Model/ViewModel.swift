//
//  ViewModel.swift
//  firebase-tutorial
//
//  by Developer Light on 28.06.2022.
//

import Foundation
import Firebase

class ViewModel : ObservableObject {
    @Published var list = [User]()
    
    func addData(name:String, email: String) {
        
        let db = Firestore.firestore()
        
        db.collection("users").addDocument(data: ["name": name, "email": email]) { error in
            
            if error == nil {
                self.getData()
            } else {
                
            }
        }
    }
    
    func getData() {
        let db = Firestore.firestore()
        
        
        db.collection("users").getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { d in
                            return User(id: d.documentID, name: d["name"] as? String ?? "", email: d["email"] as? String ?? "")
                        }
                    }
                }
            } else {
                
            }
            
        }
    }
}
