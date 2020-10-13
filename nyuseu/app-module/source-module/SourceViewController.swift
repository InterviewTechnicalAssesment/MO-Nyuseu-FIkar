//
//  SourceViewController.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import UIKit

class SourceViewController: UIViewController {
    var presenter: ViewToPresenterSourceProtocol?
    @IBOutlet weak var SourceTableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
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
        navigationItem.title = "Source News - \(category.capitalized)"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupTableView() {
        SourceTableView.delegate = self
        SourceTableView.dataSource = self
    }

}

extension SourceViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredSourceArrayList = sourceArrayList
        } else {
            filteredSourceArrayList = sourceArrayList.filter {
                $0.name.contains(searchText)
            }
        }
        SourceTableView.reloadData()
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

extension SourceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.startNavigateToArticle(navigationController: navigationController!, source: filteredSourceArrayList[indexPath.row])
    }
}

extension SourceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSourceArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SourceTableView.dequeueReusableCell(withIdentifier: "SourceCell", for: indexPath)
        cell.textLabel?.text = filteredSourceArrayList[indexPath.row].name
        return cell
    }
    
    
}
