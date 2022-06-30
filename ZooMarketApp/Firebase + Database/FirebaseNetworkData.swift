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
    
    private let firestore = Firestore.firestore()
    
    func createUser(withUserName userName: String, userSecondName: String, userPhoneNumber: String, userDayOfBirth: String, email: String, password: String, userProfileImage: String) {
        
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("error to create User", error.localizedDescription)
                return
            }
            
            guard let userID = result?.user.uid else { return }

            
            Firestore.firestore().collection("FirestoreUsers").document("\(userID)").setData(["email": email, "userPhoneNumber": userPhoneNumber,"userName": userName, "userSecondName": userSecondName, "userDayOfBirth": userDayOfBirth, "userID": userID, "userProfileImage": userProfileImage]) {
                err in
                if let err = err {
                    print("error!:\(err.localizedDescription)")
                } else {
                    print("data added!")
                }
                
            }
                

            
        }
    }
    
    
    func logInUser(withEmail email:String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("error to signIn User", error.localizedDescription)
                return
            }
        }
    }


}
