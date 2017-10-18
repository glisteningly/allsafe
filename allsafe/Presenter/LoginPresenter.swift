import UIKit

class LoginPresenter: NSObject, LoginListener {
    let mLoginView: LoginView
    let mLoginManager: LoginManager

    //构造函数
    init(loginView: LoginView) {
        self.mLoginView = loginView
        self.mLoginManager = LoginManager()
    }

    //登录事件
    func login() {
        if let user = mLoginView.getUserInfo() {
            mLoginView.showProgress()
            mLoginManager.login(userInfo: user, listener: self)
        }
    }

    func failure(errormessage: String) {
        mLoginView.dismisss()
        mLoginView.showAlert(alertMsg: errormessage)
    }

    func sucess(userInfo: UserModel) {
        mLoginView.dismisss()
        UserInfoUtil.saveCurrentUserInfo(userInfo: userInfo)
        mLoginView.navToMainWeb(userInfo: userInfo)
    }
}
