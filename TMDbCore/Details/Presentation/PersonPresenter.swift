//
//  PersonPresenter.swift
//  TMDbCore
//
//  Created by Fernando Frances on 02/02/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class PersonPresenter: DetailPresenter {
    private let repository:  PersonRepositoryProtocol
    
    private let dateFormatter: DateFormatter
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    weak var view: DetailView?
    
    init(repository: PersonRepositoryProtocol,
         identifier: Int64,
         dateFormatter: DateFormatter) {
        self.repository = repository
        self.identifier = identifier
        self.dateFormatter = dateFormatter
    }
    
    func didLoad() {
        view?.setLoading(true)
        repository.person(withIdentifier: identifier)
            .map { [weak self] person in
                self?.detailSections(for: person) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
            },onDisposed: { [weak self] in
                self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
    
    func didSelect(item: PosterStripItem) {
    }
    
    private func detailSections(for person: PersonDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [.header(DetailHeader(person: person, dateFormatter:dateFormatter))]
        if let biography = person.biography {
            detailSections.append(.about(title: "Biography", detail: biography))
        }
        
        let items = person.credits?.cast.map { PosterStripItem(film: $0) }
        
        if let items = items {
            detailSections.append(.posterStrip(title: "Filmography", items: items))
        }
        
        return detailSections
    }


}
















