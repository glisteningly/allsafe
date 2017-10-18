//
//  SplashView.swift
//  allsafe
//
//  Created by eeefan on 2017/10/17.
//  Copyright © 2017年 eeefan. All rights reserved.
//

import Foundation

public protocol SplashView: NSObjectProtocol {
    func showAlert(alertMsg: String)
    
    func navToMainWeb(userInfo: UserModel)
    
    func navToLogin()
}
