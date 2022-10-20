//
//  SingleGameViewController.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 17/10/22.
//

import UIKit

class SingleGameViewController: UIViewController {
    var game: Game
    var contentView: SingleGameView
    init(game: Game) {
        self.game = game
        self.contentView = SingleGameView(frame: CGRect.zero, game: game)
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let scrollView = UIScrollView()

    override func viewDidLoad() {

        super.viewDidLoad()
        setupView()
        scrollView.alwaysBounceVertical = true
        scrollView.isPagingEnabled = false
        scrollView.isScrollEnabled = true
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
}
