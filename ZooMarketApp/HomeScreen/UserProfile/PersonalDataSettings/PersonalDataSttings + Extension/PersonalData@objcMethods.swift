//
//  @objCMethods.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 19.06.22.
//

import Foundation
import UIKit


extension PersonalDataController {
    
    @objc func backButonTapped() {
        dismiss(animated: true)
    }

}



extension PersonalDataView {
    
    @objc func saveChangesButtonTapped(_ sender: UIButton) {
        
        firestoreDelegate?.buttonDidTapped()

        
    }
    
    
    
    @objc func datePickerDoneButtonTapped() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dayOfBirthTextField.text = dateFormatter.string(from: datePicker.date)
        self.endEditing(true)
    }
    
    @objc func hideKeyboard() {
        self.endEditing(true)
    }
    
    
    @objc func keyboardWillShow() {
                
        if isKeyboardMoves == true {
            
            
            dataLabelTopAnchor.constant = -32
            saveChangesButtonBottomAnchor.constant = -320
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                
                
                self.layoutIfNeeded()
                
            })
            
        }
        
    }
    
    @objc func keyboardWillHide() {
        
        if isKeyboardMoves == true {
            
            dataLabelTopAnchor.constant = 32
            saveChangesButtonBottomAnchor.constant = -32
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                
                
                self.layoutIfNeeded()
                
            })
            
        }
    }
}
