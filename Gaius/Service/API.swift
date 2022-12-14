//
//  API.swift
//  Gaius
//
//  Created by Otávio Albuquerque on 14/10/22.
//

import Foundation

struct API {
    static let token: String = "menf7x6bad06mm51uhwpr8i2fjs1uf"
    static let url = URL(string: "https://api.igdb.com/v4/games")!
    static func getGamesByPopularity(limit: Int) async -> [Game] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var requestHeader = URLRequest(url: API.url)
        requestHeader.httpMethod = "POST"
        requestHeader.allHTTPHeaderFields = [
            "Client-ID": "wqi1xygsetlrubofl44v5h30rtdz2y" ,
            "Authorization": "Bearer \(API.token)",
            "Content-Type": "text/plain"
        ]
        let body = """
        fields *, cover.*, screenshots.*, genres.*, platforms.*;
        where follows != null & category = (0,1,8,9,10) & version_parent = null & first_release_date != null;
        sort follows desc;
        limit \(limit);
        """
        requestHeader.httpBody = body.data(using: .utf8, allowLossyConversion: false)
        do {
            let (data, _) = try await URLSession.shared.data(for: requestHeader)
            let gameList = try decoder.decode([Game].self, from: data)
            return gameList
        } catch {
           print(error)
            return []
        }
    }

    static func searchGamesByName(limit: Int, search: String) async -> [Game] {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var requestHeader = URLRequest(url: API.url)
        requestHeader.httpMethod = "POST"
        requestHeader.allHTTPHeaderFields = [
            "Client-ID": "wqi1xygsetlrubofl44v5h30rtdz2y" ,
            "Authorization": "Bearer \(API.token)",
            "Content-Type": "text/plain"
        ]
        let body = """
        fields *, cover.*, screenshots.*, genres.*, platforms.*;
        where name ~ *"\(search)"* & category = (0,1,8,9,10) & version_parent = null
        & first_release_date != null & follows != null & genres != null & platforms != null;
        sort follows desc;
        limit \(limit);
        """
        requestHeader.httpBody = body.data(using: .utf8, allowLossyConversion: false)
        do {
            let (data, _) = try await URLSession.shared.data(for: requestHeader)
            let gameList = try decoder.decode([Game].self, from: data)
            return gameList
        } catch {
           print(error)
            return []
        }
    }

    static func searchSimilarGamesByGenres(limit: Int, game: Game) async -> [Game] {

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var requestHeader = URLRequest(url: API.url)
        requestHeader.httpMethod = "POST"
        requestHeader.allHTTPHeaderFields = [
            "Client-ID": "wqi1xygsetlrubofl44v5h30rtdz2y" ,
            "Authorization": "Bearer \(API.token)",
            "Content-Type": "text/plain"
        ]
        let body = """
        fields *, cover.*, screenshots.*, platforms.*, genres.*;
        where genres = [\(game.genres!.map {String($0.id!)}.joined(separator: ","))]
        & category = (0,1,9,8,10) & version_parent = null & first_release_date != null & follows != null;
        sort follows desc;
        limit \(limit);
        """
        requestHeader.httpBody = body.data(using: .utf8, allowLossyConversion: false)
        do {
            let (data, _) = try await URLSession.shared.data(for: requestHeader)
            let gameList = try decoder.decode([Game].self, from: data)
            return gameList
        } catch {
           print(error)
            return []
        }
    }

}
