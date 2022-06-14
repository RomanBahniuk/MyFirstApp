//
//  TextFieldSetup.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 13.06.22.
//

import Foundation
import UIKit


extension SignInView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }
    
    
    
    func setTextfield(textField: UITextField, label: UILabel, validLine: UIView, validType: String.ValidTypes, validMessage: String, wrongValidMessage: String, string: String, range: NSRange) {
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        textField.text = result
        
        if result.isValid(validType: validType) {
            label.text = validMessage
            label.textColor = .systemGreen
            validLine.layer.borderColor = UIColor.clear.cgColor
        } else {
            label.text = wrongValidMessage
            label.textColor = .systemRed
            validLine.layer.borderColor = UIColor.systemRed.cgColor
            
        }
        
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case emailTextField: setTextfield(textField: emailTextField, label: emailValidLabel, validLine: emailValidLine, validType: emailValidType, validMessage: "", wrongValidMessage: "Некорректный адрес электронной почты", string: string, range: range)
        case passwordTextField: setTextfield(textField: passwordTextField, label: passwordValidLabel, validLine: passwordValidLine, validType: passwordValidType, validMessage: "", wrongValidMessage: "Минимум 6 символов", string: string, range: range)
        default: break
        }
        
        return false
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == emailTextField {
            
            
            emailPlaceholderCenterYConstraints?.constant = -12
            emailPlaceholderLeftAnchorConstraints?.constant = -8
            emailPlaceHolder.textColor = .systemGray
            performAnimation()
            
            
            emailPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            
        }  else if textField == passwordTextField {
            
            passwordPlaceHolderCenterYConstraints?.constant = -12
            passwordPlaceholderLeftAnchorConstraints?.constant = -5
            passwordPlaceHolder.textColor = .systemGray
            
            performAnimation()
            
            passwordPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        }
        
        
        
        
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let text = textField.text
        
        if textField == emailTextField && text!.isEmpty {
            
            emailPlaceholderCenterYConstraints?.constant = 0
            emailPlaceholderLeftAnchorConstraints?.constant = 0
            emailPlaceHolder.textColor = .systemGray
            performAnimation()
            
            emailPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            
        } else if textField == passwordTextField && text!.isEmpty {
            
            passwordPlaceHolderCenterYConstraints?.constant = 0
            passwordPlaceholderLeftAnchorConstraints?.constant = 0
            passwordPlaceHolder.textColor = .systemGray
            performAnimation()
            
            passwordPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            
        }
        
    }
    
    fileprivate func performAnimation() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            
            self.layoutIfNeeded()
            
        })
    }
    
    
    
}
