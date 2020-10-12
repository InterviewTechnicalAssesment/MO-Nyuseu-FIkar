//
//  WebviewArticleViewController.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 13/10/20.
//

import UIKit
import WebKit

class WebviewArticleViewController: UIViewController {
    var presenter: ViewToPresenterWebviewProtocol?
    @IBOutlet weak var WebKitArticle: WKWebView!
    
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.startLoadArticlePage(url: url)
        WebKitArticle.load(URLRequest(url: URL(string: url)!))

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WebviewArticleViewController: PresenterToViewWebviewProtocol {
    func showArticlePage(url: String) {
        print("url", url)
    }
    
    
}
