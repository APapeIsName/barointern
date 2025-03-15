//
//  SignUpFunction.swift
//  barointern
//
//  Created by 공명선 on 3/15/25.
//
import UIKit

func checkValidEmail(email: String) -> Bool {
    let emailRegex = "^(?!\\d)[a-z0-9]{6,20}@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}

func checkValidPassword(password: String) -> Bool {
    return password.count >= 8
}

func checkValidPasswordEqual(checkPassword: String, password: String) -> Bool {
    return checkPassword == password
}
