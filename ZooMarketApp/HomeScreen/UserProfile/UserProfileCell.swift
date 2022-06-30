//
//  UserProfileCell.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//

import UIKit

class UserProfileCell: UITableViewCell {

    
    
    
    
    lazy var containerView: UIView = {
       let containerView = UIView()
        containerView.addSubview(settingLabel)
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 16
        
        
        
        return containerView
    }()
    lazy var settingLabel: UILabel = {
       let settingLabel = UILabel()
        settingLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 18)
        
        
        return settingLabel
    }()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
        
        backgroundColor = .white
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(settingsName: SettingsData) {
        settingLabel.text = settingsName.settingName
    }
    
}




 private extension UserProfileCell {
    
     func addSubviews() {
         contentView.addSubview(containerView)
     }
     
     func setConstraints() {
         containerViewConstraints()
         settingLabelConstraints()
     }
     
     
     func containerViewConstraints() {
         containerView.translatesAutoresizingMaskIntoConstraints = false
         [containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 32),
         containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
          containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
          containerView.heightAnchor.constraint(equalToConstant: 40)].forEach {
             $0.isActive = true
         }
     }
    
     func settingLabelConstraints() {
         settingLabel.translatesAutoresizingMaskIntoConstraints = false
         [settingLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
          settingLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
          settingLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0)].forEach {
             $0.isActive = true
         }
     }
}
