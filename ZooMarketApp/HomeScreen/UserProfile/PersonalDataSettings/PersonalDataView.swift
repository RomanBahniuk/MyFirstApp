//
//  PersonalDataView.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 19.06.22.
//

import UIKit
import Firebase
import FirebaseFirestore

class PersonalDataView: UIView {
    
    
    var firstNamePlaceholderCenterYAnchor: NSLayoutConstraint!
    var firstNamePlaceholderLeftAnchor: NSLayoutConstraint!
    
    var secondNamePlaceholderCenterYAnchor: NSLayoutConstraint!
    var secondNamePlaceholderLeftAnchor: NSLayoutConstraint!
    
    var phoneNumberPlaceholderCenterYAnchor: NSLayoutConstraint!
    var phoneNumberPlaceholderLeftAnchor: NSLayoutConstraint!
    
    var emailPlaceholderCenterYAnchor: NSLayoutConstraint!
    var emailPlaceholderLeftAnchor: NSLayoutConstraint!
    
    var dayOfBirthPlaceholderCenterYAnchor: NSLayoutConstraint!
    var dayOfBirthPlaceholderLeftAnchor: NSLayoutConstraint!
    
    var saveChangesButtonBottomAnchor: NSLayoutConstraint!
    
    var dataLabelTopAnchor: NSLayoutConstraint!
    var dataLabelcenterXAnchor: NSLayoutConstraint!
    
    var userImagecenterXAnchor: NSLayoutConstraint!
    var userImageTopAnchor: NSLayoutConstraint!
    
    var firstNameValidType: String.ValidTypes = .userName
    var secondNameValidType: String.ValidTypes = .userSecondName
    var emailValidType: String.ValidTypes = .email
    
    
    
    var isKeyboardMoves = true
    
    var datePicker = UIDatePicker()
    
    weak var firestoreDelegate: SaveChangesButtonDelegate?
    
    
    
    lazy var userImage: UIImageView = {
       let userImage = UIImageView()
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = 36
        userImage.image = UIImage(named: "UserProfileImage")
        userImage.tintColor = .black
        
        userImage.isUserInteractionEnabled = true
        
        
        return userImage
    }()
    
    
    lazy var dataLabel: UILabel = {
        let dataLabel = UILabel()
        dataLabel.text = "Личные данные"
        dataLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 32)
        
        
        return dataLabel
    }()
    
    lazy var firstNameTextField: UITextField = {
        let firstNameTextField = UITextField()
        firstNameTextField.backgroundColor = .systemGray6
        firstNameTextField.layer.cornerRadius = 16
        
        
        
        
        
        
        return firstNameTextField
    }()
    
    
    lazy var firstNameValidLine: UIView = {
        let firstNameValidLine = UIView()
        firstNameValidLine.layer.borderWidth = 1.5
        firstNameValidLine.layer.cornerRadius = 6
        firstNameValidLine.layer.borderColor = UIColor.clear.cgColor
        
        
        return firstNameValidLine
    }()
    
    lazy var firstNamelValidLabel: UILabel = {
        let firstNamelValidLabel = UILabel()
        firstNamelValidLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 12)
        
        return firstNamelValidLabel
    }()
    
    
    
    lazy var firstNameTextFieldPlaceHolder: UILabel = {
        let firstNameTextFieldPlaceHolder = UILabel()
        firstNameTextFieldPlaceHolder.text = "   Ваше имя"
        firstNameTextFieldPlaceHolder.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        firstNameTextFieldPlaceHolder.textColor = .systemGray
        
        
        return firstNameTextFieldPlaceHolder
    }()
    
    
    lazy var secondNameTextField: UITextField = {
        let secondNameTextField = UITextField()
        secondNameTextField.backgroundColor = .systemGray6
        secondNameTextField.layer.cornerRadius = 16
        
        return secondNameTextField
    }()
    
    lazy var secondNameValidLine: UIView = {
        let secondNameValidLine = UIView()
        secondNameValidLine.layer.borderWidth = 1.5
        secondNameValidLine.layer.cornerRadius = 6
        secondNameValidLine.layer.borderColor = UIColor.clear.cgColor
        
        return secondNameValidLine
    }()
    
    lazy var secondNameValidLabel: UILabel = {
        let secondNameValidLabel = UILabel()
        secondNameValidLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 12)
        
        
        return secondNameValidLabel
    }()
    
    
    lazy var secondNameTextFieldPlaceHolder: UILabel = {
        let secondNameTextFieldPlaceHolder = UILabel()
        secondNameTextFieldPlaceHolder.text = "   Ваша фамилия"
        secondNameTextFieldPlaceHolder.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        secondNameTextFieldPlaceHolder.textColor = .systemGray

        return secondNameTextFieldPlaceHolder
    }()
    
    
    
    lazy var phoneNumberTextField: UITextField = {
        let phoneNumberTextField = UITextField()
        phoneNumberTextField.backgroundColor = .systemGray6
        phoneNumberTextField.layer.cornerRadius = 16
        phoneNumberTextField.keyboardType = .numberPad        
        
        return phoneNumberTextField
    }()
    
    
    lazy var phoneNumberValidLine: UIView = {
        let phoneNumberValidLine = UIView()
        phoneNumberValidLine.layer.borderWidth = 1.5
        phoneNumberValidLine.layer.cornerRadius = 6
        phoneNumberValidLine.layer.borderColor = UIColor.clear.cgColor
        
        
        return phoneNumberValidLine
    }()
    
    lazy var phoneNumberValidLabel: UILabel = {
        let phoneNumberValidLabel = UILabel()
        phoneNumberValidLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 12)
        
        
        return phoneNumberValidLabel
    }()
    
    
    lazy var phoneNumberTextFieldPlaceHolder: UILabel = {
        let phoneNumberTextFieldPlaceHolder = UILabel()
        phoneNumberTextFieldPlaceHolder.text = "   Номер мобильного телефона"
        phoneNumberTextFieldPlaceHolder.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        phoneNumberTextFieldPlaceHolder.textColor = .systemGray
        
        return phoneNumberTextFieldPlaceHolder
    }()
    
    
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.backgroundColor = .systemGray6
        emailTextField.layer.cornerRadius = 16
        emailTextField.keyboardType = .emailAddress
        
        
        return emailTextField
    }()
    
    
    lazy var emailValidLine: UIView = {
        let emailValidLine = UIView()
        emailValidLine.layer.borderWidth = 1.5
        emailValidLine.layer.cornerRadius = 6
        emailValidLine.layer.borderColor = UIColor.clear.cgColor
        
        
        return emailValidLine
    }()
    
    lazy var emailValidLabel: UILabel = {
        let emailValidLabel = UILabel()
        emailValidLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 12)
        
        
        return emailValidLabel
    }()
    
    
    lazy var emailTextFieldPlaceHolder: UILabel = {
        let emailTextFieldPlaceHolder = UILabel()
        emailTextFieldPlaceHolder.text = "   Bаш email"
        emailTextFieldPlaceHolder.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        emailTextFieldPlaceHolder.textColor = .systemGray
        
        
        return emailTextFieldPlaceHolder
    }()
    
    lazy var dayOfBirthTextField: UITextField = {
       let dayOfBirthTextField = UITextField()
        dayOfBirthTextField.backgroundColor = .systemGray6
        dayOfBirthTextField.layer.cornerRadius = 16
        
        return dayOfBirthTextField
    }()
    
    lazy var dayOfBirthTextFieldPlaceHolder: UILabel = {
        let dayOfBirthTextFieldPlaceHolder = UILabel()
        dayOfBirthTextFieldPlaceHolder.text = "   День рождения"
        dayOfBirthTextFieldPlaceHolder.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        dayOfBirthTextFieldPlaceHolder.textColor = .systemGray
        
        
        return dayOfBirthTextFieldPlaceHolder
    }()
    
    
    
    lazy var saveChangesButton: UIButton = {
        let saveChangesButton = UIButton()
        saveChangesButton.setTitle("Сохранить изменения", for: .normal)
        saveChangesButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Medium", size: 14)
        saveChangesButton.setTitleColor(UIColor.systemGray6, for: .normal)
        saveChangesButton.setTitleColor(UIColor.white.withAlphaComponent(0.7),for: .highlighted)
        saveChangesButton.backgroundColor = .systemGray.withAlphaComponent(0.8)
        saveChangesButton.layer.cornerRadius = 16
        
        
        saveChangesButton.isEnabled = false
        saveChangesButton.addTarget(self, action: #selector(saveChangesButtonTapped), for: .touchUpInside)
        
        
        return saveChangesButton
    }()
    
    
    
    
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubviews()
        setConstraints()
        keyboardGesture()
        setDatePicker()
        
        
        
        
        firstNameTextField.delegate = self
        secondNameTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        dayOfBirthTextField.delegate = self
        
        addLeftViewTo(textField: firstNameTextField)
        addLeftViewTo(textField: secondNameTextField)
        addLeftViewTo(textField: phoneNumberTextField)
        addLeftViewTo(textField: emailTextField)
        addLeftViewTo(textField: dayOfBirthTextField)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



private extension PersonalDataView {
    
    func addSubviews() {
        addSubview(dataLabel)
        addSubview(userImage)
        addSubview(firstNameTextField)
        addSubview(firstNameValidLine)
        addSubview(firstNamelValidLabel)
        addSubview(firstNameTextFieldPlaceHolder)
        addSubview(secondNameTextField)
        addSubview(secondNameValidLine)
        addSubview(secondNameValidLabel)
        addSubview(secondNameTextFieldPlaceHolder)
        addSubview(phoneNumberTextField)
        addSubview(phoneNumberValidLine)
        addSubview(phoneNumberValidLabel)
        addSubview(phoneNumberTextFieldPlaceHolder)
        addSubview(emailTextField)
        addSubview(emailValidLine)
        addSubview(emailValidLabel)
        addSubview(emailTextFieldPlaceHolder)
        addSubview(dayOfBirthTextField)
        addSubview(dayOfBirthTextFieldPlaceHolder)
        addSubview(saveChangesButton)
    }
    
    func setConstraints() {
        dataLabelConstraints()
        userImageConstraints()
        firstNameTextFieldConstraints()
        firstNameValidLineConstraints()
        firstNamelValidLabelConstraints()
        firstNameTextFieldPlaceHolderConstraints()
        secondNameTextFieldConstraints()
        secondNameValidLineConstraints()
        secondNameValidLabelConstraints()
        secondNameTextFieldPlaceHolderConstraints()
        phoneNumberTextFieldConstraints()
        phoneNumberValidLineConstraints()
        phoneNumberValidLabelConstraints()
        phoneNumberTextFieldPlaceHolderConstraints()
        emailTextFieldConstraints()
        emailValidLineConstraints()
        emailValidLabelConstraints()
        emailTextFieldPlaceHolderConstraints()
        dayOfBirthTextFieldConstraints()
        dayOfBirthTextFieldPlaceHolderConstraints()
        saveChangesButtonConstraints()
    }
    
    
   
    
    
    func dataLabelConstraints() {
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabelTopAnchor = dataLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32)
        dataLabelcenterXAnchor = dataLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0)
            NSLayoutConstraint.activate([dataLabelTopAnchor, dataLabelcenterXAnchor])
        
    }
    
    
    func userImageConstraints() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        [userImage.heightAnchor.constraint(equalToConstant: 80),
         userImage.widthAnchor.constraint(equalToConstant: 80)].forEach {
            $0.isActive = true
        }
        userImageTopAnchor = userImage.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 16)
        userImagecenterXAnchor = userImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0)
        NSLayoutConstraint.activate([userImagecenterXAnchor, userImageTopAnchor])
        
    }
    
    
    func firstNameTextFieldConstraints() {
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        [firstNameTextField.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 32),
         firstNameTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         firstNameTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         firstNameTextField.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
    }
    
    func firstNameValidLineConstraints() {
        firstNameValidLine.translatesAutoresizingMaskIntoConstraints = false
        [firstNameValidLine.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor, constant: 12),
         firstNameValidLine.rightAnchor.constraint(equalTo: firstNameTextField.rightAnchor, constant: -12),
         firstNameValidLine.bottomAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: -1.5),
         firstNameValidLine.heightAnchor.constraint(equalToConstant: 1.5)].forEach {
            $0.isActive = true
        }
    }
    
    
    func firstNamelValidLabelConstraints() {
        firstNamelValidLabel.translatesAutoresizingMaskIntoConstraints = false
        [firstNamelValidLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 2),
         firstNamelValidLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 48),
         firstNamelValidLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -36)].forEach {
            $0.isActive = true
        }
    }
   
    
    
    func firstNameTextFieldPlaceHolderConstraints() {
        firstNameTextFieldPlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        firstNamePlaceholderCenterYAnchor = firstNameTextFieldPlaceHolder.centerYAnchor.constraint(equalTo: firstNameTextField.centerYAnchor, constant: 0)
        firstNamePlaceholderLeftAnchor = firstNameTextFieldPlaceHolder.leftAnchor.constraint(equalTo: firstNameTextField.leftAnchor, constant: 0)
        NSLayoutConstraint.activate([firstNamePlaceholderCenterYAnchor, firstNamePlaceholderLeftAnchor])
        
    }
    
    func secondNameTextFieldConstraints() {
        secondNameTextField.translatesAutoresizingMaskIntoConstraints = false
        [secondNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 24),
        secondNameTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
        secondNameTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         secondNameTextField.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
        
    }
    
    func secondNameValidLineConstraints() {
        secondNameValidLine.translatesAutoresizingMaskIntoConstraints = false
        [secondNameValidLine.leftAnchor.constraint(equalTo: secondNameTextField.leftAnchor, constant: 12),
         secondNameValidLine.rightAnchor.constraint(equalTo: secondNameTextField.rightAnchor, constant: -12),
         secondNameValidLine.bottomAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: -1.5),
         secondNameValidLine.heightAnchor.constraint(equalToConstant: 1.5)].forEach {
            $0.isActive = true
        }
    }
    
    func secondNameValidLabelConstraints() {
        secondNameValidLabel.translatesAutoresizingMaskIntoConstraints = false
        [secondNameValidLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 2),
         secondNameValidLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 48),
         secondNameValidLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -36)].forEach {
            $0.isActive = true
        }
    }
    
    
    
    func secondNameTextFieldPlaceHolderConstraints() {
        secondNameTextFieldPlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        secondNamePlaceholderCenterYAnchor = secondNameTextFieldPlaceHolder.centerYAnchor.constraint(equalTo: secondNameTextField.centerYAnchor, constant: 0)
        secondNamePlaceholderLeftAnchor = secondNameTextFieldPlaceHolder.leftAnchor.constraint(equalTo: secondNameTextField.leftAnchor, constant: 0)
        NSLayoutConstraint.activate([secondNamePlaceholderCenterYAnchor, secondNamePlaceholderLeftAnchor])
    }
    
    
    func phoneNumberTextFieldConstraints() {
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        [phoneNumberTextField.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 24),
         phoneNumberTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         phoneNumberTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
    }
    
    func phoneNumberValidLineConstraints() {
        phoneNumberValidLine.translatesAutoresizingMaskIntoConstraints = false
        [phoneNumberValidLine.leftAnchor.constraint(equalTo: phoneNumberTextField.leftAnchor, constant: 12),
         phoneNumberValidLine.rightAnchor.constraint(equalTo: phoneNumberTextField.rightAnchor, constant: -12),
         phoneNumberValidLine.bottomAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: -1.5),
         phoneNumberValidLine.heightAnchor.constraint(equalToConstant: 1.5)].forEach {
            $0.isActive = true
        }
    }
    
    func phoneNumberValidLabelConstraints() {
        phoneNumberValidLabel.translatesAutoresizingMaskIntoConstraints = false
        [phoneNumberValidLabel.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 2),
         phoneNumberValidLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 48),
         phoneNumberValidLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -36)].forEach {
            $0.isActive = true
        }
    }
    
    func phoneNumberTextFieldPlaceHolderConstraints() {
        phoneNumberTextFieldPlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberPlaceholderCenterYAnchor = phoneNumberTextFieldPlaceHolder.centerYAnchor.constraint(equalTo: phoneNumberTextField.centerYAnchor, constant: 0)
        phoneNumberPlaceholderLeftAnchor = phoneNumberTextFieldPlaceHolder.leftAnchor.constraint(equalTo: phoneNumberTextField.leftAnchor, constant: 0)
        NSLayoutConstraint.activate([phoneNumberPlaceholderCenterYAnchor, phoneNumberPlaceholderLeftAnchor])
    }
    
    func emailTextFieldConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        [emailTextField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 24),
         emailTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         emailTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         emailTextField.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
    }
    
    func emailValidLineConstraints() {
        emailValidLine.translatesAutoresizingMaskIntoConstraints = false
        [emailValidLine.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 12),
         emailValidLine.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: -12),
         emailValidLine.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -1.5),
         emailValidLine.heightAnchor.constraint(equalToConstant: 1.5)].forEach {
            $0.isActive = true
        }
    }
    
    func emailValidLabelConstraints() {
        emailValidLabel.translatesAutoresizingMaskIntoConstraints = false
        [emailValidLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 2),
         emailValidLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 48),
         emailValidLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -36)].forEach {
            $0.isActive = true
        }
    }
    
    func emailTextFieldPlaceHolderConstraints() {
        emailTextFieldPlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        emailPlaceholderCenterYAnchor = emailTextFieldPlaceHolder.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor, constant: 0)
        emailPlaceholderLeftAnchor = emailTextFieldPlaceHolder.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 0)
        NSLayoutConstraint.activate([emailPlaceholderCenterYAnchor, emailPlaceholderLeftAnchor])
    }
    
    func dayOfBirthTextFieldConstraints() {
        dayOfBirthTextField.translatesAutoresizingMaskIntoConstraints = false
        [dayOfBirthTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
         dayOfBirthTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         dayOfBirthTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         dayOfBirthTextField.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
    }
    
    func dayOfBirthTextFieldPlaceHolderConstraints() {
        dayOfBirthTextFieldPlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        dayOfBirthPlaceholderCenterYAnchor = dayOfBirthTextFieldPlaceHolder.centerYAnchor.constraint(equalTo: dayOfBirthTextField.centerYAnchor, constant: 0)
        dayOfBirthPlaceholderLeftAnchor = dayOfBirthTextFieldPlaceHolder.leftAnchor.constraint(equalTo: dayOfBirthTextField.leftAnchor, constant: 0)
        NSLayoutConstraint.activate([dayOfBirthPlaceholderCenterYAnchor, dayOfBirthPlaceholderLeftAnchor])
    }
    
    func saveChangesButtonConstraints() {
        saveChangesButton.translatesAutoresizingMaskIntoConstraints = false
        [saveChangesButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 64),
         saveChangesButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -64),
         saveChangesButton.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
        saveChangesButtonBottomAnchor = saveChangesButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32)
        NSLayoutConstraint.activate([saveChangesButtonBottomAnchor])
    }
}

