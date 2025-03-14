//
//  SetLogoProtocol.swift
//  barointern
//
//  Created by 공명선 on 3/14/25.
//

import UIKit

extension UIImageView {
    internal func setLogo() -> UIImageView {
        return self.then { uiImage in
            uiImage.image = UIImage(named: "barogochim")
            uiImage.adjustsImageSizeForAccessibilityContentSizeCategory = false
            uiImage.contentMode = .scaleAspectFit
            uiImage.layer.cornerRadius = 10
            uiImage.layer.shadowOffset = CGSize(width: 5, height: 5)
            uiImage.layer.shadowRadius = 5
            uiImage.layer.shadowOpacity = 0.5
        }
    }
}
