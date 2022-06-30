//
//  UserModel.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 22.06.22.
//

import Foundation
import UIKit

class UserModel: NSObject, NSCoding {
    
    
    
    let firstName: String
    let secondName: String
    let phoneNumber: String
    let email: String
    let dayOfBirth: String
    
    init(firstName: String, secondName: String, phoneNumber: String, email: String, dayOfBirth: String) {
        self.firstName = firstName
        self.secondName = secondName
        self.phoneNumber = phoneNumber
        self.email = email
        self.dayOfBirth = dayOfBirth
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(firstName, forKey: "firstName")
        coder.encode(secondName, forKey: "secondName")
        coder.encode(phoneNumber, forKey: "phoneNumber")
        coder.encode(email, forKey: "email")
        coder.encode(dayOfBirth, forKey: "dayOfBirth")
    }
    
    required init?(coder: NSCoder) {
        firstName = coder.decodeObject(forKey: "firstName") as? String ?? ""
        secondName = coder.decodeObject(forKey: "secondName") as? String ?? ""
        phoneNumber = coder.decodeObject(forKey: "phoneNumber") as? String ?? ""
        email = coder.decodeObject(forKey: "email") as? String ?? ""
        dayOfBirth = coder.decodeObject(forKey: "dayOfBirth") as? String ?? ""
    }
    
    
    
}
