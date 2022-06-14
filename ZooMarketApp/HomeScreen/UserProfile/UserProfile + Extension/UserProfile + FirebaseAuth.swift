//
//  UserProfile + Firebase.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//

import Foundation
import Firebase
import FirebaseDatabase



extension UserProfileController {
    
    
//    func loadUserData() {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        Database.database().reference().child("users").child(uid).child("username").observeSingleEvent(of: .value) { (snapshot) in
//            guard let username = snapshot.value as? String else { return }
//            self.exLabel.text = "Привет, \(username)"
//            self.exLabel.alpha = 1
//
//        }
//    }
    
    
    func signOut() {
        
        do {
            try Auth.auth().signOut()
            let signInViewController = UINavigationController(rootViewController: SignInController())
            signInViewController.modalPresentationStyle = .fullScreen
            self.present(signInViewController, animated: true)
        } catch let error {
            print("Sign out is failed!", error)
        }
    }
}
