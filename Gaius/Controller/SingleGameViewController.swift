//
//  SingleGameViewController.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 17/10/22.
//

import UIKit

class SingleGameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var game: Game
    var contentView: SingleGameView
    var genreSource = [Genre]()
    var platformSource = [Platforms]()
    var similarGamesSource = [Game]()

    init(game: Game) {
        self.game = game
        self.contentView = SingleGameView(frame: CGRect.zero, game: game)
        self.genreSource = game.genres ?? []
        self.platformSource = game.platforms ?? []

        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        contentView.collectionView.genreCollectionView.dataSource = self
        contentView.collectionView.genreCollectionView.delegate = self
        contentView.collectionView.platformsCollectionView.delegate = self
        contentView.collectionView.platformsCollectionView.dataSource = self
        contentView.collectionView.recommendedGamesCollectionView.dataSource = self
        contentView.collectionView.recommendedGamesCollectionView.delegate = self
        scrollView.alwaysBounceVertical = true
        scrollView.isPagingEnabled = false
        scrollView.isScrollEnabled = true
        contentView.collectionView.genreCollectionView.reloadData()
        contentView.collectionView.platformsCollectionView.reloadData()

        Task {
            let res = await API.searchSimilarGamesByGenres(limit: 10, game: game)
            similarGamesSource = res
            contentView.collectionView.recommendedGamesCollectionView.reloadData()
        }

        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isTranslucent = true
        // Do any additional setup after loading the view.
    }
    func setupView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)

        ])
    }
    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == contentView.collectionView.genreCollectionView {
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TagCollectionViewCell.id, for: indexPath) as? TagCollectionViewCell {
                cell.label.text = genreSource[indexPath.row].name
                return cell
            }
            } else if collectionView == contentView.collectionView.platformsCollectionView {
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TagCollectionViewCell.id, for: indexPath) as? TagCollectionViewCell {
                cell.label.text = platformSource[indexPath.row].name
                return cell
            }
        } else if collectionView == contentView.collectionView.recommendedGamesCollectionView {
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GamesCollectionViewCell.CellID, for: indexPath) as? GamesCollectionViewCell {
                if var url = similarGamesSource[indexPath.row].cover?.url {
                    cell.isOnSearch = false
                    url = "https:" + url
                    url = url.replacingOccurrences(of: "thumb", with: "720p")
                    cell.gameCover = url

                    return cell
                }

            }
        }
        let cell = UICollectionViewCell()
        cell.backgroundColor = .red
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == contentView.collectionView.recommendedGamesCollectionView {
            let singleGameVC = SingleGameViewController(game: similarGamesSource[indexPath.row])
            self.show(singleGameVC, sender: self)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.collectionView.genreCollectionView {
            return genreSource.count
        } else if collectionView == contentView.collectionView.platformsCollectionView {
            return platformSource.count
        } else {
            return similarGamesSource.count
        }
    }
}
