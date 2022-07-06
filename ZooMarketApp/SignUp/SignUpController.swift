//
//  UserAuthController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 11.06.22.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseFirestore

final class SignUpController: UIViewController {

    
    private let customSignUpView = SignUpView()
    private let pesonaldataView = PersonalDataView()
    
    private let firebaseNetworkData: FirebaseNetworkData = .init()
    
    
    override func loadView() {
        super.loadView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backBarButton))
        view = customSignUpView
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        (view as? SignUpView)?.signUpButtonDelegate = self
        (view as? SignUpView)?.signUpAlertDelegate = self

    }
    
    @objc private func backBarButton() {
        dismiss(animated: true)
    }
    
}


extension SignUpController: SignUpButton {
    
    func signUpButtonDidTapped() {
        
        guard let userName = customSignUpView.userNameTextField.text else { return }
        guard let userSecondName = customSignUpView.userSecondNameTextField.text else { return }
        guard let email = customSignUpView.userEmailTextField.text else { return }
        guard let password = customSignUpView.userPasswordTextfield.text else { return }
        guard let userPhoneNumber = pesonaldataView.phoneNumberTextField.text else {return}
        guard let userDayOfBirth = pesonaldataView.dayOfBirthTextField.text else {return}

        firebaseNetworkData.createUser(withUserName: userName, userSecondName: userSecondName, userPhoneNumber: userPhoneNumber, userDayOfBirth: userDayOfBirth, email: email, password: password, userProfileImage: "")
        
        firebaseNetworkData.chekUserEmail(emailText: customSignUpView.userEmailTextField.text!) { (success) in
            if success == true {
                print("email exist!")
            } else {
                print("email is free!")
            }
        }
        
        self.dismiss(animated: true)
        
    
    }
    
    
}



extension SignUpController: SignUpAlert {
    func signUpAlertMessage(_ userMessage: String) {
        
        let alert = UIAlertController(title: "Внимание", message: userMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Понятно", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
}



extension SignUpController {
    
    
}





        
                        
                
                
            
    
    

