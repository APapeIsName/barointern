//
//  ManageLocalData.swift
//  barointern
//
//  Created by 공명선 on 3/16/25.
//

import Foundation

func deleteLocalUserData() {
    UserDefaults.standard.removeObject(forKey: "id")
    UserDefaults.standard.removeObject(forKey: "password")
    UserDefaults.standard.removeObject(forKey: "nickname")
}
