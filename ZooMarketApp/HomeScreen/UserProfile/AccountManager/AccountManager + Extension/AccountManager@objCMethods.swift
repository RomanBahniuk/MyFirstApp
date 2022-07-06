//
//  @objCMethods.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 1.07.22.
//

import Foundation
import UIKit



extension AccountManagerController {
    
    @objc func backButonTapped() {
        
        dismiss(animated: true)
    }
}


extension AccountManagerView {
    
    @objc func signOutButtonTapped() {
        
        signOutButtonDelegate?.signOutButtonDidTapped()
        
    }
    
    @objc func deleteAccountButtonTapped() {
        
        deleteAccountButtonDelegate?.deleteAccountButtonDidTapped()
    }
    
}


