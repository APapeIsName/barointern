//
//  SignUpViewController.swift
//  barointern
//
//  Created by 공명선 on 3/14/25.
//

import UIKit
import SnapKit
import Then

final class SignUpViewController: UIViewController, BarointernUiViewProtocol {
    
    private let signUpLabel: UILabel = UILabel().setSignUpStyle()
    private let emailTextField: UITextField = UITextField().setSignUpStyle(placeholder: "이메일")
    private let passwordTextField: UITextField = UITextField().setSignUpStyle(placeholder: "비밀번호")
    private let checkPasswordTextField: UITextField = UITextField().setSignUpStyle(placeholder: "비밀번호 확인")
    private let nicknameTextField: UITextField = UITextField().setSignUpStyle(placeholder: "닉네임")
    private let signUpButton: UIButton = UIButton().setSignUpStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        setLayout()
        
    }
    
    internal func setLayout() {
        view.addSubViews(signUpLabel, emailTextField, passwordTextField, checkPasswordTextField, nicknameTextField, signUpButton)
        
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
    }
    
    @objc func handleSignUp() {
        print("가입 확인")
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
            uiButton.backgroundColor = .systemBlue
        }
    }
}

extension UILabel {
    fileprivate func setSignUpStyle() -> UILabel {
        return self.then {
            uiText in
            uiText.text = "이메일과 비밀번호,\n닉네임을 입력해주세요."
            uiText.font = .systemFont(ofSize: 24, weight: .black)
            uiText.textColor = .black
            uiText.numberOfLines = 2
        }
    }
}
