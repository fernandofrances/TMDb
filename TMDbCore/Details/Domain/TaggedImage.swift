//
//  TaggedImage.swift
//  TMDbCore
//
//  Created by Fernando Frances on 17/02/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct TaggedImage: Decodable {
    let path: String
    let aspectRatio: Double
    
    private enum CodingKeys: String, CodingKey {
        case path = "file_path"
        case aspectRatio = "aspect_ratio"
    }
}
