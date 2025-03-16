//
//  ManageUserData.swift
//  barointern
//
//  Created by 공명선 on 3/16/25.
//

import CoreData

func getUserListFromData(container: NSPersistentContainer) -> [User] {
    var userList = [User]()
    do {
        let content = try container.viewContext.fetch(UserEntity.fetchRequest()) as! [UserEntity]
        content.forEach {
            if($0.id == nil || $0.nickname == nil || $0.password == nil) { return }
            else if(!($0.id!.isEmpty || $0.nickname!.isEmpty || $0.password!.isEmpty)) {
                userList.append(User(id: $0.id!, password: $0.password!, nickname: $0.nickname!))
            }
        }
    } catch {
        print(error.localizedDescription)
    }
    return userList
}
