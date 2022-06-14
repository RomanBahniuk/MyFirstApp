//
//  UserAuthController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 11.06.22.
//

import UIKit
import Firebase
import FirebaseDatabase

protocol signUpButton: AnyObject {
    func signUpButtonDidTapped()
}

class SignUpController: UIViewController {

    
    private let customSignUpView = SignUpView()
    
    
    override func loadView() {
        super.loadView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backBarButton))
        view = customSignUpView
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        (view as? SignUpView)?.signUpButtonDelegate = self

    }
    
    @objc private func backBarButton() {
        dismiss(animated: true)
    }
    

}


extension SignUpController: signUpButton {
    func signUpButtonDidTapped() {
        
        guard let userName = customSignUpView.userNameTextField.text else { return }
        guard let email = customSignUpView.userEmailTextField.text else { return }
        guard let password = customSignUpView.userPasswordTextfield.text else { return }
        
        createUser(withUserName: userName, email: email, password: password)
        
//        let controller = UserProfileController()
//        let userProfileController = UINavigationController(rootViewController: controller)
//        userProfileController.modalPresentationStyle = .fullScreen
//        present(userProfileController, animated: true)
    
    }
    
    
}
