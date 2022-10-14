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

    let isOnSearch: Bool = true

    var gameCover: String?

    let coverImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "cover")
                 if let url = URL(string: "https://images.igdb.com/igdb/image/upload/t_thumb/co2mlg.jpg"){
                     image.load(URL:url)
                 }
        return image
    }()

    let title: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.numberOfLines = 3
        text.lineBreakMode = .byWordWrapping
        text.textColor = .black
        return text
    }()
    
    let age: UILabel = {
        let age = UILabel()
        age.translatesAutoresizingMaskIntoConstraints = false
        age.font = UIFont.systemFont(ofSize: 10)
        age.textColor = .darkGray
        return age
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(coverImage)
        addSubview(title)
        if isOnSearch {
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
                coverImage.widthAnchor.constraint(equalToConstant: 120),
                title.topAnchor.constraint(equalTo: isOnSearch ?
                                           self.topAnchor : coverImage.bottomAnchor, constant: isOnSearch ? 0 : 10),
                title.leadingAnchor.constraint(equalTo: isOnSearch ?
                                               coverImage.trailingAnchor :
                                                self.leadingAnchor, constant: isOnSearch ? 10 : 0),
                title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                age.topAnchor.constraint(equalTo: title.bottomAnchor),
                age.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor),
                age.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                age.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                coverImage.topAnchor.constraint(equalTo: self.topAnchor),
                coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                coverImage.trailingAnchor.constraint(equalTo: coverImage.trailingAnchor),
                coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                coverImage.widthAnchor.constraint(equalToConstant: 120),
                title.topAnchor.constraint(equalTo: isOnSearch ?
                                           self.topAnchor : coverImage.bottomAnchor, constant: isOnSearch ? 0 : 10),
                title.leadingAnchor.constraint(equalTo: isOnSearch ?
                                               coverImage.trailingAnchor :
                                                self.leadingAnchor, constant: isOnSearch ? 10 : 0),
                title.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        }
    }

}

extension UIImageView {
    func load(URL: URL) {
        Task {
            if let data = try? Data(contentsOf: URL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
