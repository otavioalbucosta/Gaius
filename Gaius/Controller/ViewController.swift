//
//  ViewController.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 11/10/22.
//

import UIKit

// ChildViewController

class ViewController: UIViewController, UISearchResultsUpdating, UICollectionViewDataSource, UICollectionViewDelegate {

    let searchBar = SearchViewController()
    let gameCollection = GameCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Gaming search"
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
        view.addSubview(gameCollection)
        gameCollection.dataSource = self
        gameCollection.delegate = self
        setupView()
        gameCollection.reloadData()
        // Do any additional setup after loading the view.

    }
    func setupView() {
        gameCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            gameCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            gameCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            gameCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if let cell = gameCollection.dequeueReusableCell(
            withReuseIdentifier: GamesCollectionViewCell.CellID,
            for: indexPath
        ) as? GamesCollectionViewCell {
            cell.backgroundColor = .black
            cell.title.text = "ALOALOALOALOALOALOALOA"
            return cell
        }
        let cell = UICollectionViewCell()
        cell.backgroundColor = .black
        return cell
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else {
            return
        }

    }

}
