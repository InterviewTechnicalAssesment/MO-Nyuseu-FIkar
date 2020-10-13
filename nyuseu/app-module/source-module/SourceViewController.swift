//
//  SourceViewController.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import UIKit

class SourceViewController: UIViewController {
    var presenter: ViewToPresenterSourceProtocol?
    
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var SourceTableView: UITableView!
    
    var category: String = ""
    var sourceArrayList: [Source] = []
    var filteredSourceArrayList: [Source] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.startFetchingSourceByCategory(category: category)

        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        searchController.searchBar.delegate = self
        navigationItem.title = "Source - \(category.capitalized)"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.preservesSuperviewLayoutMargins = true
    }
    
    func setupTableView() {
        SourceTableView.delegate = self
        SourceTableView.dataSource = self
        SourceTableView.tableFooterView = UIView()
        SourceTableView.separatorStyle = .none
    }

}

//MARK: - SOURCE SEARCH BAR
extension SourceViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredSourceArrayList = sourceArrayList
        } else {
            filteredSourceArrayList = sourceArrayList.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        SourceTableView.reloadData()
    }
}

//MARK: - SOURCE TABLE VIEW
extension SourceViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredSourceArrayList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.startNavigateToArticle(navigationController: navigationController!, source: filteredSourceArrayList[indexPath.section])
    }

}

extension SourceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SourceTableView.dequeueReusableCell(withIdentifier: "SourceCell", for: indexPath) as! SourceTableViewCell
        cell.layer.cornerRadius = 20
        cell.sourceName.text = filteredSourceArrayList[indexPath.section].name
        cell.sourceURL.text = filteredSourceArrayList[indexPath.section].url
        return cell
    }
}

extension SourceViewController: PresenterToViewSourceProtocol {
    func failShowSources() {
        let alert = UIAlertController(title: "Error happen", message: "Failed to fetch data from server", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showSources(sources: [Source]) {
        sourceArrayList = sources
        filteredSourceArrayList = sources
        SourceTableView.reloadData()
    }
}

//MARK: - SOURCE TABLE VIEW CELL
class SourceTableViewCell: UITableViewCell {
    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var sourceURL: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

