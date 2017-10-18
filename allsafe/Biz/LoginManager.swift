//
//  LoginManager.swift
//  allsafe
//
//  Created by eeefan on 2017/10/17.
//  Copyright © 2017年 eeefan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginManager: NSObject {
    let LOGINPATH = "/rest/login"
    //登录 传参 账号 密码 登录结果监听
    func login(userInfo: UserModel, listener: LoginListener) -> () {
        let str = "\(userInfo.username):\(userInfo.password)"
        let utf8str = str.data(using: String.Encoding.utf8)
        let base64Encoded = utf8str?.base64EncodedString()

        let headers = ["Authorization": "Basic " + base64Encoded!]
        let url = "http://\(userInfo.server)" + LOGINPATH

        Alamofire.request(url, method: .post, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
//                print(response.result.value!)
                let json = JSON(response.result.value!)
                if json["errors"].count > 0 {
                    listener.failure(errormessage: json["errors"][0]["message"].string!)
                } else {
                    listener.sucess(userInfo: userInfo)
                }
            case .failure(let error):
                print(error.localizedDescription)
                listener.failure(errormessage: "无法连接到服务器")
            }
        }
    }
}
