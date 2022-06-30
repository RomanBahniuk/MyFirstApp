//
//  AppThemeController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 19.06.22.
//

import UIKit

class AppThemeController: UIViewController {

    
   var appThemeView = AppThemeView()
    
    
    override func loadView() {
        super.loadView()
        view = appThemeView
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButonTapped))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}


