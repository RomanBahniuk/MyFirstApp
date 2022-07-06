//
//  Catalog + TableView.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 4.07.22.
//

import Foundation
import UIKit




extension CatalogPageController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        
        catalogPageView.tableView.delegate = self
        catalogPageView.tableView.dataSource = self
        catalogPageView.tableView.register(CatalogPageCell.self, forCellReuseIdentifier: "CatalogPageCell")
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatalogPageCell", for: indexPath) as! CatalogPageCell
        
        
        
        return cell
    }
    
    
    
    
    
}
