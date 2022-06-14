//
//  SignIn + FirebaseAuth.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase


extension SignInController {
    
    func logInUser(withEmail email:String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("error to signIn User", error.localizedDescription)
                return
            }
            
           self.dismiss(animated: true, completion: nil)
        }
    }
}
