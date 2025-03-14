//
//  LoginSuccessViewController.swift
//  barointern
//
//  Created by 공명선 on 3/14/25.
//

import UIKit
import SnapKit
import Then

class WelcomeViewController: UIViewController, BarointernUiViewProtocol {
    private var nickname: String = "페잎"
    
    private let logoImageView: UIImageView = UIImageView().setLogo()
    private lazy var welcomeLabel: UILabel = UILabel().setLoginSuccessStyle(text: "\(nickname) 님,\n 환영합니다")
    private let logoutButton: UIButton = UIButton().setLoginSuccessStyle(title: "로그아웃", color: .systemGray)
    private let deleteIdButton: UIButton = UIButton().setLoginSuccessStyle(title: "회원 탈퇴", color: .systemRed)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        deleteIdButton.addTarget(self, action: #selector(handleDeleteID), for: .touchUpInside)
        setLayout()
    }
    
    internal func setLayout() {
        view.addSubViews(logoImageView, welcomeLabel, logoutButton, deleteIdButton)
        
        view.backgroundColor = .systemBackground
        makeViewConstraints()
    }
    
    internal func makeViewConstraints() {
        welcomeLabel.snp.makeDefaultConstraints(view: view)
        
        logoImageView.snp.makeConstraints { make in
            make.width.equalTo(400)
            make.height.equalTo(200)
            make.centerY.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(50)
        }
        logoutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(80)
        }
        deleteIdButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(60)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(80)
        }
    }
    
    @objc private func handleLogout() {
        doSafetySetViewControllers(notSafeNavController: navigationController, viewControllers: [StartViewController()])
        print("로그아웃")
    }
    
    @objc private func handleDeleteID() {
        doSafetySetViewControllers(notSafeNavController: navigationController, viewControllers: [StartViewController()])
        print("회원 탈퇴")
    }
}

extension UIButton {
    fileprivate func setLoginSuccessStyle(title: String, color: UIColor) -> UIButton {
        return self.then {
            uiButton in
            uiButton.setTitleColor(color, for: .normal)
            uiButton.setTitle(title, for: .normal)
        }
    }
}

extension UILabel {
    fileprivate func setLoginSuccessStyle(text: String) -> UILabel {
        return self.then {
            uiLabel in
            uiLabel.text = text
            uiLabel.textAlignment = .center
            uiLabel.font = .boldSystemFont(ofSize: 24)
            uiLabel.numberOfLines = 2
        }
    }
}

#Preview {
    WelcomeViewController()
}
