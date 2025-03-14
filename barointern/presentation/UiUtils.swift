//
//  Utils.swift
//  barointern
//
//  Created by 공명선 on 3/14/25.
//

import UIKit
import SnapKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach {
            subView in
            self.addSubview(subView)
        }
    }
}

extension ConstraintViewDSL  {
    internal func makeDefaultConstraints(view: UIView) {
        self.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
}
