//
//  RecommendedGameCollectionView.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 11/10/22.
//

import UIKit

class GameCollectionView: UICollectionView {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        self.register(GamesCollectionViewCell.self, forCellWithReuseIdentifier: GamesCollectionViewCell.CellID)
    }

    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

}
