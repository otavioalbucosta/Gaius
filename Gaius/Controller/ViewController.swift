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
    var source = [Game]()
    var searchSource = [Game]()
    
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
        Task {
            let res = await API.getGamesByPopularity(limit: 50, token: "menf7x6bad06mm51uhwpr8i2fjs1uf")
            self.source = res
            gameCollection.reloadData()
            //            print(res)
        }
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
        return source.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = gameCollection.dequeueReusableCell(
                withReuseIdentifier: GamesCollectionViewCell.CellID,
                for: indexPath
            ) as? GamesCollectionViewCell {
                cell.backgroundColor = .black
                if let cover = source[indexPath.row].cover?.url {
                    let finalUrl = "https:" + cover
                    cell.gameCover = finalUrl.replacingOccurrences(of: "thumb", with: "720p")
                } else {
                    cell.coverImage.image = UIImage(named: "cover")
                }
                if let name = source[indexPath.row].name {
                    cell.title.text = name
                }
                
                if let timestamp = source[indexPath.row].firstReleaseDate {
                    let date = Date(timeIntervalSince1970: Double(timestamp)).formatted()
                    cell.age.text = date
                } else {
                    cell.age.text = "To Be Released"
                }
                
                return cell
            }
            let cell = UICollectionViewCell()
            cell.backgroundColor = .black
            return cell
        }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else {
            Task{
                let res = await API.getGamesByPopularity(limit: 50, token: "menf7x6bad06mm51uhwpr8i2fjs1uf")
            }
            return
        }
        Task {
            let res = await API.searchGamesByName(limit: 10,
                                                  token: "menf7x6bad06mm51uhwpr8i2fjs1uf", search: query)
            source = res
            print(res)
            self.gameCollection.reloadData()
            DispatchQueue.main.async {
                
            }
        }
    }
    
}
