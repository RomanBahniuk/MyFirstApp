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
    
}
