//
//  DetailHeader+PersonDetail.swift
//  TMDbCore
//
//  Created by Fernando Frances on 02/02/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation
extension DetailHeader {
    init(person: PersonDetail, dateFormatter: DateFormatter) {
        title = person.name
        posterPath = person.profilePath
        backdropPath = person.taggedImages.results
            .filter { $0.aspectRatio > 1.7 }
            .map { $0.path }
            .first
        
        let birthdate = person.birthdate.flatMap { dateFormatter.date(from: $0)}
        let year = (birthdate?.year).map { String($0) } ?? " "
        let month = (birthdate?.month).map { String($0)} ?? " "
        let day  = (birthdate?.day).map {String($0)} ?? " "
        
        metadata = "\(day)/\(month)/\(year)"
    }
}
