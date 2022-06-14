//
//  SingInController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 8.06.22.
//

import UIKit

protocol CreateAnAccountDelegate: AnyObject {
    func createAnAccountButtonDidTapped()
}

protocol SignInButton: AnyObject {
    func signInButtonDidTapped()
}

class SignInController: UIViewController {
    
    
    private let singInView = SignInView()

   
    override func loadView() {
        super.loadView()
        view = singInView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        (view as? SignInView)?.createAnAccountDelegate = self
        (view as? SignInView)?.signInButtonDelegate = self
        

       
    }
    

    

}




extension SignInController: CreateAnAccountDelegate {
    
    func createAnAccountButtonDidTapped() {
        let controller = SignUpController()
        let userAuthController = UINavigationController(rootViewController: controller)
        userAuthController.modalPresentationStyle = .fullScreen
        present(userAuthController, animated: true)
        
    }
    
}


extension SignInController: SignInButton {
    
    func signInButtonDidTapped() {
        
        guard let email = singInView.emailTextField.text else { return }
        guard let password = singInView.passwordTextField.text else { return }
        
        logInUser(withEmail: email, password: password)
    }
    
    
    
}
