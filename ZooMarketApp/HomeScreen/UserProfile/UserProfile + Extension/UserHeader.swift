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
        userImage.image = UIImage(named: "ManageAccount")
        userImage.tintColor = .black
        
        
        return userImage
    }()
    
    
    lazy var manageAccountLabel: UILabel = {
        let manageAccountLabel = UILabel()
        manageAccountLabel.text = "Управление аккаунтом"
        manageAccountLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 18)
        
        
        return manageAccountLabel
        
    }()
    
    
    lazy var rightArrowImage: UIImageView = {
        let rightArrowImage = UIImageView()
        rightArrowImage.image = UIImage(named: "RightArrow")
        rightArrowImage.tintColor = .black
        
        return rightArrowImage
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
        addSubview(manageAccountLabel)
        addSubview(rightArrowImage)
    }
    
    func setConstraints() {
        userImageConstraints()
        manageAccountLabelConstraints()
        rightArrowImageConstraints()
    }
    
    func userImageConstraints() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        [userImage.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 0),
         userImage.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 8),
         userImage.heightAnchor.constraint(equalToConstant: 72),
         userImage.widthAnchor.constraint(equalToConstant: 72)].forEach {
            $0.isActive = true
        }
    }
    
    func manageAccountLabelConstraints() {
        manageAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        [manageAccountLabel.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 18),
         manageAccountLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12)].forEach {
            $0.isActive = true
            
        }
    }
    
    
    func rightArrowImageConstraints() {
        rightArrowImage.translatesAutoresizingMaskIntoConstraints = false
        [rightArrowImage.centerYAnchor.constraint(equalTo: userImage.centerYAnchor, constant: 0),
         rightArrowImage.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -24),
         rightArrowImage.heightAnchor.constraint(equalToConstant: 24),
         rightArrowImage.widthAnchor.constraint(equalToConstant: 24)].forEach {
            $0.isActive = true
        }
        
    }
    
    
    
}
