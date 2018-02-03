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
        posterPath = nil //show.posterPath
        backdropPath = nil //show.backdropPath
        
        let releaseDate = dateFormatter.date(from: show.releaseDate)
        //let releaseDate = show.releaseDate.flatMap { dateFormatter.date(from: $0)}
        let year = (releaseDate?.year).map { String($0) }
        let duration = "\(show.episodes) episodes."
        
        metadata = year!
    }
}
