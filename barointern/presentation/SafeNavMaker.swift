//
//  SetNavController.swift
//  barointern
//
//  Created by 공명선 on 3/15/25.
//

import UIKit

func doSafetyPushViewController(notSafeNavController: UINavigationController?, viewController: UIViewController) {
    if let navController = notSafeNavController {
        navController.pushViewController(viewController, animated: true)
    } else {
        print("navController is nil")
    }
}

func doSafetySetViewControllers(notSafeNavController: UINavigationController?, viewControllers: [UIViewController]) {
    if let navController = notSafeNavController {
        navController.setViewControllers(viewControllers, animated: true)
    } else {
        print("navController is nil")
    }
}
