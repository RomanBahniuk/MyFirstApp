//
//  AuthGestureSetup.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 13.06.22.
//

import Foundation
import UIKit


extension SignUpView {
    
    func keyboardGesture() {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.direction = .down
        gesture.cancelsTouchesInView = false
        self.addGestureRecognizer(gesture)
    }
}
