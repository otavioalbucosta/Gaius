//
//  CollectionViewCell.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 11/10/22.
//

import UIKit
import Foundation

class GamesCollectionViewCell: UICollectionViewCell {
    static let CellID = "GamesCellID"
    var isOnSearch: Bool = true {
        didSet {
            setupViews()
        }
    }

    var gameCover: String? {

        didSet {
            Task {
                await self.coverImage.load(URL: URL(string: gameCover!)!)
            }
        }

    }

    let coverImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        //        image.image = UIImage(named: "cover")
        return image
    }()

    let title: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.numberOfLines = 3
        text.lineBreakMode = .byWordWrapping
        text.textAlignment = .center
        text.textColor = UIColor(named: "labelColor")
        return text
    }()
    let age: UILabel = {
        let age = UILabel()
        age.translatesAutoresizingMaskIntoConstraints = false
        age.font = UIFont.systemFont(ofSize: 15, weight: .light)
        age.textColor = UIColor(named: "labelColor")
        age.textAlignment = .center
        return age
    }()

    override init(frame: CGRect ) {
        super.init(frame: frame)
        addSubview(coverImage)

        if isOnSearch {
            addSubview(title)
            addSubview(age)

        }
        setupViews()
    }
    override func layoutSubviews() {
        backgroundColor = .systemBackground
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        if isOnSearch {
            NSLayoutConstraint.activate([
                coverImage.topAnchor.constraint(equalTo: self.topAnchor),
                coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                coverImage.trailingAnchor.constraint(equalTo: coverImage.trailingAnchor),
                coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                coverImage.widthAnchor.constraint(equalToConstant: 140),
                title.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                title.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 10),
                title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                age.topAnchor.constraint(equalTo: title.bottomAnchor),
                age.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 10),
                age.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                coverImage.topAnchor.constraint(equalTo: coverImage.topAnchor),
                coverImage.leftAnchor.constraint(equalTo: coverImage.leftAnchor),
                coverImage.rightAnchor.constraint(equalTo: coverImage.rightAnchor),
                coverImage.bottomAnchor.constraint(equalTo: coverImage.bottomAnchor),
                coverImage.widthAnchor.constraint(equalToConstant: 140),
                coverImage.heightAnchor.constraint(equalToConstant: 200)
            ])
        }
    }
}
