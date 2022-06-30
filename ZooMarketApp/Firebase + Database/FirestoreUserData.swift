//
//  FirestoreUserData.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 25.06.22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import UIKit



extension PersonalDataController {
    
    
    
    
    func updateUserData() {
        
        
        let userID = Auth.auth().currentUser?.uid
        
        if !personalDataView.firstNameTextField.text!.isEmpty && !personalDataView.secondNameTextField.text!.isEmpty && !personalDataView.emailTextField.text!.isEmpty {
            dataBase.collection("FirestoreUsers").document("\(userID!)").updateData(["userName": personalDataView.firstNameTextField.text!, "userSecondName": personalDataView.secondNameTextField.text!, "userEmail": personalDataView.emailTextField.text!, "userPhoneNumber": personalDataView.phoneNumberTextField.text!, "userDayOfBirth": personalDataView.dayOfBirthTextField.text!]) {
                err in
                if let err = err {
                    print(err)
                }
            }
            
        }
        
        
        
        
        
        
    }
    
    
    func getUserData() {
        
        
        
        guard let userID = Auth.auth().currentUser?.uid else { return }
        dataBase.collection("FirestoreUsers").whereField("userID", isEqualTo: userID).addSnapshotListener {(snap, err) in
            if err != nil {
                print("err!:\(err?.localizedDescription ?? "")")
                return
            }
            
            for i in snap!.documentChanges {
                
                let userName = i.document.get("userName") as! String
                let userSecondName = i.document.get("userSecondName") as! String
                let email = i.document.get("email") as! String
                let phoneNumber = i.document.get("userPhoneNumber") as! String
                let dayOfBirth = i.document.get("userDayOfBirth") as! String
                DispatchQueue.main.async {
                    self.personalDataView.firstNameTextField.text = "\(userName)"
                    self.personalDataView.secondNameTextField.text = "\(userSecondName)"
                    self.personalDataView.emailTextField.text = "\(email)"
                    self.personalDataView.phoneNumberTextField.text = "\(phoneNumber)"
                    self.personalDataView.dayOfBirthTextField.text = "\(dayOfBirth)"
                    
                    
                    self.personalDataView.textFieldPlaceholderSetup()
                    
                    

                }
            }
            
        }
        
    }
    
    
    
    func uploadUserPhoto(userID: String, userPhoto: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        
        
        let userID = Firebase.Auth.auth().currentUser?.uid
        let reference = Storage.storage().reference().child("UserProfilePhoto").child("\(userID!)")
        
        guard let imageData = personalDataView.userImage.image?.jpegData(compressionQuality: 0.4) else { return }
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
                
                
        reference.putData(imageData, metadata: metaData) { metaData, err in
            guard metaData != nil else {
                completion(.failure(err!))
                return
            }
            reference.downloadURL { url, err in
                guard let url = url else {
                    completion(.failure(err!))
                    return
            }
                completion(.success(url))
        }
       
        
    }
        
    }
    
    
    func getUserPhoto() {
        
        let userID = Firebase.Auth.auth().currentUser?.uid
        let storageRef = Storage.storage().reference(withPath: "UserProfilePhoto")
        let userProfilePhoto = storageRef.child("\(userID!)")
        
            userProfilePhoto.getData(maxSize: 1 * 1024 * 1024) { data, err in
                if let err = err  {
                    print("\(err.localizedDescription)")
                } else {
                    self.personalDataView.userImage.image = UIImage(data: data!)
                }
            }
        
       
        
        
    }
    
    
    func deleteUserPhoto() {
        
        let userID = Firebase.Auth.auth().currentUser?.uid
        let storageRef = Storage.storage().reference(withPath: "UserProfilePhoto")
        let userProfilePhoto = storageRef.child("\(userID!)")
        
        userProfilePhoto.delete { error in
            if let error = error {
                
                print("\(error.localizedDescription)")
            
            } else {
                
                self.personalDataView.userImage.image = UIImage(named: "UserProfileImage")
                self.completionHandler?(self.personalDataView.userImage.image!)
            }
        }
        
    }
    
    
    
    
    
}
