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
        
        let userName = userNameTextField.text
        let userSecondName = userSecondNameTextField.text
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextfield.text
        
        
        if (userName!.isEmpty) && (userSecondName!.isEmpty) && (userEmail!.isEmpty) && (userPassword!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Заполните пустующие поля")
        } else if (!userName!.isEmpty) && (userSecondName!.isEmpty) && (userEmail!.isEmpty) && (userPassword!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Заполните пустующие поля")
        } else if (userName!.isEmpty) && (!userSecondName!.isEmpty) && (userEmail!.isEmpty) && (userPassword!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Заполните пустующие поля")
        } else if (userName!.isEmpty) && (userSecondName!.isEmpty) && (!userEmail!.isEmpty) && (userPassword!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Заполните пустующие поля")
        } else if (userName!.isEmpty) && (userSecondName!.isEmpty) && (userEmail!.isEmpty) && (!userPassword!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Заполните пустующие поля")
        } else if (userName!.isEmpty) && (userSecondName!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Введите Ваше Имя и Фамилию")
        } else if (userName!.isEmpty) && (userEmail!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Введите Ваше Имя и адрес электронной почты")
        } else if (userName!.isEmpty) && (userPassword!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Введите Ваше Имя и пароль")
        } else if (userName!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Введите Ваше Имя")
            userNameTextField.becomeFirstResponder()
        } else if (userSecondName!.isEmpty) && (userEmail!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Введите Вашу Фамилию и адрес электронной почты")
        } else if (userSecondName!.isEmpty) && (userPassword!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Введите Вашу Фамилию и пароль")
        } else if (userSecondName!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Введите Вашу Фамилию")
        } else if (userEmail!.isEmpty) && (userPassword!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Введите адрес электронной почты и пароль")
        } else if (userEmail!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Введите адрес электронной почты")
        } else if (userPassword!.isEmpty) {
            signUpAlertDelegate?.signUpAlertMessage("Введите пароль")
        } else if !userEmail!.isEmpty {
            firebaseNetworkData.chekUserEmail(emailText: userEmail!) { isEmailExist in
                if isEmailExist == true {
                    self.signUpAlertDelegate?.signUpAlertMessage("Данный Email уже используется")
                    
                } else {
                    self.signUpButtonDelegate?.signUpButtonDidTapped()
                }
            }
        }
        
        
        
        
        
        
        
        
    }
    
    
}
