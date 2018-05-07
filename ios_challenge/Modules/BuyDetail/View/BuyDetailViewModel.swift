//
//  BuyDetailViewModel.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 06.05.2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import RxSwift
import RxCocoa

class BuyDetailViewModel {
    let disposeBag = DisposeBag()
    
    let validatedCount: Observable<Bool>
    
    init(input: (
        currentCount: Observable<Int>,
        productCount: Observable<String>
        )
        ) {
        validatedCount = Observable
            .combineLatest(input.productCount, input.currentCount)
            .map {productCount, currentCount in
                return Validation.validateCount(productCount, availableCount: currentCount)
            }
            .share(replay: 1)
    }
}
