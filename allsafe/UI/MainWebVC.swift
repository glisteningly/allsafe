import UIKit

class MainWebVC: UIViewController {
//    var WebURL: String?

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let userInfo = UserInfoUtil.getCurrentUserInfo() {
            let str = "\(userInfo.username):\(userInfo.password)"
            let utf8str = str.data(using: String.Encoding.utf8)
            let base64Encoded = utf8str?.base64EncodedString()
            let url = "http://\(userInfo.server)?authkey=\(base64Encoded!)"

            print(url)

            loadWebContent(url: url)
        }
    }

    func loadWebContent(url: String) {
        let request = URLRequest(url: URL(string: url)!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
