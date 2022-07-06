//
//  AccountManager + Alert.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 2.07.22.
//

import Foundation
import UIKit



extension AccountManagerController {
    
    func signOutAlert() {
        
        let signOutAlert = UIAlertController(title: nil, message: "Вы действительно хотите выйти из аккаунта?", preferredStyle: .actionSheet)
        signOutAlert.addAction(UIAlertAction(title: "Выйти", style: .destructive, handler: { [self] (_) in
            firebaseNetworkData.signOut()
            let signInViewController = UINavigationController(rootViewController: SignInController())
            signInViewController.modalPresentationStyle = .fullScreen
            self.present(signInViewController, animated: true)
        }))
        signOutAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(signOutAlert, animated: true)
    }
    
    
    
    func deleteAccountAlert() {
        
        let deleteAccountAlert = UIAlertController(title: nil, message: "Вы действительно хотите удалить аккаунт?", preferredStyle: .actionSheet)
        deleteAccountAlert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { [self] (_) in
            firebaseNetworkData.deleteUserAccount()
            let signInViewController = UINavigationController(rootViewController: SignInController())
            signInViewController.modalPresentationStyle = .fullScreen
            self.present(signInViewController, animated: true)
        }))
        deleteAccountAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(deleteAccountAlert, animated: true)
        
    }
    
}
