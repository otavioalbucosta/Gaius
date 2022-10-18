//
//  Extensions.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 18/10/22.
//

import Foundation
import UIKit

extension UIImageView {
    func load(URL: URL) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL)
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        } catch {
            print(error)
        }
    }
}
