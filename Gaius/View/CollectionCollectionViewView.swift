//
//  CollectionCollectionViewView.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 18/10/22.
//

import UIKit

class CollectionCollectionViewView: UIView, UICollectionViewDelegateFlowLayout {

    let game: Game

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
//        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.estimatedItemSize = CGSize(width: 120, height: 160)
        let collecView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collecView.register(GamesCollectionViewCell.self, forCellWithReuseIdentifier: GamesCollectionViewCell.CellID)
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
        setupViews()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        NSLayoutConstraint.activate([
            genreCollectionStack.topAnchor.constraint(equalTo: self.topAnchor),
            genreCollectionStack.leftAnchor.constraint(equalTo: self.leftAnchor),
            genreCollectionStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            platformsCollectionStack.topAnchor.constraint(equalTo: genreCollectionStack.bottomAnchor, constant: 5),
            platformsCollectionStack.leftAnchor.constraint(equalTo: self.leftAnchor),
            platformsCollectionStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            recommendedGamesCollectionViewStack.topAnchor.constraint(
                equalTo: platformsCollectionStack.bottomAnchor, constant: 5),
            recommendedGamesCollectionViewStack.leftAnchor.constraint(equalTo: self.leftAnchor),
            recommendedGamesCollectionViewStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            recommendedGamesCollectionViewStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            genreCollectionView.heightAnchor.constraint(equalToConstant: 30),
            genreCollectionView.widthAnchor.constraint(equalTo: widthAnchor),
            platformsCollectionView.heightAnchor.constraint(equalToConstant: 30),
            platformsCollectionView.widthAnchor.constraint(equalTo: widthAnchor),
            recommendedGamesCollectionView.heightAnchor.constraint(equalToConstant: 200),
            recommendedGamesCollectionView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }

}
