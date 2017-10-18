//
//  UserModel.swift
//  allsafe
//
//  Created by eeefan on 2017/10/17.
//  Copyright © 2017年 eeefan. All rights reserved.
//

import Foundation

public class UserModel: NSObject {
    //账号
    var username = ""
    //密码
    var password = ""
    //登录服务器
    var server = ""

    init(user: String, psd: String, serv: String) {
        username = user
        password = psd
        server = serv
    }
}
