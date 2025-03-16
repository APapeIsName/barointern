//
//  ViewController.swift
//  barointern
//
//  Created by 공명선 on 3/13/25.
//

import UIKit
import SnapKit
import Then

class StartViewController: UIViewController, BarointernUiViewProtocol {
    private var isLogin: Bool = false
    private let logoImageView: UIImageView = UIImageView().setLogo()
    private let startButton = UIButton(type: .system).setStartStyle()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubViews(logoImageView, startButton)
        setLayout()
    }
    
    internal func setLayout() {
        view.backgroundColor = .systemBackground
        let loginUserId = UserDefaults.standard.string(forKey: "id") ?? ""
        if !loginUserId.isEmpty {
            isLogin = true
        }
        
        startButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        makeViewConstraints()
    }
    
    internal func makeViewConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.width.equalTo(400)
            make.height.equalTo(200)
            make.centerY.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-80)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
    }

    @objc func handleStartButton() {
        if(isLogin) {
            doSafetyPushViewController(notSafeNavController: navigationController, viewController: WelcomeViewController())
        } else {
            doSafetyPushViewController(notSafeNavController: navigationController, viewController: SignUpViewController())
        }
    }
    
}

extension UIButton {
    fileprivate func setStartStyle() -> UIButton {
        return self.then {
            uiButton in
            uiButton.setTitle("바로 시작하기", for: .normal)
            uiButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
}

#Preview {
    StartViewController()
}
