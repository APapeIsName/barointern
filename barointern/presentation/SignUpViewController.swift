//
//  SignUpViewController.swift
//  barointern
//
//  Created by 공명선 on 3/14/25.
//

import UIKit
import SnapKit
import Then
import CoreData

final class SignUpViewController: UIViewController, BarointernUiViewProtocol {
    private var nsContainer : NSPersistentContainer!
    private var userObject: NSManagedObject!
    private let signUpLabel: UILabel = UILabel().setSignUpStyle()
    private let emailTextField: UITextField = UITextField().setSignUpStyle(placeholder: "이메일")
    private let passwordTextField: UITextField = UITextField().setSignUpStyle(placeholder: "비밀번호")
    private let checkPasswordTextField: UITextField = UITextField().setSignUpStyle(placeholder: "비밀번호 확인")
    private let nicknameTextField: UITextField = UITextField().setSignUpStyle(placeholder: "닉네임")
    private let signUpButton: UIButton = UIButton().setSignUpStyle()
    private let signUpStateLabel: UILabel = UILabel().setSignUpStateStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let entity = createEntity()
        userObject = NSManagedObject(entity: entity, insertInto: self.nsContainer.viewContext)
        
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        emailTextField.addTarget(self, action: #selector(setSignUpEnable), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(setSignUpEnable), for: .editingChanged)
        checkPasswordTextField.addTarget(self, action: #selector(setSignUpEnable), for: .editingChanged)
        nicknameTextField.addTarget(self, action: #selector(setSignUpEnable), for: .editingChanged)
        setLayout()
        
    }
    
    internal func setLayout() {
        view.addSubViews(signUpLabel, emailTextField, passwordTextField, checkPasswordTextField, nicknameTextField, signUpButton, signUpStateLabel)
        
        signUpButton.setDisable()
        
        view.backgroundColor = .systemBackground
        makeViewConstraints()
    }
    
    internal func makeViewConstraints() {
        signUpLabel.snp.makeDefaultConstraints(view: view)
        emailTextField.snp.makeTextFieldDefaultConstraints(view: view)
        passwordTextField.snp.makeTextFieldDefaultConstraints(view: view)
        checkPasswordTextField.snp.makeTextFieldDefaultConstraints(view: view)
        nicknameTextField.snp.makeTextFieldDefaultConstraints(view: view)
        signUpButton.snp.makeDefaultConstraints(view: view)
        signUpStateLabel.snp.makeDefaultConstraints(view: view)
        
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
        }
        
        checkPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(checkPasswordTextField.snp.bottom).offset(20)
        }
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        signUpStateLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(60)
        }
    }
    
    @objc func handleSignUp(action: Selector) {
        let id = emailTextField.text!
        let password = passwordTextField.text!
        let nickname = nicknameTextField.text!
        saveUserData(userObject: userObject, userInfo: User(id: id, password: password, nickname: nickname))
    }
    
    @objc func setSignUpEnable() {
        signUpStateLabel.isHidden = true
        if (
            checkValidEmail(email: emailTextField.text!)
            && checkValidPassword(password: passwordTextField.text!)
            && checkValidPasswordEqual(checkPassword: checkPasswordTextField.text!, password: passwordTextField.text!)
            && !nicknameTextField.text!.isEmpty
        ) {
            signUpButton.setEnable()
        } else {
            signUpButton.setDisable()
        }
    }
    
    func navigateToWelcomeViewController() {
        if let navController = navigationController {
            navController.setViewControllers([WelcomeViewController()], animated: true)
        } else {
            print("navController is nil")
        }
    }
    
    func createEntity() -> NSEntityDescription {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.nsContainer = appDelegate.persistentContainer
        return NSEntityDescription.entity(forEntityName: "UserEntity", in: self.nsContainer.viewContext)!
    }
    
    func saveUserData(userObject: NSManagedObject, userInfo: User) {
        var isDuplicated = false
        let userList = getUserListFromData(container: self.nsContainer)
        userList.forEach {
            if($0.id == userInfo.id) {
                signUpStateLabel.isHidden = false
                isDuplicated = true
            }
        }
        if(isDuplicated) { return }
        userObject.setValue(userInfo.id, forKey: "id")
        userObject.setValue(userInfo.password, forKey: "password")
        userObject.setValue(userInfo.nickname, forKey: "nickname")
        do {
            try self.nsContainer.viewContext.save()
            UserDefaults.standard.set(userInfo.id, forKey: "id")
            UserDefaults.standard.set(userInfo.password, forKey: "password")
            UserDefaults.standard.set(userInfo.nickname, forKey: "nickname")
            navigateToWelcomeViewController()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    SignUpViewController()
}

extension UITextField {
    fileprivate func setSignUpStyle(placeholder: String) -> UITextField {
        return self.then{
            uiTextField in
            uiTextField.placeholder = placeholder
            uiTextField.font = .systemFont(ofSize: 17)
            uiTextField.borderStyle = .roundedRect
            uiTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            uiTextField.leftViewMode = .always
        }
    }
}

extension ConstraintViewDSL {
    fileprivate func makeTextFieldDefaultConstraints(view: UIView) {
        self.makeConstraints { make in
            make.height.equalTo(60)
        }
        self.makeDefaultConstraints(view: view)
    }
}

extension UIButton {
    fileprivate func setSignUpStyle() -> UIButton {
        return self.then {
            uiButton in
            uiButton.setTitle("회원가입", for: .normal)
        }
    }
    
    fileprivate func setEnable() {
        self.then {
            uiButton in
            uiButton.backgroundColor = .systemBlue
            uiButton.isEnabled = true
        }
    }
    
    fileprivate func setDisable() {
        self.then {
            uiButton in
            uiButton.backgroundColor = .systemGray
            uiButton.isEnabled = false
        }
    }
}

extension UILabel {
    fileprivate func setSignUpStyle() -> UILabel {
        return self.then {
            uiLabel in
            uiLabel.text = "이메일과 비밀번호,\n닉네임을 입력해주세요."
            uiLabel.font = .systemFont(ofSize: 24, weight: .black)
            uiLabel.textColor = .black
            uiLabel.numberOfLines = 2
        }
    }
    
    fileprivate func setSignUpStateStyle() -> UILabel {
        return self.then {
            uiLabel in
            uiLabel.isHidden = true
            uiLabel.text = "중복된 이메일이 존재합니다."
            uiLabel.textColor = .red
            uiLabel.numberOfLines = 1
            uiLabel.font = .systemFont(ofSize: 14, weight: .regular)
        }
    }
}
