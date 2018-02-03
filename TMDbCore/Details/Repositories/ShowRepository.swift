//
//  ShowRepository.swift
//  TMDbCore
//
//  Created by Fernando Frances on 02/02/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol ShowRepositoryProtocol {
    func show(withIdentifier identifier: Int64) -> Observable<ShowDetail>
}

final class ShowRepository: ShowRepositoryProtocol {
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    func show(withIdentifier identifier: Int64) -> Observable<ShowDetail> {
       return webService.load(ShowDetail.self, from: .show(identifier: identifier))
    }
}
