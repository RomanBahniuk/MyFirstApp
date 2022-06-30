//
//  AppThemeView.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 19.06.22.
//

import UIKit

class AppThemeView: UIView {

    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        
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


private extension AppThemeView {
    
    func addSubviews() {
        
    }
    
    func setConstraints() {
        
    }
}
