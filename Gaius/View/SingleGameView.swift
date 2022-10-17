//
//  SingleGameView.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 17/10/22.
//

import UIKit

class SingleGameView: UIView {
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

    private let gameCover: UIImageView = {
        let gameCover = UIImageView()
        Task {
           await gameCover.load(URL: URL(string: "https://images.igdb.com/igdb/image/upload/t_720p/co2ous.jpg")!)
        }
        gameCover.layer.cornerRadius = 10
        gameCover.layer.masksToBounds = true
        gameCover.translatesAutoresizingMaskIntoConstraints = false
        return gameCover
    }()

    private let gameTitle: UILabel = {
        let gameTitle = UILabel()
        gameTitle.translatesAutoresizingMaskIntoConstraints = false
        gameTitle.text = "Persona 5 Royal"
        gameTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        gameTitle.textAlignment = .center
        gameTitle.numberOfLines = 2
        gameTitle.lineBreakMode = .byWordWrapping
        gameTitle.textColor = .red
        return gameTitle
    }()

    private let favoriteButtom: UIButton = {
        let favoriteButtom = UIButton()
        favoriteButtom.translatesAutoresizingMaskIntoConstraints = false
        favoriteButtom.backgroundColor = .green
        favoriteButtom.titleLabel?.text = "Favorite"
        return favoriteButtom
    }()

    private let genreLabel: UILabel = {
        let genreLabel = UILabel()
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        return genreLabel
    }()

    private let platforms: UILabel = {
        let platforms = UILabel()
        platforms.translatesAutoresizingMaskIntoConstraints = false
        return platforms
    }()
    private let screenshot: UIImageView = {
        let screenshot = UIImageView()
        screenshot.translatesAutoresizingMaskIntoConstraints = false
        let blur = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = screenshot.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        screenshot.image = UIImage(named: "cover")
        screenshot.addSubview(blurView)
        return screenshot
    }()

    private let criticRatings: UILabel = {
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

    private let ratingStack: UIStackView = {
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
    private let ratingUILabel: UILabel = {
        let ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        return ratingLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(screenshot)
        addSubview(gameCover)
        addSubview(gameTitle)
//        addSubview(favoriteButtom)
        addSubview(genreLabel)
        addSubview(platforms)
        addSubview(ratingStack)
        addStackSubviews()
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

        ])
    }
}
