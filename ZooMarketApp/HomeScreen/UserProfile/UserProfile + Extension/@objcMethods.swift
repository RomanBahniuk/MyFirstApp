//
//  @objcMethods.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 13.06.22.
//

import Foundation
import UIKit


extension UserProfileController {
    
    func signOutAlert() {
        
        let signOutAlert = UIAlertController(title: nil, message: "Вы действительно хотите выйти из аккаунта?", preferredStyle: .actionSheet)
        signOutAlert.addAction(UIAlertAction(title: "Выйти", style: .destructive, handler: { (_) in
            self.signOut()
        }))
        signOutAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(signOutAlert, animated: true)
    }
}
