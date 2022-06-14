//
//  HomeBarController.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//

import UIKit

class HomeBarController: UITabBarController {
    

    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarControllers()
        authenticateUser()
        tabBar.tintColor = .systemIndigo
        tabBar.unselectedItemTintColor = .gray

    }
    

  

}


extension HomeBarController {
    
    private func setNavController(controller: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(named: itemImage), tag: 0)
        
        let navController = UINavigationController(rootViewController: controller)
        navController.tabBarItem = item
        
        return navController
    }
    
    
    private func setTabBarControllers() {
        
        let mainPage = setNavController(controller: MainPageController(), itemName: "Главная", itemImage: "MainPage")
        let catalogPage = setNavController(controller: CatalogPageController(), itemName: "Каталог", itemImage: "CatalogPage")
        let productCartPage = setNavController(controller: ProductCartPage(), itemName: "Корзина", itemImage: "ProductCartPage")
        let userProfilePage = setNavController(controller: UserProfileController(), itemName: "Мой профиль", itemImage: "UserSettings")
        
        
        viewControllers = [mainPage, catalogPage, productCartPage, userProfilePage]
        
        


        
    }
    
    
    
    
    
}

