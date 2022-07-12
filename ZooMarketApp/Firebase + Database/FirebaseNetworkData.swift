//
//  FirebaseNetworkData.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 29.06.22.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore


final class FirebaseNetworkData {
    
    
    weak var alertDelegate: WrongUserDataAlert?
    
    
    func createUser(withUserName userName: String, userSecondName: String, userPhoneNumber: String, userDayOfBirth: String, email: String, password: String, userImageURL: String) {
        
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("error to create User", error.localizedDescription)
                return
            }
            
            guard let userID = result?.user.uid else { return }
            
            
            Firestore.firestore().collection("FirestoreUsers").document("\(userID)").setData(["userEmail": email, "userPhoneNumber": userPhoneNumber,"userName": userName, "userSecondName": userSecondName, "userDayOfBirth": userDayOfBirth, "userID": userID, "userImageURL": userImageURL]) {
                err in
                if let err = err {
                    print("error!:\(err.localizedDescription)")
                } else {
                    print("data added!")
                }
                
            }
            
            
            
        }
    }
    
    
    func chekUserEmail(emailText: String, completion: @escaping (Bool) -> ()) {
        
        let database = Firestore.firestore().collection("FirestoreUsers")
        database.whereField("userEmail", isEqualTo: emailText).getDocuments { (snap, err) in
            if let err = err {
                print("\(err.localizedDescription)")
            } else if (snap?.isEmpty)! {
                completion(false)
            } else {
                for i in (snap?.documents)! {
                    if i.data()["userEmail"] != nil {
                        completion(true)
                    }
                }
            }
        }
        
    }
    
    
    
    func logInUser(withEmail email:String, password: String, completion: @escaping (Bool) -> ()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                let error = error as NSError
                switch error.code {
                case AuthErrorCode.userNotFound.rawValue:
                    self.alertDelegate?.WrongUserDataAlert("Неверный электронный адрес или пароль")
                case AuthErrorCode.wrongPassword.rawValue:
                    self.alertDelegate?.WrongUserDataAlert("Неверный пароль")
                default: print("error to signIn User", error.localizedDescription)
                    completion(false)
                    }
                return
            } else {
                completion(true)
                }
        }
    }
    
    
    func authenticateUser(completion: @escaping (Bool) -> ()) {
        
        if Auth.auth().currentUser == nil {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    
    func signOut() {
        
        do {
            try Auth.auth().signOut()
            
        } catch let error {
            print("Sign out is failed!", error)
        }
    }
    
    
    func deleteUserAccount() {
        
        let currentUser = Firebase.Auth.auth().currentUser
        let userID = currentUser?.uid
        let database = Firestore.firestore().collection("FirestoreUsers").document("\(userID!)")
        let storageRef = Storage.storage().reference(withPath: "UserProfilePhoto").child("\(userID!)")
        
        currentUser?.delete(completion: { error in
            if let error = error {
                
                print("\(error.localizedDescription)")
                
            } else {
                database.delete { err in
                    if let err = err {
                        print("\(err.localizedDescription)")
                    }
                    
                }
                
                storageRef.delete { err in
                    if let err = err {
                        print("Failed to delete userPhoto\(err.localizedDescription)")
                    }
                }
            }
        })
        
    }
    
    
    
    
    //MARK: UserDataOperations
    
    
    func updateUserData(completion: @escaping (Firestore) -> ()) {
        completion(Firestore.firestore())
    }
    
    
    func getUserData(completion: @escaping (Firestore) -> ()) {
        completion(Firestore.firestore())
    }
    
    
    func getUserPhoto(completion: @escaping (Storage) -> ()) {
        completion(Storage.storage())
        
    }

    func deleteUserPhoto(completion: @escaping (Bool) -> ()) {
        
        let userID = Firebase.Auth.auth().currentUser?.uid
        let storageRef = Storage.storage().reference(withPath: "UserProfilePhoto")
        let userProfilePhoto = storageRef.child("\(userID!)")
        
        userProfilePhoto.delete { error in
            if let error = error {
                
                print("\(error.localizedDescription)")
                completion(false)
            
            } else {
                completion(true)
            }
        }
        
    }
        
    


}
