//
//  SingleGameView.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 17/10/22.
//

import UIKit

class SingleGameView: UIView {

    var game: Game
    var rating: Int = 50 {
        didSet {
            if rating >= 70 {
                criticRatings.backgroundColor = .green
                ratingUILabel.textColor = .green
            } else if rating > 40 && rating < 70 {
                criticRatings.backgroundColor = .systemYellow

            } else {
                criticRatings.backgroundColor = .red

            }
        }
    }

    var ratingLabel: String {
        if rating >= 70 {
            ratingUILabel.textColor = .green
            return "Great"

        } else if rating < 40 && rating > 70 {
            ratingUILabel.textColor = .yellow
            return "Good"

        } else {
            ratingUILabel.textColor = .red
            return "Bad" }
    }

    lazy var gameCover: UIImageView = {
        let gameCover = UIImageView()
        Task {
            await gameCover.load(URL: URL(string: "https://images.igdb.com/igdb/image/upload/t_720p/co2ous.jpg")!)
        }
        gameCover.layer.cornerRadius = 10
        gameCover.layer.masksToBounds = true
        gameCover.translatesAutoresizingMaskIntoConstraints = false
        return gameCover
    }()

    lazy var gameTitle: UILabel = {
        let gameTitle = UILabel()
        gameTitle.translatesAutoresizingMaskIntoConstraints = false
        gameTitle.text = "Persona 5 Royal"
        gameTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        gameTitle.textAlignment = .center
        gameTitle.numberOfLines = 2
        gameTitle.lineBreakMode = .byWordWrapping
        gameTitle.textColor = .white
        return gameTitle
    }()

    lazy var favoriteButtom: UIButton = {
        let favoriteButtom = UIButton()
        favoriteButtom.translatesAutoresizingMaskIntoConstraints = false
        favoriteButtom.backgroundColor = .systemGreen
        favoriteButtom.setTitle("Add Favorite", for: .normal)
        favoriteButtom.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButtom.setTitleColor(.black, for: .normal)
        favoriteButtom.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        favoriteButtom.layer.cornerRadius = 10
        return favoriteButtom
    }()

    lazy var screenshot: UIImageView = {
        let screenshot = UIImageView()
        screenshot.translatesAutoresizingMaskIntoConstraints = false
        let blur = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = screenshot.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        screenshot.addSubview(blurView)
        return screenshot
    }()

    lazy var criticRatings: UILabel = {
        let criticRatings = UILabel()
        criticRatings.text = "98"
        criticRatings.textAlignment = .center
        criticRatings.textColor = .white
        criticRatings.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        criticRatings.translatesAutoresizingMaskIntoConstraints = false
        criticRatings.layer.cornerRadius = 8
        criticRatings.layer.masksToBounds = true
        return criticRatings
    }()

    lazy var ratingStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 5
        let label = UILabel()
        label.text = "Rating"
        stack.addArrangedSubview(label)
        return stack

    }()

    lazy var ratingUILabel: UILabel = {
        let ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        return ratingLabel
    }()

    lazy var collectionView: CollectionCollectionViewView = {
        let collecView = CollectionCollectionViewView(frame: CGRect.zero,game: self.game)
        collecView.translatesAutoresizingMaskIntoConstraints = false
        return collecView
    }()

     init(frame: CGRect, game: Game) {
        self.game = game
        super.init(frame: frame)
        addSubview(screenshot)
        addSubview(gameCover)
        addSubview(gameTitle)
        addSubview(favoriteButtom)
        addSubview(ratingStack)
        addSubview(collectionView)
        addStackSubviews()
        setupImages()
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addStackSubviews() {

        ratingStack.addArrangedSubview(criticRatings)
        rating = 50
        criticRatings.text = String(rating)
        ratingUILabel.text = ratingLabel
        ratingStack.addArrangedSubview(ratingUILabel)

    }

    func setupImages() {
        if let cover = self.game.cover?.url {
            var finalUrl = "https:" + cover
            finalUrl = finalUrl.replacingOccurrences(of: "thumb", with: "720p")
            Task {
                await self.gameCover.load(URL: URL(string: finalUrl)!)
            }

        } else {
            self.gameCover.image = UIImage(named: "cover")
        }

        if game.screenshots != nil && game.screenshots?.count != 0 {
            let scrShot = game.screenshots?.randomElement()
            var finalURL = "https:" + (scrShot?.url)!
            finalURL = finalURL.replacingOccurrences(of: "thumb", with: "720p")
            Task {
                await self.screenshot.load(URL: URL(string: finalURL)!)
            }
        } else {
            self.screenshot.image = UIImage(named: "cover")
        }
    }
    func setupView() {
        NSLayoutConstraint.activate([
            screenshot.topAnchor.constraint(equalTo: self.topAnchor),
            screenshot.leftAnchor.constraint(equalTo: self.leftAnchor),
            screenshot.rightAnchor.constraint(equalTo: self.rightAnchor),
            screenshot.heightAnchor.constraint(equalToConstant: 350),

            gameCover.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            gameCover.topAnchor.constraint(equalTo: screenshot.bottomAnchor, constant: -160),
            gameCover.widthAnchor.constraint(equalToConstant: 160),
            gameCover.heightAnchor.constraint(equalToConstant: 200),

            gameTitle.bottomAnchor.constraint(equalTo: gameCover.topAnchor, constant: -20),
            gameTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            gameTitle.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),

            ratingStack.topAnchor.constraint(equalTo: screenshot.bottomAnchor, constant: 30),
            ratingStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            ratingStack.bottomAnchor.constraint(equalTo: ratingStack.bottomAnchor),

            favoriteButtom.topAnchor.constraint(equalTo: gameCover.bottomAnchor, constant: 14),
            favoriteButtom.leftAnchor.constraint(equalTo: gameCover.leftAnchor),
            favoriteButtom.rightAnchor.constraint(equalTo: gameCover.rightAnchor),
            favoriteButtom.bottomAnchor.constraint(equalTo: favoriteButtom.bottomAnchor),
            favoriteButtom.heightAnchor.constraint(equalToConstant: 35),
            
            
            collectionView.topAnchor.constraint(equalTo: ratingStack.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor)
//            genreCollectionStack.topAnchor.constraint(equalTo: ratingStack.bottomAnchor, constant: 10),
//            genreCollectionStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
//            genreCollectionStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
//            genreCollectionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }

}
