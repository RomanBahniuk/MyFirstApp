//
//  AccountManagerView.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 1.07.22.
//

import UIKit

class AccountManagerView: UIView {
    
    
    
    let firebaseNetworkData: FirebaseNetworkData = .init()
    
    
    weak var signOutButtonDelegate: SignOutButtonDelegate?
    weak var deleteAccountButtonDelegate: DeleteAccountButtonDelegate?
    
    
    lazy var accountManagerLabel: UILabel = {
        let accountManagerLabel = UILabel()
        accountManagerLabel.text = "Управление аккаунтом"
        accountManagerLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 32)

        return accountManagerLabel
    }()
    
    lazy var signOutButton: UIButton = {
       let signOutButton = UIButton()
        signOutButton.backgroundColor = .systemGray6
        signOutButton.setTitle("Выйти из аккаунта", for: .normal)
        signOutButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Medium", size: 14)
        signOutButton.setTitleColor(UIColor.black, for: .normal)
        signOutButton.setTitleColor(UIColor.black.withAlphaComponent(0.7), for: .highlighted)
        signOutButton.layer.cornerRadius = 16
        
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        
        return signOutButton
        
    }()
    
    lazy var deleteAccountButton: UIButton = {
        let deleteAccountButton = UIButton()
        deleteAccountButton.backgroundColor = .systemGray6
        deleteAccountButton.setTitle("Удалить аккаунт", for: .normal)
        deleteAccountButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Medium", size: 14)
        deleteAccountButton.setTitleColor(UIColor.systemRed, for: .normal)
        deleteAccountButton.setTitleColor(UIColor.systemRed.withAlphaComponent(0.7), for: .highlighted)
        deleteAccountButton.layer.cornerRadius = 16
        
        deleteAccountButton.addTarget(self, action: #selector(deleteAccountButtonTapped), for: .touchUpInside)
         
        return deleteAccountButton
    
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}






private extension AccountManagerView {
    func addSubviews() {
        addSubview(accountManagerLabel)
        addSubview(signOutButton)
        addSubview(deleteAccountButton)
   
    }
    
    
    func setConstraints() {
        accountManagerLabelConstraints()
        signOutButtonConstraints()
        deleteAccountButtonConstraints()
        
    }
    
    func accountManagerLabelConstraints() {
        accountManagerLabel.translatesAutoresizingMaskIntoConstraints = false
        [accountManagerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
         accountManagerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32)].forEach {
            $0.isActive = true
        }
    }
    
    
    func signOutButtonConstraints() {
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        [signOutButton.topAnchor.constraint(equalTo: accountManagerLabel.bottomAnchor, constant: 32),
            signOutButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         signOutButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         signOutButton.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
    }
    
    
    func deleteAccountButtonConstraints() {
        deleteAccountButton.translatesAutoresizingMaskIntoConstraints = false
        [deleteAccountButton.topAnchor.constraint(equalTo: signOutButton.bottomAnchor, constant: 8),
         deleteAccountButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         deleteAccountButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         deleteAccountButton.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
    }
    
    
    

}
