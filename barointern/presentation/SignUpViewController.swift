//
//  SignUpViewController.swift
//  barointern
//
//  Created by 공명선 on 3/14/25.
//

import UIKit
import SnapKit
import Then

final class SignUpViewController: UIViewController {
    
    private let emailTextField: UITextField = .init()
    private let emailTypeTextField: UITextField = .init()
    private let passwordTextField: UITextField = .init()
    private let checkPasswordTextField: UITextField = .init()
    private let nicknameTextField: UITextField = .init()
    private let signUpButton: UIButton = .init(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func addSubViews() {
        view.addSubview(emailTextField)
    }
    
    private func setLayout() {
        view.backgroundColor = .systemBackground
    }
}

#Preview {
    SignUpViewController()
}
