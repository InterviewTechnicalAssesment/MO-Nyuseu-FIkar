//
//  CategoryViewController.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import UIKit

class CategoryViewController: UIViewController {
    var presenter: ViewToPresenterCategoryProtocol?
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categoryArrayList: [Category] = [
        Category(name: "business", image: #imageLiteral(resourceName: "business"), nameColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)),
        Category(name: "entertainment", image: #imageLiteral(resourceName: "entertainment"), nameColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)),
        Category(name: "general", image: #imageLiteral(resourceName: "general"), nameColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Category(name: "health", image: #imageLiteral(resourceName: "health"), nameColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Category(name: "science", image: #imageLiteral(resourceName: "science"), nameColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        Category(name: "sports", image: #imageLiteral(resourceName: "sports"), nameColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        Category(name: "technology", image: #imageLiteral(resourceName: "technology"), nameColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupCategoryCollectionView()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.preservesSuperviewLayoutMargins = true
        navigationItem.title = "News Category"
    }
    
    func setupCategoryCollectionView(){
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
    }

}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArrayList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryName.text = categoryArrayList[indexPath.row].name.capitalized
        cell.categoryName.textColor = categoryArrayList[indexPath.row].nameColor
        cell.categoryImage.image = categoryArrayList[indexPath.row].image
        return cell
    }
    
    
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.startNavigateToSource(navigationController: navigationController!, category: categoryArrayList[indexPath.row].name)
    }
}

extension CategoryViewController: PresenterToViewCategoryProtocol {
    
}

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImage.layer.cornerRadius = 20
    }
}
