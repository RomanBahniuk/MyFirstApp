//
//  Catalog + GestureSetup.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 5.07.22.
//

import Foundation
import UIKit



extension CatalogPageView {
    
    func keyboardGesture() {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.direction = .down
        gesture.cancelsTouchesInView = false
        self.addGestureRecognizer(gesture)
    }
    
}
