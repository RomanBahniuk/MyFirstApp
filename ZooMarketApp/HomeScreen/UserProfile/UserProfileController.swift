//
//  ViewController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 8.06.22.
//

import UIKit
import Firebase
import FirebaseDatabase
import CoreData


protocol PersonalDataCellDelegate: AnyObject {
    func personalDataCellTapped()
}

protocol AppThemeCellDelegate: AnyObject {
    func appThemeCellTapped()
}

protocol AccountManagerCellDelegate: AnyObject {
    func accountManagerCellTapped()
}

class UserProfileController: UIViewController {
    
    var tableViewSettings = [SettingsData(settingName: "Личные данные"),SettingsData(settingName: "Цвета приложения"), SettingsData(settingName: "Управление аккаунтом")]
    

    let firebaseNetworkData: FirebaseNetworkData = .init()
    
    let coreDatabase: CoreDatabase = .init()
    
    let userProfileView = UserProfileView()
    var userHeader: UserHeader!
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadUserData()
    }
    
    
    override func loadView() {
        super.loadView()
        
        
        view = userProfileView
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
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white
        
        navigationItem.title = "Профиль"
        
        let largeTitleAttribute = [NSAttributedString.Key.font:  UIFont(name: "Apple SD Gothic Neo Light", size: 32), NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleAttribute = [NSAttributedString.Key.font:  UIFont(name: "Apple SD Gothic Neo Light", size: 24), NSAttributedString.Key.foregroundColor: UIColor.black]
        
        appearance.largeTitleTextAttributes = largeTitleAttribute as [NSAttributedString.Key : Any]
        appearance.titleTextAttributes = titleAttribute as [NSAttributedString.Key : Any]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        
        
        
    }
    
    
    
    
    
    func configureTableView() {
        
        
        userProfileView.tableView.delegate = self
        userProfileView.tableView.dataSource = self
        userProfileView.tableView.rowHeight = 56
        userProfileView.tableView.register(UserProfileCell.self, forCellReuseIdentifier: "UserProfileCell")
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 152)
        userHeader = UserHeader(frame: frame)
        userProfileView.tableView.tableHeaderView = userHeader
        
    }
    
    
    
}

extension UserProfileController: PersonalDataCellDelegate {
    func personalDataCellTapped() {
        
        let controller = PersonalDataController()
        let personalDataController = UINavigationController(rootViewController: controller)
        personalDataController.modalPresentationStyle = .fullScreen
        
        controller.completionHandler = { [weak self]  image in
            self!.userHeader.userImage.image = image
            
        }
        present(personalDataController, animated: true)
        

    
    }
    
    
}


extension UserProfileController: AppThemeCellDelegate {
    func appThemeCellTapped() {
        
        let controller = AppThemeController()
        let appThemeController = UINavigationController(rootViewController: controller)
        appThemeController.modalPresentationStyle = .fullScreen
        present(appThemeController, animated: true)
    }
    
    
}

extension UserProfileController: AccountManagerCellDelegate {
    func accountManagerCellTapped() {
        let controller = AccountManagerController()
        let accountManagerController = UINavigationController(rootViewController: controller)
        accountManagerController.modalPresentationStyle = .fullScreen
        present(accountManagerController, animated: true)
        
    }
    
    
}



