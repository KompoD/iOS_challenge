//
//  BuyPresenter.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

class BuyPresenter {
    weak var view: BuyViewInput?
    var interactor: BuyInteractorInput!
    var router: BuyRouterInput!
}

extension BuyPresenter: BuyViewOutput {
    func viewIsReady() {
        view?.setupInitialState()
    }
    
    func showProductDetail(forProduct item: Products) {
        router.presentDetail(forProduct: item)
    }
}

extension BuyPresenter: BuyInteractorOutput {}
