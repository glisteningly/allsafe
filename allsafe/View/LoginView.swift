//
//  SignInView.swift
//  allsafe
//
//  Created by eeefan on 2017/10/17.
//  Copyright © 2017年 eeefan. All rights reserved.
//

import Foundation

public protocol LoginView: NSObjectProtocol {
    //加载动画
    func showProgress()
    //隐藏加载动画
    func dismisss()
    //获取账号信息
    func getUserInfo() -> UserModel?

    func showAlert(alertMsg: String)
    
    func navToMainWeb(userInfo: UserModel)
}
