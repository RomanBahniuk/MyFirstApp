//
//  CatalogSearchController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 6.07.22.
//

import UIKit

class CatalogSearchController: UIViewController {

    
    let catalogTableView = CatalogPageController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSearchBar()
        configureCatalogTableView()

        
    }
    

    

}



extension CatalogSearchController: UISearchControllerDelegate {
    
    func configureSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.tintColor = .systemGray6
        searchController.searchBar.setValue("Отмена", forKey: "cancelButtonText")

        let cancelButtonFont = UIFont(name: "Apple SD Gothic Neo Light", size: 16)
        let cancelButtonColor = UIColor.systemGray
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key.font: cancelButtonFont!, NSAttributedString.Key.foregroundColor : cancelButtonColor], for: .normal)
        
        if let searchBarPlaceholder = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            let placeholder = NSAttributedString(string: "Искать на ZooMarket", attributes: [.font : UIFont(name: "Apple SD Gothic Neo Light", size: 16)!])
            searchBarPlaceholder.attributedPlaceholder = placeholder
            
        }
        
        navigationItem.searchController = searchController

        
    }
    
    
}



extension CatalogSearchController {
    
    func configureCatalogTableView() {
        addChild(catalogTableView)
        view.addSubview(catalogTableView.view)
        catalogTableView.didMove(toParent: self)
        catalogTableViewConstraints()
        
    }
    
    
    func catalogTableViewConstraints() {
        catalogTableView.view.translatesAutoresizingMaskIntoConstraints = false
        [catalogTableView.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
         catalogTableView.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
         catalogTableView.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
         catalogTableView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)].forEach {
            $0.isActive = true
        }
    }
    
    
}
