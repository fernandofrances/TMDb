//
//  Filmography.swift
//  TMDbCore
//
//  Created by Fernando Frances on 02/02/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct Filmography: Decodable {
    struct WorksIn: Decodable {
        let identifier: Int64
        let posterPath: String?
        let title: String
        let character: String
        
        private enum CodingKeys: String, CodingKey {
            case identifier = "id"
            case title
            case character
            case posterPath = "poster_path"
        }
    }
    
    let cast: [WorksIn]
}
