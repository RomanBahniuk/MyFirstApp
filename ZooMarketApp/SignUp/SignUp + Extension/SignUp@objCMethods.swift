//
//  @AuthobjCMethods.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 13.06.22.
//

import Foundation
import UIKit



extension SignUpView {
    
    @objc func hideKeyboard() {
        self.endEditing(true)
    }
    
    @objc func showHidePassword(_ sender: UIButton) {
        
        if (isTapped == true) {
            userPasswordTextfield.isSecureTextEntry = false
            sender.setImage(UIImage(named: "ShowPassword"), for: .normal)
            
        } else {
            userPasswordTextfield.isSecureTextEntry = true
            sender.setImage(UIImage(named: "HidePassword"), for: .normal)
            
        }
        
        isTapped.toggle()
        
    }
    
    @objc func keyboardWillShow() {
        
        if isKeyboardMoves == true {
            
            finishRegistrationButtonBottomAnchor?.constant = -280
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                
                
                self.layoutIfNeeded()
                
            })
        }
        
    }
    
    @objc func keyboardWillHide() {
        
        if isKeyboardMoves == true {
            
            finishRegistrationButtonBottomAnchor?.constant = -32
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                
                
                self.layoutIfNeeded()
                
            })
        }
        
    }
    
    @objc func signUpButtonPresent(_ sender: UIButton) {
        signUpButtonDelegate?.signUpButtonDidTapped()
    }
    
}
