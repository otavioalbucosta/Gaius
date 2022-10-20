//
//  CollectionCollectionViewView.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 18/10/22.
//

import UIKit

class CollectionCollectionViewView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let game: Game
    var genreSource = [Genre]()
    var platformSource = [Platforms]()
    var similarGamesSource = [Game]()

    lazy var genreCollectionView: TagCollectionView = {
        let collectionView = TagCollectionView()
        collectionView.isScrollEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isUserInteractionEnabled = true
        collectionView.alwaysBounceHorizontal = true
        return collectionView
    }()

    lazy var genreCollectionStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 10
        let label = UILabel()
        label.text = "Genre"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = UIColor(named: "LabelColor")
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(genreCollectionView)
        stack.backgroundColor = .clear

        return stack
    }()

    lazy var platformsCollectionView: TagCollectionView = {
        let collectionView = TagCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isUserInteractionEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceHorizontal = true
        return collectionView
    }()

    lazy var platformsCollectionStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 10
        let label = UILabel()
        label.text = "Platforms"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = UIColor(named: "LabelColor")
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(platformsCollectionView)
        return stack
    }()
    
    lazy var recommendedGamesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collecView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collecView.register(GamesCollectionViewCell.self, forCellWithReuseIdentifier: "Recommended")
        collecView.translatesAutoresizingMaskIntoConstraints = false
        return collecView
    }()
    
    lazy var recommendedGamesCollectionViewStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 10
        let label = UILabel()
        label.text = "Similar Games"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = UIColor(named: "LabelColor")
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(recommendedGamesCollectionView)
        return stack
    }()

    init(frame: CGRect, game: Game) {
        self.game = game
        super.init(frame: frame)
        addSubview(genreCollectionStack)
        addSubview(platformsCollectionStack)
        addSubview(recommendedGamesCollectionViewStack)
        self.genreSource = game.genres ?? []
        self.platformSource = game.platforms ?? []
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self
        platformsCollectionView.delegate = self
        platformsCollectionView.dataSource = self
        recommendedGamesCollectionView.dataSource = self
        recommendedGamesCollectionView.delegate = self
        setupViews()
        self.genreCollectionView.reloadData()
        self.platformsCollectionView.reloadData()
        Task {
            let res = await API.searchSimilarGamesByGenres(limit: 10, token: "menf7x6bad06mm51uhwpr8i2fjs1uf", game: game)
            self.similarGamesSource = res
            recommendedGamesCollectionView.reloadData()
        }

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        NSLayoutConstraint.activate([
            genreCollectionStack.topAnchor.constraint(equalTo: self.topAnchor),
            genreCollectionStack.leftAnchor.constraint(equalTo: self.leftAnchor),
            genreCollectionStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            platformsCollectionStack.topAnchor.constraint(equalTo: genreCollectionStack.bottomAnchor),
//            platformsCollectionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            platformsCollectionStack.leftAnchor.constraint(equalTo: self.leftAnchor),
            platformsCollectionStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            recommendedGamesCollectionViewStack.topAnchor.constraint(equalTo: platformsCollectionStack.bottomAnchor),
            recommendedGamesCollectionViewStack.leftAnchor.constraint(equalTo: self.leftAnchor),
            recommendedGamesCollectionViewStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            recommendedGamesCollectionViewStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            genreCollectionView.heightAnchor.constraint(equalToConstant: 30),
            genreCollectionView.widthAnchor.constraint(equalTo: widthAnchor),
            platformsCollectionView.heightAnchor.constraint(equalToConstant: 30),
            platformsCollectionView.widthAnchor.constraint(equalTo: widthAnchor),
            recommendedGamesCollectionView.heightAnchor.constraint(equalToConstant: 250),
            recommendedGamesCollectionView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == genreCollectionView {
            print(genreSource.count)
            return genreSource.count
        } else if collectionView == platformsCollectionView{
            print(platformSource)
            return platformSource.count
        } else {
            return similarGamesSource.count
        }
    }

    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == genreCollectionView {
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TagCollectionViewCell.id, for: indexPath) as? TagCollectionViewCell {
                cell.label.text = genreSource[indexPath.row].name
                return cell
            }
        } else if collectionView == platformsCollectionView {
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TagCollectionViewCell.id, for: indexPath) as? TagCollectionViewCell {
                cell.label.text = platformSource[indexPath.row].name
                return cell
            }
        }
        else if collectionView == recommendedGamesCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Recommended", for: indexPath) as? GamesCollectionViewCell {
                if var url = similarGamesSource[indexPath.row].cover?.url{
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



}
