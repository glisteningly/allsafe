//
//  LoginListener.swift
//  allsafe
//
//  Created by eeefan on 2017/10/17.
//  Copyright © 2017年 eeefan. All rights reserved.
//

import Foundation

protocol LoginListener: NSObjectProtocol {
    //失败 传参 失败信息
    func failure(errormessage : String) -> ()
    //成功 传参 Model
    func sucess(userInfo : UserModel) -> ()
}
