//
//  PersonalData.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 19.06.22.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage

protocol SaveChangesButtonDelegate: AnyObject {
    func buttonDidTapped()
}



class PersonalDataController: UIViewController {

    let personalDataView = PersonalDataView()
    let firebaseNetworkData: FirebaseNetworkData = .init()
    
    public var completionHandler: ((UIImage) -> Void)?
    
    
    var header: UserHeader!
    var dataBase: Firestore!
    var imagePicker: UIImagePickerController!
    
    
    override func loadView() {
        super.loadView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButonTapped))
        view = personalDataView
        view.backgroundColor = .white
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImagePicker()
        userImageGesture()
        
        dataBase = Firestore.firestore()
        
        (view as? PersonalDataView)?.firestoreDelegate = self
        
        showUserData()
    }
    
    
    


}


extension PersonalDataController: SaveChangesButtonDelegate {
    func buttonDidTapped() {
        
        updateUserData()
        dismiss(animated: true)
    }
    func  showUserData() {
        
        getUserData()
        getUserPhoto()
        personalDataView.saveChangesButton.setTitleColor(.white, for: .normal)
        personalDataView.saveChangesButton.backgroundColor = .systemIndigo.withAlphaComponent(0.9)
        personalDataView.saveChangesButton.isEnabled = true
        
    }
    
    
    
    
}


extension PersonalDataController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func configureImagePicker() {
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
    }
    
    private func userImageGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(userImageDidTap))
        personalDataView.userImage.addGestureRecognizer(gesture)
    }
    
    @objc func userImageDidTap(_ gesture: UITapGestureRecognizer) {
        
        if personalDataView.userImage.image == UIImage(named: "UserProfileImage")  {
            userEmptyImageAlert()
        } else {
            userImageAlert()
            
        }
        
        
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.personalDataView.userImage.image = pickedImage
            
        }
        
        picker.dismiss(animated: true, completion: nil)
        
        let userID = Firebase.Auth.auth().currentUser?.uid
        uploadUserPhoto(userID: "\(userID!)", userPhoto: personalDataView.userImage.image!) { (result) in
            switch result {

            case .success(let url):
                let dataBase = Firestore.firestore()
                dataBase.collection("FirestoreUsers").document("\(userID!)").setData(["userImageURL": url.absoluteString], merge: true) { (error) in
                    if let error = error {
                        print("\(error.localizedDescription)")
                    }
                    print("added!")
                }

            case .failure(let error):
                print("\(error.localizedDescription)")
            }
            self.getUserPhoto()
            self.completionHandler?(self.personalDataView.userImage.image!)
        }
    }
    
}
    
    
    

    



 
