//
//  ViewController.swift
//  barointern
//
//  Created by 공명선 on 3/13/25.
//

import UIKit
import SnapKit
import Then

class StartViewController: UIViewController {
    
    private let logoImageView: UIImageView = UIImageView().then { uiImage in
        uiImage.image = UIImage(named: "barogochim")
        uiImage.adjustsImageSizeForAccessibilityContentSizeCategory = false
        uiImage.contentMode = .scaleAspectFit
        uiImage.layer.cornerRadius = 10
        uiImage.layer.shadowOffset = CGSize(width: 5, height: 5)
        uiImage.layer.shadowRadius = 5
        uiImage.layer.shadowOpacity = 0.5
    }
    private let startButton = UIButton(type: .system).then {
        $0.setTitle("바로 시작하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubViews(logoImageView, startButton)
        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .systemBackground
        
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

}

#Preview {
    StartViewController()
}
