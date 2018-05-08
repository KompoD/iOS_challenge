//
//  BuyDetailPresenter.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import RealmSwift

class BuyDetailPresenter {
    weak var view: BuyDetailViewInput?
    var interactor: BuyDetailInteractorInput!
    var router: BuyDetailRouterInput!
}

extension BuyDetailPresenter: BuyDetailViewOutput {
    func viewIsReady() {
        view?.setupInitialState()
    }
    
    func writeToRealm(count: Int, productsRef: ThreadSafeReference<Products>) {
        interactor.writeToRealm(count: count, productsRef: productsRef)
    }
}

extension BuyDetailPresenter: BuyDetailInteractorOutput {
    func updateUI() {
        view?.updateUI()
    }
}
