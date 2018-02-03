//
//  ShowPresenter.swift
//  TMDbCore
//
//  Created by Fernando Frances on 02/02/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class ShowPresenter: DetailPresenter {
    private let repository: ShowRepositoryProtocol
    private let dateFormatter: DateFormatter
    private let detailNavigator: DetailNavigator
    
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    weak var view: DetailView?
    
    init(repository: ShowRepositoryProtocol,
         dateFormatter: DateFormatter,
         identifier: Int64,
         detailNavigator: DetailNavigator) {
        self.repository = repository
        self.dateFormatter = dateFormatter
        self.identifier = identifier
        self.detailNavigator = detailNavigator
    }
    
    func didLoad() {
        view?.setLoading(true)
//        repository.show(withIdentifier: identifier)
//            .map { [weak self] show in
//                self?.detailSections(for: show) ?? []
//            }
//            .observeOn(MainScheduler.instance)
//            .subscribe(onNext: { [weak self] sections in
//                self?.view?.update(with: sections)
//                }, onDisposed: { [weak self] in
//                    self?.view?.setLoading(false)
//            })
//            .disposed(by: disposeBag)
        repository.show(withIdentifier: identifier)
            .map { [weak self] show in
                self?.detailSections(for: show) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
                }, onDisposed: { [weak self] in
                    self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
    
    func didSelect(item: PosterStripItem) {
        detailNavigator.showDetail(withIdentifier: item.identifier, mediaType: .person)
    }
    
    private func detailSections(for show: ShowDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(show: show, dateFormatter: dateFormatter))
        ]
        
        detailSections.append(.about(title: "Overview", detail: show.overview))
        
        let items = show.credits?.cast.map { PosterStripItem(castMember: $0) }
        
        if let items = items {
            detailSections.append(.posterStrip(title: "Cast", items: items))
        }
        
        return detailSections
    }
}
