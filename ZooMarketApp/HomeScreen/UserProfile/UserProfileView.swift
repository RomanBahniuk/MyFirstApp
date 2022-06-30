//
//  UserProfileView.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 13.06.22.
//

import UIKit

class UserProfileView: UIView {
    
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
        
        
        
        return tableView
        
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



private extension UserProfileView {
    
    func addSubviews() {
        addSubview(tableView)
    }
    
    func setConstraints() {
        tableViewConstraints()
    }
    
    // MARK: Constraints
    
    func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
         tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)].forEach {
            $0.isActive = true
        }
    }
}
