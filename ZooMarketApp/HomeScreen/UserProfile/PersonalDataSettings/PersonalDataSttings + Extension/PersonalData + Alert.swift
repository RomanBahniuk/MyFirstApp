//
//  PersonalData + Alert.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 30.06.22.
//

import Foundation
import UIKit




extension PersonalDataController {
    
    
    func userEmptyImageAlert() {
        
        let userEmptyImageAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        userEmptyImageAlert.addAction(UIAlertAction(title: "Добавить фото", style: .default, handler: { _ in
            self.present(self.imagePicker, animated: true, completion: nil)
            
        }))
        
        userEmptyImageAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        present(userEmptyImageAlert, animated: true)

        
    }
    
    func userImageAlert() {
        
        let userImageAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        userImageAlert.addAction(UIAlertAction(title: "Добавить фото", style: .default, handler: { _ in
            self.present(self.imagePicker, animated: true, completion: nil)
            
        }))
        userImageAlert.addAction(UIAlertAction(title: "Удалить фото", style: .destructive, handler: { _ in
            self.deleteUserPhoto()
        }))
        userImageAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        present(userImageAlert, animated: true)
    }
    
    
}
