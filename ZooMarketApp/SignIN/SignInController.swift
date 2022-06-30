//
//  SingInController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 8.06.22.
//

import UIKit

class SignInController: UIViewController {
    
    
    private let singInView = SignInView()
    
    let firebaseNetworkData: FirebaseNetworkData = .init()

   
    override func loadView() {
        super.loadView()
        view = singInView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        (view as? SignInView)?.createAnAccountDelegate = self
        (view as? SignInView)?.signInButtonDelegate = self
        (view as? SignInView)?.alertMessageDelegate = self
        
        

       
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
        
        firebaseNetworkData.logInUser(withEmail: email, password: password)
        
        self.dismiss(animated: true)
    }
    
    
    
}



extension SignInController: SignInAlert {
    
    func signInAlertMessage(_ userMessage: String) {
        let alert = UIAlertController(title: "Внимание", message: userMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Понятно", style: .default, handler: nil))
        present(alert, animated: true)
        
    }
    
    
}


