//
//  PersonalDataGesureSetup.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 20.06.22.
//

import Foundation
import UIKit


extension PersonalDataView {
    
    func keyboardGesture() {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.direction = .down
        gesture.cancelsTouchesInView = false
        addGestureRecognizer(gesture)
    }
    
    
}
