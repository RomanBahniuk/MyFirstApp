//
//  SingInView.swift
//  ZooMarketApp
//
//  Created by Роман Багнюк on 8.06.22.
//

import UIKit

final class SignInView: UIView {
    
     var emailPlaceholderCenterYConstraints: NSLayoutConstraint!
     var emailPlaceholderLeftAnchorConstraints: NSLayoutConstraint!
    
     var passwordPlaceHolderCenterYConstraints: NSLayoutConstraint!
     var passwordPlaceholderLeftAnchorConstraints: NSLayoutConstraint!
    
    var signInButtonBottomAnchor: NSLayoutConstraint!
    var signInButtonLeftAnchor: NSLayoutConstraint!
    var signInButtonRightAnchor: NSLayoutConstraint!
    
    
    
     var dontHaveAnAccountBottomAnchor: NSLayoutConstraint!
    
     var isTapped = true
     var isKeyboardMoves = true
    
    
    var emailValidType: String.ValidTypes = .email
    var passwordValidType: String.ValidTypes = .password
    
    
    weak var createAnAccountDelegate: CreateAnAccountDelegate?
    weak var signInButtonDelegate: SignInButton?
    
    
    
    
    
    
    
    
    lazy var singInLogo: UIImageView = {
        let singInLogo = UIImageView()
        singInLogo.image = UIImage(named: "SingInLogo")
        
        
        
        return singInLogo
    }()
    
    lazy var zooMarketLabel: UILabel = {
        let zooMarketLabel = UILabel()
        zooMarketLabel.text = "ZooMarket"
        zooMarketLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 32)
        
        
        return zooMarketLabel
    }()
    
    
    lazy var IDLabel: UILabel = {
        let IDLabel = UILabel()
        IDLabel.text = "ID"
        IDLabel.textColor = .systemIndigo
        IDLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 32)
        
        
        return IDLabel
    }()
    
    lazy var welcomeBackLabel: UILabel = {
        let welcomeBackLabel = UILabel()
        welcomeBackLabel.text = "С возвращением, войдите в ваш аккаунт"
        welcomeBackLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 16)
        
        
        return welcomeBackLabel
    }()
    
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        
        
        emailTextField.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        emailTextField.returnKeyType = .done
        emailTextField.keyboardType = .emailAddress
        emailTextField.layer.cornerRadius = 16
        emailTextField.backgroundColor = .systemGray6
        emailTextField.autocorrectionType = .no
        
        
        
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
            let userEmailValidLabel = UILabel()
            userEmailValidLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 12)
            
            
            
            return userEmailValidLabel
        }()
    
    
    
    lazy var emailPlaceHolder: UILabel = {
        let emailPlaceHolder = UILabel()
        emailPlaceHolder.text = "   Электронная почта"
        emailPlaceHolder.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        emailPlaceHolder.textColor = .systemGray
        
        
        return emailPlaceHolder
        
    }()
    
    
    
    
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.cornerRadius = 16
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocorrectionType = .no
        passwordTextField.returnKeyType = .done
        
        
        return passwordTextField
    }()
    
    
    lazy var passwordValidLine: UIView = {
        let passwordValidLine = UIView()
        passwordValidLine.layer.borderWidth = 1.5
        passwordValidLine.layer.cornerRadius = 6
        passwordValidLine.layer.borderColor = UIColor.clear.cgColor
        
        
        return passwordValidLine
    }()
    
    
    lazy var passwordValidLabel: UILabel = {
            let passwordValidLabel = UILabel()
        passwordValidLabel.font = UIFont(name: "Apple SD Gothic Neo Light", size: 12)
            
            
            
            return passwordValidLabel
        }()
    
    
    lazy var passwordPlaceHolder: UILabel = {
        let passwordPlaceHolder = UILabel()
        passwordPlaceHolder.text = "   Ваш пароль"
        passwordPlaceHolder.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        passwordPlaceHolder.textColor = .systemGray
        
        
        return passwordPlaceHolder
        
    }()
    
    
    
    lazy var passwordHideShowButton: UIButton = {
       let passwordHideShowButton = UIButton()
        passwordHideShowButton.setImage(UIImage(named: "HidePassword"), for: .normal)
        passwordHideShowButton.setImage(UIImage(named: "ShowPassword"), for: .highlighted)
        passwordHideShowButton.tintColor = .black
        
        passwordHideShowButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        
        return passwordHideShowButton
    }()
    
    lazy var forgetPasswordButton: UIButton = {
        let forgetPasswordButton = UIButton()
        forgetPasswordButton.setTitle("Забыли пароль?", for: .normal)
        forgetPasswordButton.setTitleColor(UIColor.black, for: .normal)
        forgetPasswordButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        forgetPasswordButton.backgroundColor = .clear
        
    
        return forgetPasswordButton
        
    }()
    
    lazy var signWithGoogle: UIButton = {
        let signWithGoogle = UIButton()
        signWithGoogle.setTitle("Вход с Google", for: .normal)
        signWithGoogle.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Medium", size: 18)
        signWithGoogle.setTitleColor(UIColor.white, for: .normal)
        signWithGoogle.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)
        signWithGoogle.backgroundColor = .systemBlue
        signWithGoogle.layer.cornerRadius = 16
        
        return signWithGoogle
        
    }()
    
    lazy var signWithApple: UIButton = {
        let signWithApple = UIButton()
        signWithApple.setTitle("Вход с Apple", for: .normal)
        signWithApple.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Medium", size: 18)
        signWithApple.setTitleColor(UIColor.white, for: .normal)
        signWithApple.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)
        signWithApple.backgroundColor = .black
        signWithApple.layer.cornerRadius = 16
        
        return signWithApple
        
    }()
    
    lazy var signInButton: UIButton = {
       let signInButton = UIButton()
        signInButton.setTitle("Войти", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Medium", size: 14)
        signInButton.setTitleColor(UIColor.white, for: .normal)
        signInButton.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)
        signInButton.backgroundColor = .systemIndigo.withAlphaComponent(0.9)
        signInButton.layer.cornerRadius = 16
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        
        return signInButton
    }()
    
    lazy var dontHaveAnAccount: UILabel = {
        let dontHaveAnAccount = UILabel()
        dontHaveAnAccount.text = "Ещё нет аккаунта?"
        dontHaveAnAccount.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        
        return dontHaveAnAccount
    }()
    
    lazy var createAccountButton: UIButton = {
       let createAccountButton = UIButton()
        createAccountButton.backgroundColor = .clear
        createAccountButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Light", size: 14)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Создайте его", attributes: underlineAttribute)
        createAccountButton.setAttributedTitle(underlineAttributedString, for: .normal)
        createAccountButton.setTitleColor(UIColor.systemIndigo, for: .normal)
        
        
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        
        return createAccountButton
        
    }()
    
    lazy var leftSingleLine: UIView = {
        let leftSingleLine = UIView()
        leftSingleLine.layer.borderWidth = 1.5
        leftSingleLine.layer.borderColor = UIColor.systemGray.cgColor
        
        return leftSingleLine
    }()
    
    
    lazy var rightSingleLine: UIView = {
        let rightSingleLine = UIView()
        rightSingleLine.layer.borderWidth = 1.5
        rightSingleLine.layer.borderColor = UIColor.systemGray.cgColor
        
        return rightSingleLine
    }()
    
    lazy var betweenLinesLabel: UILabel = {
       let betweenLinesLabel = UILabel()
        betweenLinesLabel.text = "или"
        betweenLinesLabel.font = UIFont(name: "Apple SD Gothic Neo Medium", size: 14)
        betweenLinesLabel.textColor = .systemGray
        
        
        return betweenLinesLabel
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        emailTextField.delegate = self
        passwordTextField.delegate = self
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




private extension SignInView {
    
    func addSubviews() {
        addSubview(singInLogo)
        addSubview(zooMarketLabel)
        addSubview(IDLabel)
        addSubview(welcomeBackLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(emailPlaceHolder)
        addSubview(passwordPlaceHolder)
        addSubview(passwordHideShowButton)
        addSubview(forgetPasswordButton)
        addSubview(signWithGoogle)
        addSubview(signWithApple)
        addSubview(signInButton)
        addSubview(dontHaveAnAccount)
        addSubview(createAccountButton)
        addSubview(emailValidLine)
        addSubview(emailValidLabel)
        addSubview(passwordValidLine)
        addSubview(passwordValidLabel)
        addSubview(leftSingleLine)
        addSubview(betweenLinesLabel)
        addSubview(rightSingleLine)

    }
    
    func setConstraints() {
        singInLogoConstraints()
        welcomeBackBlackLabelConstraints()
        IDLabelConstraints()
        welcomeBackLabelConstraints()
        emailTextFieldConstraints()
        passwordTextFieldConstraints()
        emailPlaceHolderConstraints()
        passwordPlaceHolderConstraints()
        passwordHideShowButtonConstraints()
        forgetPasswordButtonConstrasints()
        signWithGoogleConstraints()
        signWithAppleConstraints()
        signInButtonConstraints()
        dontHaveAnAccountConstraints()
        createAccountButtonConstraints()
        emailValidLineConstraints()
        emailValidLabelConstraints()
        passwordValidLineConstraints()
        passwordValidLabelConstraints()
        leftSingleLineConstraints()
        betweenLinesLabelConstraints()
        rightSingleLineConstraints()

    }
    
    func singInLogoConstraints() {
        
        singInLogo.translatesAutoresizingMaskIntoConstraints = false
        [singInLogo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
         singInLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
         singInLogo.heightAnchor.constraint(equalToConstant: 64),
         singInLogo.widthAnchor.constraint(equalToConstant: 64)].forEach {
            $0.isActive = true
        }
    }
    
    
    func welcomeBackBlackLabelConstraints() {
        
        zooMarketLabel.translatesAutoresizingMaskIntoConstraints = false
        [zooMarketLabel.topAnchor.constraint(equalTo: singInLogo.bottomAnchor, constant: 46),
         zooMarketLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32)].forEach {
            $0.isActive = true
        }
    }
    
    
    func IDLabelConstraints() {
        
        IDLabel.translatesAutoresizingMaskIntoConstraints = false
        [IDLabel.topAnchor.constraint(equalTo: singInLogo.bottomAnchor, constant: 46),
         IDLabel.leftAnchor.constraint(equalTo: zooMarketLabel.rightAnchor, constant: 6)].forEach {
            $0.isActive = true
        }
        
    }
    
    
    
    func welcomeBackLabelConstraints() {
        welcomeBackLabel.translatesAutoresizingMaskIntoConstraints = false
        [welcomeBackLabel.topAnchor.constraint(equalTo: zooMarketLabel.bottomAnchor, constant: 0),
         welcomeBackLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32)].forEach {
            $0.isActive = true
        }
    }
    
    
    func emailTextFieldConstraints() {
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        [emailTextField.topAnchor.constraint(equalTo: welcomeBackLabel.bottomAnchor, constant: 32),
         emailTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         emailTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         emailTextField.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
        
    }
    
    
    func emailValidLineConstraints() {
        emailValidLine.translatesAutoresizingMaskIntoConstraints = false
        [emailValidLine.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -1.5),
         emailValidLine.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 12),
         emailValidLine.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: -12),
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
    
    func emailPlaceHolderConstraints() {
        
        emailPlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        emailPlaceholderCenterYConstraints = emailPlaceHolder.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor, constant: 0)
        emailPlaceholderLeftAnchorConstraints = emailPlaceHolder.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: 0)
        NSLayoutConstraint.activate([emailPlaceholderCenterYConstraints, emailPlaceholderLeftAnchorConstraints])
    }
    
    
    
    
    func passwordTextFieldConstraints() {
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        [passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
         passwordTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
         passwordTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32),
         passwordTextField.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
        
    }
    
    func passwordValidLineConstraints() {
        passwordValidLine.translatesAutoresizingMaskIntoConstraints = false
        [passwordValidLine.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -1.5),
         passwordValidLine.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor, constant: 12),
         passwordValidLine.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -12),
         passwordValidLine.heightAnchor.constraint(equalToConstant: 1.5)].forEach {
            $0.isActive = true
        }
    }
    
    
    func passwordValidLabelConstraints() {
        passwordValidLabel.translatesAutoresizingMaskIntoConstraints = false
        [passwordValidLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 2),
         passwordValidLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 48),
         passwordValidLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -36)].forEach {
            $0.isActive = true
        }
    }
    
    
    
    func passwordPlaceHolderConstraints() {
        passwordPlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        passwordPlaceHolderCenterYConstraints = passwordPlaceHolder.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor, constant: 0)
        passwordPlaceholderLeftAnchorConstraints = passwordPlaceHolder.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 0)
        NSLayoutConstraint.activate([passwordPlaceHolderCenterYConstraints, passwordPlaceholderLeftAnchorConstraints])
        
    }
    
    
    func passwordHideShowButtonConstraints() {
        passwordHideShowButton.translatesAutoresizingMaskIntoConstraints = false
        [passwordHideShowButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor, constant: 0),
         passwordHideShowButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -48),
         passwordHideShowButton.heightAnchor.constraint(equalToConstant: 16),
         passwordHideShowButton.widthAnchor.constraint(equalToConstant: 16)].forEach {
            $0.isActive = true
        }
    }
    
    func forgetPasswordButtonConstrasints() {
        
        forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        [forgetPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
        forgetPasswordButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -34),
         forgetPasswordButton.heightAnchor.constraint(equalToConstant: 12)].forEach {
            $0.isActive = true
        }
    }
    

    func signWithGoogleConstraints() {
        signWithGoogle.translatesAutoresizingMaskIntoConstraints = false
        [signWithGoogle.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -116),
        signWithGoogle.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -64),
        signWithGoogle.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 64),
         signWithGoogle.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
        }
    }
    
    
    func signWithAppleConstraints() {
        signWithApple.translatesAutoresizingMaskIntoConstraints = false
        [signWithApple.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -64),
        signWithApple.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -64),
        signWithApple.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 64),
         signWithApple.heightAnchor.constraint(equalToConstant: 40)].forEach {
            $0.isActive = true
            
        }
    }
    
    

    func signInButtonConstraints() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButtonBottomAnchor = signInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -224)
        signInButtonLeftAnchor = signInButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 64)
        signInButtonRightAnchor = signInButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -64)
        signInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        NSLayoutConstraint.activate([signInButtonBottomAnchor, signInButtonLeftAnchor,signInButtonRightAnchor])
    }
    
    func leftSingleLineConstraints() {
        leftSingleLine.translatesAutoresizingMaskIntoConstraints = false
        [leftSingleLine.bottomAnchor.constraint(equalTo: signWithGoogle.topAnchor, constant: -32),
         leftSingleLine.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 96),
        leftSingleLine.widthAnchor.constraint(equalToConstant: 96),
         leftSingleLine.heightAnchor.constraint(equalToConstant: 1)].forEach {
            $0.isActive = true
        }
    }
    
    
    func betweenLinesLabelConstraints() {
        betweenLinesLabel.translatesAutoresizingMaskIntoConstraints = false
        [betweenLinesLabel.centerYAnchor.constraint(equalTo: leftSingleLine.centerYAnchor, constant: 0),
        betweenLinesLabel.leftAnchor.constraint(equalTo: leftSingleLine.rightAnchor, constant: 12),
         betweenLinesLabel.rightAnchor.constraint(equalTo: rightSingleLine.leftAnchor, constant: -2)].forEach {
            $0.isActive = true
        }
    }
    
    
    func rightSingleLineConstraints() {
        rightSingleLine.translatesAutoresizingMaskIntoConstraints = false
        [rightSingleLine.bottomAnchor.constraint(equalTo: signWithGoogle.topAnchor, constant: -32),
         rightSingleLine.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -96),
         rightSingleLine.widthAnchor.constraint(equalToConstant: 96),
         rightSingleLine.heightAnchor.constraint(equalToConstant: 1)].forEach {
            $0.isActive = true
        }
    }
    
    
    func dontHaveAnAccountConstraints() {
        dontHaveAnAccount.translatesAutoresizingMaskIntoConstraints = false
        [dontHaveAnAccount.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 116)].forEach {
            $0.isActive = true
        }
        
        dontHaveAnAccountBottomAnchor = dontHaveAnAccount.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        NSLayoutConstraint.activate([dontHaveAnAccountBottomAnchor])
    }
    
    func createAccountButtonConstraints() {
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        [createAccountButton.centerYAnchor.constraint(equalTo: dontHaveAnAccount.centerYAnchor, constant: 0),
         createAccountButton.leftAnchor.constraint(equalTo: dontHaveAnAccount.rightAnchor, constant: 6),
         createAccountButton.heightAnchor.constraint(equalToConstant: 12)].forEach {
            $0.isActive = true
        }
    }


    
}









