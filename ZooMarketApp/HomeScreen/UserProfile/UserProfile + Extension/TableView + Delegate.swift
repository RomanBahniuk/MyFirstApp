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



extension UserProfileController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemIndigo
        
        let title = UILabel()
        title.font = UIFont(name: "Apple SD Gothic Neo Medium", size: 16)
        title.textColor = .white
        title.text = SettingsSections(rawValue: section)?.description
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        guard let section = SettingsSections(rawValue: section) else { return 0 }
        
        switch section {
        case .privateData: return PrivateDataOptions.allCases.count
        case .appInfo: return AppInfoOptions.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell", for: indexPath) as! UserProfileCell
        
        guard let section = SettingsSections(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .privateData:
            let privateData = PrivateDataOptions(rawValue: indexPath.row)
            cell.textLabel?.text = privateData?.description
        case .appInfo:
            let appInfo = AppInfoOptions(rawValue: indexPath.row)
            cell.textLabel?.text = appInfo?.description
        }
        
        //MARK: переработать логику
        
        if indexPath.section == 1 && indexPath.row == 2 {
            cell.textLabel?.textColor = .systemRed
        }
        cell.selectionStyle = .none
        return cell
        
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 && indexPath.row == 2 {
            signOutAlert()
        }
        
    }
    
}
