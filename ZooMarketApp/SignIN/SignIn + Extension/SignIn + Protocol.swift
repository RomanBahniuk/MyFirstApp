//
//  SignIn + Protocol.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 15.06.22.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase


protocol CreateAnAccountDelegate: AnyObject {
    func createAnAccountButtonDidTapped()
}

protocol SignInButton: AnyObject {
    func signInButtonDidTapped()
}


protocol SignInAlert: AnyObject {
    func signInAlertMessage(_ userMessage: String)
}







