//
//  CategoryViewController.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import UIKit

class CategoryViewController: UIViewController {
    var presenter: ViewToPresenterCategoryProtocol?
    @IBOutlet weak var categoryTableView: UITableView!
    
    var categoryArrayList = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupCategoryTableView()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.preservesSuperviewLayoutMargins = true
        navigationItem.title = "News Category"
    }
    
    func setupCategoryTableView() {
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
    }

}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryViewCell", for: indexPath)
        cell.textLabel?.text = categoryArrayList[indexPath.row].capitalized
        return cell
    }
    
    
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.startNavigateToSource(navigationController: navigationController!, category: categoryArrayList[indexPath.row])
    }
}

extension CategoryViewController: PresenterToViewCategoryProtocol {
    
}
