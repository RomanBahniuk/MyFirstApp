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
        
        firebaseNetworkData.authenticateUser { isUserAuthentificate in
            if isUserAuthentificate == true {
                DispatchQueue.main.async {
                    let signInViewController = UINavigationController(rootViewController: SignInController())
                    signInViewController.modalPresentationStyle = .fullScreen
                    self.present(signInViewController, animated: true)
                }
            }
        }
    }
}
