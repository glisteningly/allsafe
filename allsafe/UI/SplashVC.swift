//
//  SplashVC.swift
//  allsafe
//
//  Created by eeefan on 2017/10/17.
//  Copyright © 2017年 eeefan. All rights reserved.
//

import UIKit
import Toast_Swift

class SplashVC: UIViewController, SplashView {

    
    var presneter: SplashPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UserDefaults.standard.set("aaa", forKey: "username")
        
        sleep(2)
//        presneter = SplashPresenter.init(splashView: self)
//        presneter?.login()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presneter = SplashPresenter.init(splashView: self)
        presneter?.login()
    }
    
    func showAlert(alertMsg: String) {
        self.view.makeToast(alertMsg)
    }

    func navToMainWeb(userInfo: UserModel) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainWeb") 
        self.present(mainVC, animated: true, completion: nil)
    }
    
    func navToLogin() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "Login")
        self.present(loginVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
