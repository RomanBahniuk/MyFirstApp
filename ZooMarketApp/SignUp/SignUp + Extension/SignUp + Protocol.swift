//
//  SignUp + Protocol.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 15.06.22.
//

import Foundation


protocol SignUpButton: AnyObject {
    func signUpButtonDidTapped()
}

protocol SignUpAlert: AnyObject {
    func signUpAlertMessage(_ userMessage: String)
}



