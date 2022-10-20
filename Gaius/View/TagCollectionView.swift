//
//  TagCollectionView.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 18/10/22.
//

import UIKit

class TagCollectionView: UICollectionView {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        self.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.id)
        self.isScrollEnabled = true

    }

    private var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()

}

class TagCollectionViewCell: UICollectionViewCell {
    static let id = "TagID"

    lazy var label: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        self.layer.cornerRadius = 8
        self.backgroundColor = .systemBlue
        setupView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 6),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -6),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3)

        ])
    }
}
