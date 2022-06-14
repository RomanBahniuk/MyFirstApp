//
//  TextFieldSetup.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 13.06.22.
//

import Foundation
import UIKit


extension SignUpView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        userNameTextField.resignFirstResponder()
        userEmailTextField.resignFirstResponder()
        userPasswordTextfield.resignFirstResponder()
        
        return true
    }
    
    
    func setAuthTextfield(textField: UITextField, label: UILabel, validLine: UIView, validType: String.ValidTypes, validMessage: String, wrongValidMessage: String, string: String, range: NSRange) {
        
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
        case userNameTextField:
            setAuthTextfield(textField: userNameTextField, label: userNameValidLabel, validLine: userNameValidLine, validType: UserNameValidType, validMessage: "", wrongValidMessage: "Только кириллица, не больше 20 символов", string: string, range: range)
        case userEmailTextField: setAuthTextfield(textField: userEmailTextField, label: userEmailValidLabel, validLine: userEmailValidLine, validType: UserEmailValidType, validMessage: "", wrongValidMessage: "Некорректный адрес электронной почты", string: string, range: range)
        case userPasswordTextfield: setAuthTextfield(textField: userPasswordTextfield, label: userPasswordValidLabel, validLine: userPasswordValidLine, validType: UserPasswordValidType, validMessage: "", wrongValidMessage: "Пароль должен состоять из заглавной и прописной буквы \nс использованием цифр. Минимум 6 символов", string: string, range: range)
        default: break
        }
        
        return false
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == userNameTextField {
            
            
            userNamePlaceholderCenterYAnchor?.constant = -12
            userNamePlaceholderLeftAnchor?.constant = -5
            userNamePlaceholder.textColor = .systemGray
            
            perfomAnimation()
            
            
            userNamePlaceholder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            
        }  else if textField == userEmailTextField {
            
            userEmailPlaceholderCenterYAnchor?.constant = -12
            userEmailPlaceholderLeftAnchor?.constant = -5
            userEmailPlaceholder.textColor = .systemGray
            
            perfomAnimation()
            
            userEmailPlaceholder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        } else if textField == userPasswordTextfield {
            
            userPasswordPlaceholderCenterYAnchor?.constant = -12
            userPasswordPlaceholderLeftAnchor?.constant = -5
            userPasswordPlaceholder.textColor = .systemGray
            
            perfomAnimation()
            
            userPasswordPlaceholder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let text = textField.text
        
        if textField == userNameTextField && text!.isEmpty {
            
            userNamePlaceholderCenterYAnchor?.constant = 0
            userNamePlaceholderLeftAnchor?.constant = 0
            userNamePlaceholder.textColor = .systemGray
            perfomAnimation()
            
            userNamePlaceholder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            
        } else if textField == userEmailTextField && text!.isEmpty {
            
            userEmailPlaceholderCenterYAnchor?.constant = 0
            userEmailPlaceholderLeftAnchor?.constant = 0
            userEmailPlaceholder.textColor = .systemGray
            perfomAnimation()
            
            userEmailPlaceholder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            
        } else if textField == userPasswordTextfield && text!.isEmpty {
            
            userPasswordPlaceholderCenterYAnchor?.constant = 0
            userPasswordPlaceholderLeftAnchor?.constant = 0
            userPasswordPlaceholder.textColor = .systemGray
            perfomAnimation()
            
            userPasswordPlaceholder.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    
    fileprivate func perfomAnimation() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            
            self.layoutIfNeeded()
            
        })
    }
}
