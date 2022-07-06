//
//  UserHeader.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//

import UIKit

class UserHeader: UIView {
    
    
    
    lazy var userImage: UIImageView = {
        let userImage = UIImageView()
        
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = 36
        userImage.image = UIImage(named: "UserProfileImage")
        userImage.tintColor = .black
        userImage.isUserInteractionEnabled = true
        
        
        return userImage
    }()
    
    
    lazy var userFirstName: UILabel = {
        let userFirstName = UILabel()
        userFirstName.font = UIFont(name: "Apple SD Gothic Neo Light", size: 24)
       
        return userFirstName
    }()
    
    lazy var userSecondName: UILabel = {
        let userSecondName = UILabel()
        userSecondName.font = UIFont(name: "Apple SD Gothic Neo Light", size: 24)
       
        return userSecondName
    }()
    
    
    
    lazy var userEmail: UILabel = {
       let userEmail = UILabel()
        userEmail.font = UIFont(name: "Apple SD Gothic Neo Light", size: 16)
        
         
        return userEmail
        
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



private extension UserHeader {
    
    func addSubviews() {
        addSubview(userImage)
        addSubview(userFirstName)
        addSubview(userSecondName)
        addSubview(userEmail)
        
    }
    
    func setConstraints() {
        userImageConstraints()
        userFirstNameConstraints()
        userSecondNameConstraints()
        userEmailConstraints()
    }
    
    func userImageConstraints() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        [userImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
         userImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32),
         userImage.heightAnchor.constraint(equalToConstant: 72),
         userImage.widthAnchor.constraint(equalToConstant: 72)].forEach {
            $0.isActive = true
        }
    }
    
    func userFirstNameConstraints() {
        userFirstName.translatesAutoresizingMaskIntoConstraints = false
        [userFirstName.centerYAnchor.constraint(equalTo: userImage.centerYAnchor, constant: 0),
         userFirstName.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 16)].forEach {
            $0.isActive = true
        }
    }
    
    func userSecondNameConstraints() {
        userSecondName.translatesAutoresizingMaskIntoConstraints = false
        [userSecondName.centerYAnchor.constraint(equalTo: userImage.centerYAnchor, constant: 0),
         userSecondName.leftAnchor.constraint(equalTo: userFirstName.rightAnchor, constant: 6)].forEach {
            $0.isActive = true
        }
    }
    
    
    func userEmailConstraints() {
        userEmail.translatesAutoresizingMaskIntoConstraints = false
        [userEmail.topAnchor.constraint(equalTo: userFirstName.bottomAnchor, constant: 0),
         userEmail.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 16)].forEach {
            $0.isActive = true
        }
        
    }
    
    
    
    
    
}





