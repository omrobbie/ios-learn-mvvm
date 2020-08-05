//
//  NetworkManager.swift
//  MVVM-002
//
//  Created by omrobbie on 05/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {

    static let shared = NetworkManager()

    private let BASE_URL = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"

    func fetchMovies(completion: @escaping ([MovieEntry]) -> ()) {
        guard let url = URL(string: BASE_URL) else {return}

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}

            do {
                let decodeData = try JSONDecoder().decode(Movie.self, from: data)
                DispatchQueue.main.async {
                    completion(decodeData.feed.entry)
                }
            } catch {
                print("Error", error.localizedDescription)
            }
        }.resume()
    }
}
