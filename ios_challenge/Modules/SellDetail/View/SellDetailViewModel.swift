//
//  SellDetailViewModel.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 06.05.2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import RxSwift
import RxCocoa

class SellDetailViewModel {
    let disposeBag = DisposeBag()
    
    let validatedName: Observable<Bool>
    let validatedCount: Observable<Bool>
    
    // Is save button enabled
    let buttonEnabled: Observable<Bool>
    
    init(input: (
        productName: Observable<String>,
        productCount: Observable<String>
        )
        ) {
        validatedName = input.productName
            .map { productName in
                return Validation.validateName(productName)
            }
            .share(replay: 1)
        
        validatedCount = input.productCount
            .map { productCount in
                return Validation.validateCount(productCount)
            }
            .share(replay: 1)
        
        buttonEnabled = Observable
            .combineLatest(validatedName, validatedCount) {$0 && $1}
            .distinctUntilChanged()
            .share(replay: 1)
    }
}
