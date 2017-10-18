//
//  SplashPresenter.swift
//  allsafe
//
//  Created by eeefan on 2017/10/17.
//  Copyright © 2017年 eeefan. All rights reserved.
//

import UIKit

class SplashPresenter: NSObject, LoginListener {

    let mSplashView: SplashView
    let mLoginManager: LoginManager

    //构造函数
    init(splashView: SplashView) {
        self.mSplashView = splashView
        self.mLoginManager = LoginManager()
    }

    func login() {
        if let userInfo = UserInfoUtil.getCurrentUserInfo() {
            mLoginManager.login(userInfo: userInfo, listener: self)
        } else {
            mSplashView.navToLogin()
        }
    }

    func failure(errormessage: String) {
        mSplashView.navToLogin()
    }

    func sucess(userInfo: UserModel) {
        mSplashView.navToMainWeb(userInfo: userInfo)
    }
}
