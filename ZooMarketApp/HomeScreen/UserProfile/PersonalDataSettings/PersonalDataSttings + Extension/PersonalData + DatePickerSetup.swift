//
//  PersonalData + DatePickerSetup.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 21.06.22.
//

import Foundation
import UIKit


extension PersonalDataView {
    
    func setToolBar() -> UIToolbar {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(datePickerDoneButtonTapped))
        toolBar.setItems([doneButton], animated: true)
        
        return toolBar
    }
    
    func setDatePicker() {
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        dayOfBirthTextField.inputView = datePicker
        dayOfBirthTextField.inputAccessoryView = setToolBar()
        
    }
    
}
