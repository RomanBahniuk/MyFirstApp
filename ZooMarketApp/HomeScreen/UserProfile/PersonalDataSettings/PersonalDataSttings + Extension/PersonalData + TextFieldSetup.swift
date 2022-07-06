//
//  PersonalData + TextFieldSetup.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 20.06.22.
//

import Foundation
import UIKit
import FirebaseFirestore
import Firebase


extension PersonalDataView: UITextFieldDelegate {
    
    
    func setAuthTextfield(textField: UITextField, label: UILabel, validLine: UIView, validType: String.ValidTypes, wrongValidMessage: String, string: String, range: NSRange) {
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        textField.text = result
        
        switch textField {
            
        case firstNameTextField:
            if firstNameTextField.text!.isValid(validType:validType) && secondNameTextField.text!.isValid(validType: validType) && !emailTextField.text!.isEmpty {
                
                
                
                saveChangesButton.backgroundColor = .systemIndigo.withAlphaComponent(0.9)
                saveChangesButton.setTitleColor(.white, for: .normal)
                saveChangesButton.isEnabled = true
                
            } else {
                
                
                saveChangesButton.backgroundColor = .systemGray.withAlphaComponent(0.8)
                saveChangesButton.setTitleColor(.systemGray6, for: .normal)
                saveChangesButton.isEnabled = false
                
                
            }
            
        case secondNameTextField:
            
            if secondNameTextField.text!.isValid(validType: validType) && firstNameTextField.text!.isValid(validType: validType) && !emailTextField.text!.isEmpty  {
                
                
                saveChangesButton.backgroundColor = .systemIndigo.withAlphaComponent(0.9)
                saveChangesButton.setTitleColor(.white, for: .normal)
                saveChangesButton.isEnabled = true
                
                
                
                
            } else {
                
                saveChangesButton.backgroundColor = .systemGray.withAlphaComponent(0.8)
                saveChangesButton.setTitleColor(.systemGray6, for: .normal)
                saveChangesButton.isEnabled = false
                
                
            }
            
            
        case emailTextField:
            
            if !firstNameTextField.text!.isEmpty && emailTextField.text!.isValid(validType: validType) && !secondNameTextField.text!.isEmpty {
                
                
                saveChangesButton.backgroundColor = .systemIndigo.withAlphaComponent(0.9)
                saveChangesButton.setTitleColor(.white, for: .normal)
                saveChangesButton.isEnabled = true
                
                
            } else {
                
                saveChangesButton.backgroundColor = .systemGray.withAlphaComponent(0.8)
                saveChangesButton.setTitleColor(.systemGray6, for: .normal)
                saveChangesButton.isEnabled = false
                
            }
        default: break
        }
        
        
        
        
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case firstNameTextField: setAuthTextfield(textField: firstNameTextField, label: firstNamelValidLabel, validLine: firstNameValidLine, validType: firstNameValidType , wrongValidMessage: "Только кириллица, не больше 20 символов", string: string, range: range)
        case secondNameTextField: setAuthTextfield(textField: secondNameTextField, label: secondNameValidLabel, validLine: secondNameValidLine, validType: secondNameValidType , wrongValidMessage: "Только кириллица, не больше 20 символов", string: string, range: range)
        case emailTextField: setAuthTextfield(textField: emailTextField, label: emailValidLabel, validLine: emailValidLine, validType: emailValidType, wrongValidMessage: "Некорректный адрес электронной почты", string: string, range: range)
        case phoneNumberTextField: phoneNumberTextField.text = setPhoneNumberMask(textField: phoneNumberTextField, mask: "+XXX (XX) XXX-XX-XX", string: string, range: range)
        default: break
        }
        
        
        return false
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        firstNameTextField.resignFirstResponder()
        secondNameTextField.resignFirstResponder()
        phoneNumberTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        dayOfBirthTextField.resignFirstResponder()
        
        return true
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case firstNameTextField:
            
            firstNamePlaceholderCenterYAnchor?.constant = -12
            firstNamePlaceholderLeftAnchor?.constant = -5
            firstNameTextFieldPlaceHolder.textColor = .systemGray
            perfomAnimation()
            
            firstNameTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        case secondNameTextField:
            
            secondNamePlaceholderCenterYAnchor?.constant = -12
            secondNamePlaceholderLeftAnchor?.constant = -5
            secondNameTextFieldPlaceHolder.textColor = .systemGray
            perfomAnimation()
            
            secondNameTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        case phoneNumberTextField:
            
            phoneNumberPlaceholderCenterYAnchor?.constant = -12
            phoneNumberPlaceholderLeftAnchor?.constant = -5
            phoneNumberTextFieldPlaceHolder.textColor = .systemGray
            perfomAnimation()
            
            phoneNumberTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        case emailTextField:
            
            emailPlaceholderCenterYAnchor?.constant = -12
            emailPlaceholderLeftAnchor?.constant = -5
            emailTextFieldPlaceHolder.textColor = .systemGray
            perfomAnimation()
            
            emailTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        case dayOfBirthTextField:
            
            dayOfBirthPlaceholderCenterYAnchor?.constant = -12
            dayOfBirthPlaceholderLeftAnchor?.constant = -5
            dayOfBirthTextFieldPlaceHolder.textColor = .systemGray
            perfomAnimation()
            
            dayOfBirthTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            
        default: break
            
        }
        
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text
        
        if textField == firstNameTextField && text!.isEmpty {
            
            firstNamePlaceholderCenterYAnchor?.constant = 0
            firstNamePlaceholderLeftAnchor?.constant = 0
            perfomAnimation()
            
            firstNameTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        } else if textField == secondNameTextField && text!.isEmpty {
            
            secondNamePlaceholderCenterYAnchor?.constant = 0
            secondNamePlaceholderLeftAnchor?.constant = 0
            perfomAnimation()
            
            secondNameTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        } else if textField == phoneNumberTextField && text!.isEmpty {
            
            phoneNumberPlaceholderCenterYAnchor?.constant = 0
            phoneNumberPlaceholderLeftAnchor?.constant = 0
            perfomAnimation()
            
            phoneNumberTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        } else if textField == emailTextField && text!.isEmpty {
            
            emailPlaceholderCenterYAnchor?.constant = 0
            emailPlaceholderLeftAnchor?.constant = 0
            perfomAnimation()
            
            emailTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        } else if textField == dayOfBirthTextField && text!.isEmpty {
            
            dayOfBirthPlaceholderCenterYAnchor?.constant = 0
            dayOfBirthPlaceholderLeftAnchor?.constant = 0
            perfomAnimation()
            
            dayOfBirthTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        }
    }
    
    fileprivate func perfomAnimation() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            
            self.layoutIfNeeded()
            
        })
    }
    
    private func setPhoneNumberMask(textField: UITextField, mask: String, string: String, range: NSRange) -> String {
        
        let text = textField.text ?? ""
        
        let phoneNumberMask = (text as NSString).replacingCharacters(in: range, with: string)
        let phoneNumber = phoneNumberMask.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = phoneNumber.startIndex
        
        for character in mask where index < phoneNumber.endIndex {
            if character == "X" {
                result.append(phoneNumber[index])
                index = phoneNumber.index(after: index)
            } else {
                result.append(character)
            }
        }
        
        return result
    }
    
    
    func addLeftViewTo(textField: UITextField) {
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        leftView.layer.cornerRadius = 16
        leftView.backgroundColor = .systemGray6
        
        textField.leftView = leftView
        textField.leftViewMode = .always
        
        
    }
    
    func textFieldPlaceholderSetup() {
        
        
        if firstNameTextField.text!.isEmpty {
            
            firstNamePlaceholderCenterYAnchor?.constant = 0
            firstNamePlaceholderLeftAnchor?.constant = 0
            
            
            firstNameTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        } else {
            
            firstNamePlaceholderCenterYAnchor?.constant = -12
            firstNamePlaceholderLeftAnchor?.constant = -5
            firstNameTextFieldPlaceHolder.textColor = .systemGray
            
            firstNameTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            perfomAnimation()
            
            
        }
        
        
        if secondNameTextField.text!.isEmpty {
            
            secondNamePlaceholderCenterYAnchor?.constant = 0
            secondNamePlaceholderLeftAnchor?.constant = 0
            
            
            secondNameTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            
        } else {
            
            
            secondNamePlaceholderCenterYAnchor?.constant = -12
            secondNamePlaceholderLeftAnchor?.constant = -5
            secondNameTextFieldPlaceHolder.textColor = .systemGray
            
            secondNameTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            perfomAnimation()
            
            
        }
        
        
        if phoneNumberTextField.text!.isEmpty {
            
            phoneNumberPlaceholderCenterYAnchor?.constant = 0
            phoneNumberPlaceholderLeftAnchor?.constant = 0
            phoneNumberTextFieldPlaceHolder.textColor = .systemGray
            
            
            phoneNumberTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            
        } else {
            
            phoneNumberPlaceholderCenterYAnchor?.constant = -12
            phoneNumberPlaceholderLeftAnchor?.constant = -5
            phoneNumberTextFieldPlaceHolder.textColor = .systemGray
            
            phoneNumberTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            perfomAnimation()
            
            
            
        }
        
        
        if emailTextField.text!.isEmpty {
            
            emailPlaceholderCenterYAnchor?.constant = 0
            emailPlaceholderLeftAnchor?.constant = 0
            
            emailTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            
        } else {
            
            
            emailPlaceholderCenterYAnchor?.constant = -12
            emailPlaceholderLeftAnchor?.constant = -5
            
            emailTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            perfomAnimation()
            
        }
        
        
        if dayOfBirthTextField.text!.isEmpty {
            
            dayOfBirthPlaceholderCenterYAnchor?.constant = 0
            dayOfBirthPlaceholderLeftAnchor?.constant = 0
            
            dayOfBirthTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        } else {
            
            dayOfBirthPlaceholderCenterYAnchor?.constant = -12
            dayOfBirthPlaceholderLeftAnchor?.constant = -5
            dayOfBirthTextFieldPlaceHolder.textColor = .systemGray
            
            dayOfBirthTextFieldPlaceHolder.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            perfomAnimation()
            
            
        }
        
    }
    
    
    
    
    
}











