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
        print(url)
        print(UIApplication.shared.canOpenURL(URL(string: url)!))
        if (UIApplication.shared.canOpenURL(URL(string: url)!)) {
            WebKitArticle.load(URLRequest(url: URL(string: url)!))
        }
        else {
            let alert = UIAlertController(title: .none, message: "URL not valid", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        // Do any additional setup after loading the view.
    }
    
}

extension WebviewArticleViewController: PresenterToViewWebviewProtocol {
    func showArticlePage(url: String) {
        
    }
    
    
}
