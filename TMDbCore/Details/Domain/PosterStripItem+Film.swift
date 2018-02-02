//
//  PosterStripItem+Film.swift
//  TMDbCore
//
//  Created by Fernando Frances on 02/02/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation
extension PosterStripItem {
    init(film: Filmography.WorksIn) {
        identifier = film.identifier
        mediaType = .movie
        title = film.title
        posterPath = film.posterPath
        metadata = film.character
    }
}
