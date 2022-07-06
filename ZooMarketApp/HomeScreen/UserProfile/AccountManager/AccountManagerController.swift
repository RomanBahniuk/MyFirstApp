//
//  AccountManagerController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 1.07.22.
//

import UIKit

protocol SignOutButtonDelegate: AnyObject {
    
    func signOutButtonDidTapped()
}

protocol DeleteAccountButtonDelegate: AnyObject {
    
    func deleteAccountButtonDidTapped()
}


class AccountManagerController: UIViewController {
    
    let firebaseNetworkData: FirebaseNetworkData = .init()
    let accountManagerView = AccountManagerView()
    

    
    override func loadView() {
        super.loadView()
        navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButonTapped))
        
        view = accountManagerView
        
        
    }
                                                            
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (view as? AccountManagerView)?.signOutButtonDelegate = self
        (view as? AccountManagerView)?.deleteAccountButtonDelegate = self

        view.backgroundColor = .white
        
    }
    

    

}



extension AccountManagerController: SignOutButtonDelegate {
    
    func signOutButtonDidTapped() {
        
        signOutAlert()
        
    }
    
}



extension AccountManagerController: DeleteAccountButtonDelegate {
    func deleteAccountButtonDidTapped() {
        
        deleteAccountAlert()
    }
    
    
    
}
