//
//  UserAuthView.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 11.06.22.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignUpView: UIView {
    
    
    var userNamePlaceholderCenterYAnchor: NSLayoutConstraint!
    var userNamePlaceholderLeftAnchor: NSLayoutConstraint!
    
    var userEmailPlaceholderCenterYAnchor: NSLayoutConstraint!
    var userEmailPlaceholderLeftAnchor: NSLayoutConstraint!
    
    var userPasswordPlaceholderCenterYAnchor: NSLayoutConstraint!
    var userPasswordPlaceholderLeftAnchor: NSLayoutConstraint!
    
    
    var finishRegistrationButtonBottomAnchor: NSLayoutConstraint!
    
    
    var isTapped = true
    var isKeyboardMoves = true
    
    
    var UserNameValidType: String.ValidTypes = .userName
    var UserEmailValidType: String.ValidTypes = .email
    var UserPasswordValidType: String.ValidTypes = .password
    
    
    
    
    weak var signUpButtonDelegate: signUpButton?
    
    
    
    
    
    
    
    
    
    lazy var authZooMarketLabel: UILabel = {
        let authZooMarketLabel = UILabel()
        authZooMarketLabel.text = "ZooMarket"
        authZooMarketLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 32)
        
        
        return authZooMarketLabel
    }()
    
    
    lazy var authIDLabel: UILabel = {
        let authIDLabel = UILabel()
        authIDLabel.text = "ID"
        authIDLabel.textColor = .systemIndigo
        authIDLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 32)
        
        
        return authIDLabel
    }()
    
    
    lazy var registrationLabel: UILabel = {
        let registrationLabel = UILabel()
        registrationLabel.text = "Для регистрации заполните следующие поля"
        registrationLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 16)
        
        
        return registrationLabel
    }()
    
    lazy var userNameTextField: UITextField = {
        let userNameTextField = UITextField()
        userNameTextField.backgroundColor = .systemGray6
        userNameTextField.layer.cornerRadius = 16
        userNameTextField.autocorrectionType = .no
        userNameTextField.spellCheckingType = .no
        userNameTextField.returnKeyType = .done
        
        return userNameTextField
        
    }()
    
    
    lazy var userNameValidLabel: UILabel = {
        let userNameValidLabel = UILabel()
        userNameValidLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 12)
        
        
        
        return userNameValidLabel
    }()
    
    
    lazy var userNameValidLine: UIView = {
        let userNameValidLine = UIView()
        userNameValidLine.layer.borderWidth = 1.5
        userNameValidLine.layer.borderColor = UIColor.clear.cgColor
        userNameValidLine.layer.cornerRadius = 6
        
        
        return userNameValidLine
    }()
    
    lazy var userNamePlaceholder: UILabel = {
        let userNamePlaceholder = UILabel()
        userNamePlaceholder.text = "   Ваше имя"
        userNamePlaceholder.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        userNamePlaceholder.textColor = .systemGray
        
        
        return userNamePlaceholder
        
    }()
    
    lazy var userEmailTextField: UITextField = {
        let userEmailTextField = UITextField()
        userEmailTextField.backgroundColor = .systemGray6
        userEmailTextField.layer.cornerRadius = 16
        userEmailTextField.keyboardType = .emailAddress
        userEmailTextField.autocorrectionType = .no
        userEmailTextField.returnKeyType = .done
        
        
        
        
        return userEmailTextField
    }()
    
    
    lazy var userEmailValidLine: UIView = {
        let userEmailValidLine = UIView()
        userEmailValidLine.layer.borderWidth = 1.5
        userEmailValidLine.layer.cornerRadius = 6
        userEmailValidLine.layer.borderColor = UIColor.clear.cgColor
        
        
        return userEmailValidLine
    }()
    
    
    
    lazy var userEmailValidLabel: UILabel = {
        let userEmailValidLabel = UILabel()
        userEmailValidLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 12)
        
        
        
        return userEmailValidLabel
    }()
    
    
    
    
    lazy var userEmailPlaceholder: UILabel = {
        let userEmailPlaceholder = UILabel()
        userEmailPlaceholder.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        userEmailPlaceholder.text = "   Ваш Email"
        userEmailPlaceholder.textColor = .systemGray
        
        
        
        return userEmailPlaceholder
        
    }()
    
    
    lazy var userPasswordTextfield: UITextField = {
        let userPasswordTextfield = UITextField()
        userPasswordTextfield.backgroundColor = .systemGray6
        userPasswordTextfield.layer.cornerRadius = 16
        userPasswordTextfield.isSecureTextEntry = true
        userPasswordTextfield.autocorrectionType = .no
        userPasswordTextfield.returnKeyType = .done
        
        
        return userPasswordTextfield
    }()
    
    
    lazy var userPasswordValidLine: UIView = {
        let userPasswordValidLine = UIView()
        userPasswordValidLine.layer.borderWidth = 1.5
        userPasswordValidLine.layer.cornerRadius = 6
        userPasswordValidLine.layer.borderColor = UIColor.clear.cgColor
        
        
        return userPasswordValidLine
    }()
    
    
    
    lazy var userPasswordValidLabel: UILabel = {
        let userPasswordValidLabel = UILabel()
        userPasswordValidLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 12)
        userPasswordValidLabel.numberOfLines = 2
        
        
        
        return userPasswordValidLabel
    }()
    
    
    lazy var userPasswordPlaceholder: UILabel = {
        let userPasswordPlaceholder = UILabel()
        userPasswordPlaceholder.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        userPasswordPlaceholder.text = "   Придумайте пароль"
        userPasswordPlaceholder.textColor = .systemGray
        
        
        return userPasswordPlaceholder
    }()
    
    lazy var userPasswordHideShowButton: UIButton = {
        let userPasswordHideShowButton = UIButton()
        userPasswordHideShowButton.setImage(UIImage(named: "HidePassword"), for: .normal)
        userPasswordHideShowButton.setImage(UIImage(named: "ShowPassword"), for: .highlighted)
        userPasswordHideShowButton.tintColor = .black
        
        userPasswordHideShowButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        
        return userPasswordHideShowButton
    }()
    
    
    lazy var finishRegistrationButton: UIButton = {
        let finishRegistrationButton = UIButton()
        finishRegistrationButton.setTitle("Зарегестрироваться", for: .normal)
        finishRegistrationButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Medium", size: 14)
        finishRegistrationButton.setTitleColor(UIColor.white, for: .normal)
        finishRegistrationButton.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)
        finishRegistrationButton.backgroundColor = .systemIndigo.withAlphaComponent(0.9)
        finishRegistrationButton.layer.cornerRadius = 16
        finishRegistrationButton.addTarget(self, action: #selector(signUpButtonPresent), for: .touchUpInside)
        
        
        
        return finishRegistrationButton
    }()
    
    
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        userNameTextField.delegate = self
        userEmailTextField.delegate = self
        userPasswordTextfield.delegate = self
        addSubviews()
        setConstraints()
        keyboardGesture()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


private extension SignUpView {
    
    func addSubviews() {
        addSubview(authZooMarketLabel)
        addSubview(authIDLabel)
        addSubview(registrationLabel)
        addSubview(userNameTextField)
        addSubview(userNamePlaceholder)
        addSubview(userEmailTextField)
        addSubview(userEmailPlaceholder)
        addSubview(userPasswordTextfield)
        addSubview(userPasswordPlaceholder)
        addSubview(userPasswordHideShowButton)
        addSubview(finishRegistrationButton)
        addSubview(userNameValidLabel)
        addSubview(userEmailValidLabel)
        addSubview(userPasswordValidLabel)
        addSubview(userNameValidLine)
        addSubview(userEmailValidLine)
        addSubview(userPasswordValidLine)
        
        
        
    }
    
    func setConstraints() {
        authZooMarketLabelConstraints()
        authIDLabelConstraints()
        registrationLabelConstraints()
        userNameTextFieldConstraints()
        userNamePlaceholderConstraints()
        userEmailTextFieldConstraints()
        userEmailPlaceholderConstraints()
        userPasswordTextfieldConstraints()
        userPasswordPlaceholderConstraints()
        userPasswordHideShowButtonConstraints()
        finishRegistrationButtonConstraints()
        userNameValidLabelConstraints()
        userEmailValidLabelConstraints()
        userPasswordValidLabelConstraints()
        userNameValidLineConstraints()
        userEmailValidLineConstraints()
        userPasswordValidLineConstraints()
        
    }
    
    func authZooMarketLabelConstraints() {
        authZooMarketLabel.translatesAutoresizingMaskIntoConstraints = false
        [authZooMarketLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 48),
         authZooMarketLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32)].forEach {
            $0.isActive = true
        }
    }
    
    func authIDLabelConstraints() {
        authIDLabel.translatesAutoresizingMaskIntoConstraints = false
        [authIDLabel.centerYAnchor.constraint(equalTo: authZooMarketLabel.centerYAnchor, constant: 0),
         authIDLabel.leftAnchor.constraint(equalTo: authZooMarketLabel.rightAnchor, constant: 6)].forEach {
            $0.isActive = true
        }
    }
    
    
    func registrationLabelConstraints() {
        registrationLabel.translatesAutoresizingMaskIntoConstraints = false
        [registrationLabel.topAnchor.constraint(equalTo: authZooMarketLabel.bottomAnchor, constant: 12),
         registrationLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32)].forEach {
            $0.isActive = true
        }
    }
    
    func userNameTextFieldConstraints() {
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        [userNameTextField.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 32),
         userNameTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         userNameTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         userNameTextField.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
        
        
    }
    
    
    func userNameValidLineConstraints() {
        userNameValidLine.translatesAutoresizingMaskIntoConstraints = false
        [userNameValidLine.bottomAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: -1.5),
         userNameValidLine.leftAnchor.constraint(equalTo: userNameTextField.leftAnchor, constant: 12),
         userNameValidLine.rightAnchor.constraint(equalTo: userNameTextField.rightAnchor, constant: -12),
         userNameValidLine.heightAnchor.constraint(equalToConstant: 1.5)].forEach {
            $0.isActive = true
        }
    }
    
    
    func userNameValidLabelConstraints() {
        userNameValidLabel.translatesAutoresizingMaskIntoConstraints = false
        [userNameValidLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 2),
         userNameValidLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 48),
         userNameValidLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -36)].forEach {
            $0.isActive = true
        }
    }
    
    
    func userNamePlaceholderConstraints() {
        userNamePlaceholder.translatesAutoresizingMaskIntoConstraints = false
        userNamePlaceholderCenterYAnchor = userNamePlaceholder.centerYAnchor.constraint(equalTo: userNameTextField.centerYAnchor, constant: 0)
        userNamePlaceholderLeftAnchor = userNamePlaceholder.leftAnchor.constraint(equalTo: userNameTextField.leftAnchor, constant: 0)
        NSLayoutConstraint.activate([userNamePlaceholderCenterYAnchor, userNamePlaceholderLeftAnchor])
        
    }
    
    
    func userEmailTextFieldConstraints() {
        userEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        [userEmailTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 24),
         userEmailTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         userEmailTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         userEmailTextField.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
    }
    
    func userEmailValidLineConstraints() {
        userEmailValidLine.translatesAutoresizingMaskIntoConstraints = false
        [userEmailValidLine.bottomAnchor.constraint(equalTo: userEmailTextField.bottomAnchor, constant: -1.5),
         userEmailValidLine.leftAnchor.constraint(equalTo: userEmailTextField.leftAnchor, constant: 12),
         userEmailValidLine.rightAnchor.constraint(equalTo: userEmailTextField.rightAnchor, constant: -12),
         userEmailValidLine.heightAnchor.constraint(equalToConstant: 1.5)].forEach {
            $0.isActive = true
        }
    }
    
    
    func userEmailValidLabelConstraints() {
        userEmailValidLabel.translatesAutoresizingMaskIntoConstraints = false
        [userEmailValidLabel.topAnchor.constraint(equalTo: userEmailTextField.bottomAnchor, constant: 4),
         userEmailValidLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 48),
         userEmailValidLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -36)].forEach {
            $0.isActive = true
        }
    }
    
    
    func userEmailPlaceholderConstraints() {
        userEmailPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        userEmailPlaceholderCenterYAnchor = userEmailPlaceholder.centerYAnchor.constraint(equalTo: userEmailTextField.centerYAnchor, constant: 0)
        userEmailPlaceholderLeftAnchor = userEmailPlaceholder.leftAnchor.constraint(equalTo: userEmailTextField.leftAnchor, constant: 0)
        NSLayoutConstraint.activate([userEmailPlaceholderCenterYAnchor,userEmailPlaceholderLeftAnchor])
    }
    
    
    
    
    
    func userPasswordTextfieldConstraints() {
        userPasswordTextfield.translatesAutoresizingMaskIntoConstraints = false
        [userPasswordTextfield.topAnchor.constraint(equalTo: userEmailTextField.bottomAnchor, constant: 24),
         userPasswordTextfield.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         userPasswordTextfield.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         userPasswordTextfield.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
    }
    
    func userPasswordValidLineConstraints() {
        userPasswordValidLine.translatesAutoresizingMaskIntoConstraints = false
        [userPasswordValidLine.bottomAnchor.constraint(equalTo: userPasswordTextfield.bottomAnchor, constant: -1.5),
         userPasswordValidLine.leftAnchor.constraint(equalTo: userPasswordTextfield.leftAnchor, constant: 12),
         userPasswordValidLine.rightAnchor.constraint(equalTo: userPasswordTextfield.rightAnchor, constant: -12),
         userPasswordValidLine.heightAnchor.constraint(equalToConstant: 1.5)].forEach {
            $0.isActive = true
        }
    }
    
    
    func userPasswordValidLabelConstraints() {
        userPasswordValidLabel.translatesAutoresizingMaskIntoConstraints = false
        [userPasswordValidLabel.topAnchor.constraint(equalTo: userPasswordTextfield.bottomAnchor, constant: 4),
         userPasswordValidLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 48),
         userPasswordValidLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -36)].forEach {
            $0.isActive = true
        }
    }
    
    
    func userPasswordPlaceholderConstraints() {
        userPasswordPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        userPasswordPlaceholderCenterYAnchor = userPasswordPlaceholder.centerYAnchor.constraint(equalTo: userPasswordTextfield.centerYAnchor, constant: 0)
        userPasswordPlaceholderLeftAnchor = userPasswordPlaceholder.leftAnchor.constraint(equalTo: userPasswordTextfield.leftAnchor, constant: 0)
        NSLayoutConstraint.activate([userPasswordPlaceholderCenterYAnchor, userPasswordPlaceholderLeftAnchor])
    }
    
    func userPasswordHideShowButtonConstraints() {
        userPasswordHideShowButton.translatesAutoresizingMaskIntoConstraints = false
        [userPasswordHideShowButton.centerYAnchor.constraint(equalTo: userPasswordTextfield.centerYAnchor, constant: 0),
         userPasswordHideShowButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -48),
         userPasswordHideShowButton.heightAnchor.constraint(equalToConstant: 16),
         userPasswordHideShowButton.widthAnchor.constraint(equalToConstant: 16)].forEach {
            $0.isActive = true
        }
    }
    
    
    func finishRegistrationButtonConstraints() {
        finishRegistrationButton.translatesAutoresizingMaskIntoConstraints = false
        [finishRegistrationButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 64),
         finishRegistrationButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -64),
         finishRegistrationButton.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
        
        finishRegistrationButtonBottomAnchor = finishRegistrationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32)
        NSLayoutConstraint.activate([finishRegistrationButtonBottomAnchor])
        
    }
    
    
    
    
    
    
    
}



