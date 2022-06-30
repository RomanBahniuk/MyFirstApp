//
//  Firebase + Database.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 21.06.22.
//

import Foundation
import UIKit


final class UserData {
    
    
    private enum DataKey: String {
        case userName
        case userModel
    }
    
    static var userModel: UserModel! {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: DataKey.userModel.rawValue) as? Data , let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else { return nil }
            return decodedModel
        } set {
            let defaults = UserDefaults.standard
            let key = DataKey.userModel.rawValue
            
            if let userModel = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: userModel, requiringSecureCoding: false) {
                    defaults.set(savedData, forKey: key)
                }
            }
        }
    }
    
    static var userName: String! {
        get {
            
            return UserDefaults.standard.string(forKey: DataKey.userName.rawValue)
            
        } set {
            
            let defaults = UserDefaults.standard
            let key = DataKey.userName.rawValue
            if let name = newValue {
                print("value \(name) was added to key\(key)")
                defaults.set(name, forKey: key )
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
