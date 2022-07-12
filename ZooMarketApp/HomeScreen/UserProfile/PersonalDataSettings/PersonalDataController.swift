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
import CoreData

protocol SaveChangesButtonDelegate: AnyObject {
    func buttonDidTapped()
}



class PersonalDataController: UIViewController {
    
    let personalDataView = PersonalDataView()
    let firebaseNetworkData: FirebaseNetworkData = .init()
    
    
    public var completionHandler: ((UIImage) -> Void)?
    
    
    var header: UserHeader!
    var imagePicker: UIImagePickerController!
    
    
    override func loadView() {
        super.loadView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButonTapped))
        view = personalDataView
        view.backgroundColor = .white
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        (view as? PersonalDataView)?.firestoreDelegate = self
        
        configureImagePicker()
        userImageGesture()
        showUserData()
        
    }
    
}


extension PersonalDataController: SaveChangesButtonDelegate {
    func buttonDidTapped() {
        
        firebaseNetworkData.updateUserData { [self] firestore in
            
            guard let userID = Auth.auth().currentUser?.uid else { return }
            
            if !personalDataView.firstNameTextField.text!.isEmpty && !personalDataView.secondNameTextField.text!.isEmpty && !personalDataView.emailTextField.text!.isEmpty {
                firestore.collection("FirestoreUsers").document("\(userID)").updateData(["userName": personalDataView.firstNameTextField.text!, "userSecondName": personalDataView.secondNameTextField.text!, "userEmail": personalDataView.emailTextField.text!, "userPhoneNumber": personalDataView.phoneNumberTextField.text!, "userDayOfBirth": personalDataView.dayOfBirthTextField.text!]) {
                    err in
                    if let err = err {
                        print(err)
                    }
                }
                
            }
        }
        
        dismiss(animated: true)
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
        
        let userID = Firebase.Auth.auth().currentUser?.uid

        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.personalDataView.userImage.image = pickedImage
            
        }
        
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
            self.firebaseNetworkData.getUserPhoto { storage in
                
                let userProfilePhoto = storage.reference(withPath: "UserProfilePhoto").child("\(userID!)")
                userProfilePhoto.getData(maxSize: 1 * 1024 * 1024) { data, err in
                    if let err = err  {
                        print("\(err.localizedDescription)")
                    } else {
                        self.personalDataView.userImage.image = UIImage(data: data!)
                        
                    }
                }
            }
            
            self.completionHandler?(self.personalDataView.userImage.image!)
            
        }
        
        picker.dismiss(animated: true, completion: nil)

        
    }
    
}



//MARK: CoreData

//extension PersonalDataController {
//
//    func saveUserData() {
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//        let entityDescription = NSEntityDescription.entity(forEntityName: "UserPersonalData", in: context)
//        let manageObject = NSManagedObject(entity: entityDescription!, insertInto: context)
//
//        manageObject.setValue(personalDataView.firstNameTextField.text, forKey: "userName")
//        manageObject.setValue(personalDataView.secondNameTextField.text, forKey: "userSecondName")
//        manageObject.setValue(personalDataView.emailTextField.text, forKey: "userEmail")
//
//        appDelegate.saveContext()
//
//
//    }
//
//    func fetchUserData() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserPersonalData")
//        do {
//        let result = try context.fetch(fetchRequest)
//            for result in result as! [NSManagedObject] {
//                personalDataView.firstNameTextField.text = result.value(forKey: "userName") as? String
//                personalDataView.secondNameTextField.text = result.value(forKey: "userSecondName") as? String
//                personalDataView.emailTextField.text = result.value(forKey: "userEmail") as? String
//            }
//        } catch let error as NSError {
//            print("\(error.localizedDescription)")
//        }
//
//    }
//
//}









