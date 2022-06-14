//
//  SignUp + FirebaseAuth.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase



extension SignUpController {
    
    func createUser(withUserName userName: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("error to create User", error.localizedDescription)
                return
            }
            
            guard let userID = result?.user.uid else { return }
            
            let values = ["email": email, "userName": userName]
            
            Database.database().reference().child("users").child(userID).updateChildValues(values) { (error, reference) in
                
                if let error = error {
                    print("error to update Database", error.localizedDescription)
                    return
            }
            
                self.dismiss(animated: true, completion: nil)

            
        }
    }
    
}
    
}
