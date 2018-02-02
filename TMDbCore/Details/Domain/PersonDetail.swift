//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Fernando Frances on 02/02/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable{
    let identifier : Int64
    let name : String
    let profilePath : String?
    let birthdate : String?
    let biography : String?
    let credits : Filmography?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case profilePath = "profile_path"
        case birthdate = "birthday"
        case biography
        case credits = "movie_credits"
    }
}
