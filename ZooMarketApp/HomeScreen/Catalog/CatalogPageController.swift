//
//  CatalogPageController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//

import UIKit

class CatalogPageController: UIViewController {

    let catalogPageView = CatalogPageView()
    
    
    override func loadView() {
        super.loadView()
        view = catalogPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureTableView()
    }
    

    

}









