//
//  TableView + Delegate.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase



extension UserProfileController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 8).isActive = true
        
        return view
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewSettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell", for: indexPath) as? UserProfileCell
        
        cell?.update(settingsName: tableViewSettings[indexPath.row])
        
        if indexPath.row == 2 {
            cell?.settingLabel.textColor = .systemRed
        }
        
        return cell!
        
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            personalDataCellTapped()
        case 1:
            appThemeCellTapped()
        case 2:
            signOutAlert()

            
        default: break
            
        }
        
    }
    
    
    
}
    

