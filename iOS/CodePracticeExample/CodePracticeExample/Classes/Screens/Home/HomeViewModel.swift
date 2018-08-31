//
//  HomeViewModel.swift
//  CodePracticeExample
//
//  Created by Yu Sun on 31/8/18.
//  Copyright © 2018 Yu Sun. All rights reserved.
//

import RxSwift

class HomeViewModel {
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Actions
    
    lazy var selectedFeature: PublishSubject<Feature> = PublishSubject()
    
    // MARK: - Observables
    
    lazy var homeTitle: Observable<String> = Observable.just("Home")

    lazy var features: Observable<[Feature]> = Observable.just(Feature.all())
    
    lazy var viewFeature: Observable<Feature> = selectedFeature.asObservable()

}
