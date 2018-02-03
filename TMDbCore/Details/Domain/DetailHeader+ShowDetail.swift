//
//  DetailHeader+ShowDetail.swift
//  TMDbCore
//
//  Created by Fernando Frances on 02/02/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(show: ShowDetail, dateFormatter: DateFormatter) {
        title = show.name
        posterPath = show.posterPath
        backdropPath = show.backdropPath
        
        let releaseDate = dateFormatter.date(from: show.releaseDate)
        let year = (releaseDate?.year).map { String($0) }
        
        metadata = year!
    }
}
