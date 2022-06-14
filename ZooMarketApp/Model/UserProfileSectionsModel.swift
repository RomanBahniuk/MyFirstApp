//
//  UserProfileSectionsModel.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 14.06.22.
//



enum SettingsSections: Int, CaseIterable, CustomStringConvertible {
    
    case privateData
    case appInfo
    
    var description: String {
        
        switch self {
        case .privateData: return "Приложение"
        case .appInfo: return "Личные данные"
        }
    }
    
}


enum PrivateDataOptions: Int, CaseIterable, CustomStringConvertible {
    case accountManager
    
    var description: String {
        switch self {
        case.accountManager: return "О приложении"
        }
    }

}


enum AppInfoOptions: Int, CaseIterable, CustomStringConvertible {
    case accountSecurity
    case enableDarkMode
    case logOut
    
    var description: String {
        
        switch self {
        case .accountSecurity: return "Аккаунт и безопасность"
        case .enableDarkMode: return "Тёмная тема: вкл."
        case .logOut: return "Выйти из аккаунта"
            
        }
    }
}
