//
//  MovieVM.swift
//  MVVM-002
//
//  Created by omrobbie on 05/08/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

class MovieVM: NSObject {

    var movies = [MovieEntry]()

    var count: Int {
        return movies.count
    }

    func fetchMovies(completion: @escaping () -> ()) {
        NetworkManager.shared.fetchMovies { (data) in
            self.movies = data
            completion()
        }
    }

    func labelAtRow(indexPath: IndexPath) -> String {
        movies[indexPath.row].name.label
    }
}
