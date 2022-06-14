//
//  ViewController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 8.06.22.
//

import UIKit
import Firebase
import FirebaseDatabase

class UserProfileController: UIViewController {

   
    //let userProfileView = UserProfileView()
    var tableView: UITableView!
    var userHeader: UserHeader!
    
    
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
    }


}



extension UserProfileController {
    
    func configureNavBar() {
        
        configureTableView()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemIndigo

        let largeTitleAttribute = [NSAttributedString.Key.font:  UIFont(name: "Apple SD Gothic Neo Bold", size: 32), NSAttributedString.Key.foregroundColor: UIColor.white]
        let titleAttribute = [NSAttributedString.Key.font:  UIFont(name: "Apple SD Gothic Neo Bold", size: 24), NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = largeTitleAttribute as [NSAttributedString.Key : Any]
        appearance.titleTextAttributes = titleAttribute as [NSAttributedString.Key : Any]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Профиль"

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
       
    }
    
    func configureTableView() {
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 56
        tableView.register(UserProfileCell.self, forCellReuseIdentifier: "UserProfileCell")
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        
        
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 96)
        userHeader = UserHeader(frame: frame)
        tableView.tableHeaderView = userHeader
        
        
        
        
    }
}



