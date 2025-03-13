//
//  Utils.swift
//  barointern
//
//  Created by 공명선 on 3/14/25.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
