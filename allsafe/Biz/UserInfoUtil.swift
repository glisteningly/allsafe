//
//  UserInfoUtil.swift
//  allsafe
//
//  Created by eeefan on 2017/10/17.
//  Copyright © 2017年 eeefan. All rights reserved.
//

import UIKit

class UserInfoUtil: NSObject {
    public static func saveCurrentUserInfo(userInfo: UserModel) {
        UserDefaults.standard.set(userInfo.username, forKey: "username")
        UserDefaults.standard.set(userInfo.password, forKey: "password")
        UserDefaults.standard.set(userInfo.server, forKey: "server")
        UserDefaults.standard.synchronize()
    }
    
    public static func getCurrentUserInfo() -> UserModel{
        let username = UserDefaults.standard.string(forKey: "username")
        let password = UserDefaults.standard.string(forKey: "password")
        let server = UserDefaults.standard.string(forKey: "server")
        return UserModel(user: username!, psd: password!, serv: server!)
    }
}
