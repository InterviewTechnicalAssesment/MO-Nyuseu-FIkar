//
//  ArticleViewController.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import UIKit
import SDWebImage

class ArticleViewController: UIViewController {
    var presenter: ViewToPresenterArticleProtocol?
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var ArticleCollectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    var searchQuery: String = ""
    var timer: Timer?
    
    var source: Source?
    var articleArrayList: [Article] = []
    var page = 1
    var fetchingMore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.startAnimating()
        presenter?.startFetchingArticleBySource(source: source!, query: searchQuery, page: page)

        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupCollectionView()
    }
    
    func setupNavigationBar() {
        searchController.searchBar.delegate = self
        navigationItem.title = "Article - \(source!.name)"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupCollectionView() {
        ArticleCollectionView.delegate = self
        ArticleCollectionView.dataSource = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        print(offsetY, contentHeight, scrollView.frame.height)
        print(offsetY > contentHeight - scrollView.frame.height)
        if offsetY > contentHeight - scrollView.frame.height {
            if(!fetchingMore) {
                timer?.invalidate()
                timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(fetchMoreArticle), userInfo: nil, repeats: false)
            }
        }
    }
    
    @objc func fetchMoreArticle() {
        fetchingMore = true
        page += 1
        print("fetching page \(page)...")
        presenter?.startFetchingArticleBySource(source: source!, query: searchQuery, page: page)
    }

}

extension ArticleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchQuery = searchText
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(callPresenterToSearch), userInfo: nil, repeats: false)
    }
    
    @objc func callPresenterToSearch() {
        print(searchQuery)
        page = 1
        articleArrayList = []
        presenter?.startFetchingArticleBySource(source: source!, query: searchQuery, page: page)
    }
}

extension ArticleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let articleUrl = articleArrayList[indexPath.row].url {
            presenter?.startNavigateToWebviewArticle(navigationController: navigationController!, url: articleUrl)
        } else {
            let alert = UIAlertController(title: "URL is missing", message: "The api provided not return the URL", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension ArticleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(articleArrayList.count)
        return articleArrayList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ArticleCollectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as! ArticleCollectionViewCell
        if let imageArticle = articleArrayList[indexPath.row].urlToImage {
            cell.articleImage.sd_setImage(with: URL(string: imageArticle))
        }
        else {
            cell.articleImage.isHidden = !cell.articleImage.isHidden
        }
        cell.articleTitle.text = articleArrayList[indexPath.row].title
        cell.articleDescription.text = articleArrayList[indexPath.row].description
        return cell
    }
    
    
}

extension ArticleViewController: PresenterToViewArticleProtocol {
    func showArticles(articles: [Article]) {
        articles.forEach { (article) in
            articleArrayList.append(article)
        }
        print("fetched", articleArrayList)
        ArticleCollectionView.reloadData()
        loadingIndicator.stopAnimating()
        guard page==1 else {
            return fetchingMore = false
        }
    }
}

class ArticleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
