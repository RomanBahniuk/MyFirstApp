//
//  CatalogPageView.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 4.07.22.
//

import UIKit

class CatalogPageView: UIView {

   
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        
        return tableView
    }()
    
    
    
    
    override init(frame: CGRect) {
        super  .init(frame: frame)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




private extension CatalogPageView {
    
    func addSubviews() {
        addSubview(tableView)
    }
    
    
    func setConstraints() {
        tableViewConstraints()
        
        
    }
    
    
    
    func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 48),
         tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0),
         tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
         tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)].forEach {
            $0.isActive = true
        }
        
        
    }
}
