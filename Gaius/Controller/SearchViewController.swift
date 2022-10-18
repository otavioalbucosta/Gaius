//
//  SearchViewController.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 13/10/22.
//

import UIKit

class SearchViewController: UISearchController {

    var game: Game?

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.placeholder = "Search games"
        searchBar.searchBarStyle = .minimal
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
