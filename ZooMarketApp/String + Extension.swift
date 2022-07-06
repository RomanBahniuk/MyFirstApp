//
//  String + Extension.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 13.06.22.
//

import Foundation
import UIKit


extension String {
    
    enum ValidTypes {
        
        case userName
        case userSecondName
        case email
        case password
        
        
    }
    
    enum RegEx: String {
        
        case userName = "[а-яА-я]{1,20}"
        case userSecondName = "[а-яА-я]{1,19}"
        case email = "[a-zA-z0-9._]+@[a-zA-z]+\\.[a-zA-Z]{2,3}"
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"
       
        
    }
    
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .userName:
            regex = RegEx.userName.rawValue
        case .userSecondName:
            regex = RegEx.userSecondName.rawValue
        case .email:
            regex = RegEx.email.rawValue
        case .password:
            regex = RegEx.password.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
}
