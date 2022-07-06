//
//  UserProfile + Firebase.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseFirestore



extension UserProfileController {
    
    
    func loadUserData() {
        
        
        let dataBase = Firestore.firestore()
        let userID = Auth.auth().currentUser?.uid
        
        let storageRef = Storage.storage().reference(withPath: "UserProfilePhoto")
        let userProfilePhoto = storageRef.child("\(userID!)")
        
        userProfilePhoto.getData(maxSize: 1 * 1024 * 1024) { data, err in
            if let err = err {
                print("\(err.localizedDescription)")
            } else {
                self.userHeader.userImage.image = UIImage(data: data!)
            }
        }
        
        
        dataBase.collection("FirestoreUsers").whereField("userID", isEqualTo: userID!).addSnapshotListener {(snap, err) in
            if err != nil {
                print("err!:\(err?.localizedDescription ?? "" )")
                return
            }
            
            for i in snap!.documentChanges {
                
                let userName = i.document.get("userName") as! String
                let userSecondName = i.document.get("userSecondName") as! String
                let email = i.document.get("userEmail") as! String
                DispatchQueue.main.async {
                    self.userHeader.userFirstName.text = "\(userName)"
                    self.userHeader.userSecondName.text = "\(userSecondName)"
                    self.userHeader.userEmail.text = ("\(email)")

                }
            }
            
        }
        
        
        
        

        }
    
}
