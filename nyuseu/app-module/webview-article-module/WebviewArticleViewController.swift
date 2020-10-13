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

}

extension WebviewArticleViewController: PresenterToViewWebviewProtocol {
    func showArticlePage(url: String) {
        
    }
    
    
}
