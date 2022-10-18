//
//  CollectionCollectionViewView.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 18/10/22.
//

import UIKit

class CollectionCollectionViewView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {

    let game: Game

    lazy var genreCollectionView: TagCollectionView = {
        let collectionView = TagCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
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
        return stack
    }()

    lazy var platformsCollectionView: TagCollectionView = {
        let collectionView = TagCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
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

    init(frame: CGRect,game: Game) {
        self.game = game
        super.init(frame: frame)
        addSubview(genreCollectionStack)
        addSubview(platformsCollectionStack)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        NSLayoutConstraint.activate([
            genreCollectionStack.topAnchor.constraint(equalTo: self.topAnchor),
            genreCollectionStack.bottomAnchor.constraint(equalTo: genreCollectionStack.bottomAnchor),
            platformsCollectionStack.topAnchor.constraint(equalTo: genreCollectionStack.bottomAnchor),
            platformsCollectionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == genreCollectionView {
            return game.genres.count
        } else {
            return game.platforms.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("OIIIII1")
        if collectionView == genreCollectionView {
            print("OIIII2")
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.id, for: indexPath) as? TagCollectionViewCell {
                cell.label.text = game.genres[indexPath.row].name
                return cell
            }
        } else if collectionView == platformsCollectionView{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.id, for: indexPath) as? TagCollectionViewCell {
                cell.label.text = game.platforms[indexPath.row].name
                return cell
            }
        }
//        else {
//            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GamesCollectionViewCell.CellID, for: indexPath) as? GamesCollectionViewCell {
//                if var url = game?.similarGames?[indexPath.row].cover?.url {
//                    url = "https:" + url
//                    url = url.replacingOccurrences(of: "thumb", with: "720p")
//                    cell.gameCover = url
//                    return cell
//                }
//
//            }
//        }
        let cell = UICollectionViewCell()
        cell.backgroundColor = .red
        return cell
    }

}
