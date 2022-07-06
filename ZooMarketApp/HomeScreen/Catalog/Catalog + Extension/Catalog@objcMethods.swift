//
//  Catalog@objcMethods.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 5.07.22.
//

import Foundation
import UIKit



extension CatalogPageView {
    
    @objc func hideKeyboard() {
        self.endEditing(true)
    }
}
