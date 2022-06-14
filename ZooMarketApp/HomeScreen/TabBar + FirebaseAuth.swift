//
//  TabBar + FirebaseAuth.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//

import Foundation
import Firebase
import FirebaseDatabase


extension HomeBarController {
    
    func authenticateUser() {
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                
                let signInViewController = UINavigationController(rootViewController: SignInController())
                signInViewController.modalPresentationStyle = .fullScreen
                self.present(signInViewController, animated: true)
            }
        } else {
           
        }
    }
}
