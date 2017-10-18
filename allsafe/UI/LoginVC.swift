//
//  LoginVC.swift
//  allsafe
//
//  Created by eeefan on 2017/10/16.
//  Copyright © 2017年 eeefan. All rights reserved.
//

import UIKit
import Toast_Swift

class LoginVC: UIViewController, LoginView {

    

    var presneter: LoginPresenter?

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var serverTxt: UITextField!
    @IBOutlet weak var activityBar: UIActivityIndicatorView!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    func initView() {
        activityBar.isHidden = true
        loginBtn.layer.cornerRadius = 5
//        loginBtn.clipsToBounds
        presneter = LoginPresenter.init(loginView: self)
    }

    @IBAction func signInBtn_Clicked(_ sender: Any) {
        presneter!.login()
    }

    func saveUserInfo() {

    }

    func showProgress() {
        activityBar.isHidden = false
    }

    func dismisss() {
        activityBar.isHidden = true
    }
    
    func showAlert(alertMsg: String) {
        self.view.makeToast(alertMsg)
    }

    func getUserInfo() -> UserModel? {
        if usernameTxt.text!.isEmpty || passwordTxt.text!.isEmpty || serverTxt.text!.isEmpty {
            showAlert(alertMsg: "信息填写不完整")
            return nil
        } else {
            let useInfo = UserModel(user: usernameTxt.text!, psd: passwordTxt.text!, serv: serverTxt.text!)
            return useInfo
        }
    }
    
    func navToMainWeb(userInfo: UserModel) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainWeb")
        self.present(mainVC, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
