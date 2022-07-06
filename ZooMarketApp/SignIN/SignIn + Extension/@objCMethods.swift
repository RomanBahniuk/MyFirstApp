//
//  @objCMethods.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 13.06.22.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore

extension SignInView {
    
    @objc func hideKeyboard() {
        self.endEditing(true)
    }
    
    @objc func showHidePassword(_ sender: UIButton) {
        
        if (isTapped == true) {
            passwordTextField.isSecureTextEntry = false
            sender.setImage(UIImage(named: "ShowPassword"), for: .normal)
            
        } else {
            passwordTextField.isSecureTextEntry = true
            sender.setImage(UIImage(named: "HidePassword"), for: .normal)
            
        }
        
        isTapped.toggle()
        
    }
    
    @objc func keyboardWillShow() {
        
        if isKeyboardMoves == true {
            
            passwordValidLabel.isHidden = false
            passwordValidLine.isHidden = false
            
            
            
            
            
            signInButtonBottomAnchor?.constant = -312
            signInButtonLeftAnchor?.constant = 116
            signInButtonRightAnchor?.constant = -116
            dontHaveAnAccountBottomAnchor?.constant = -280
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                
                
                self.layoutIfNeeded()
                
            })
        }
        
    }
    
    @objc func keyboardWillHide() {
        
        if isKeyboardMoves == true {
            
            passwordValidLabel.isHidden = true
            passwordValidLine.isHidden = true
            
            
            signInButtonBottomAnchor?.constant = -224
            signInButtonLeftAnchor?.constant = 64
            signInButtonRightAnchor?.constant = -64
            dontHaveAnAccountBottomAnchor?.constant = -32
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                
                
                self.layoutIfNeeded()
                
            })
        }
        
    }
    
    
    
    @objc func createAccountButtonTapped(_ sender: UIButton) {
        createAnAccountDelegate?.createAnAccountButtonDidTapped()
    }
    
    @objc func signInButtonTapped(_ sender: UIButton) {
        
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if (email!.isEmpty) && (password!.isEmpty) {
            alertMessageDelegate?.signInAlertMessage("Заполните пустующие поля")
        } else if (email!.isEmpty) {
            alertMessageDelegate?.signInAlertMessage("Введите адрес электронной почты")
    
        } else if (password!.isEmpty) {
            alertMessageDelegate?.signInAlertMessage("Введите пароль")
        } else {
            
            signInButtonDelegate?.signInButtonDidTapped()

        }
        
    }
    
    
}
