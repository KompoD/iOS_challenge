//
//  SellDetailPresenter.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

class SellDetailPresenter {
    weak var view: SellDetailViewInput?
    var interactor: SellDetailInteractorInput!
    var router: SellDetailRouterInput!
}

extension SellDetailPresenter: SellDetailViewOutput {
    func viewIsReady() {
        view?.setupInitialState()
    }
    
    func updateProduct(_ product: Products, name: String, count: Int) {
        interactor.update(product: product, name: name, count: count)
    }
    
    func createProduct(name: String, count: Int) {
        interactor.createNew(name: name, count: count)
    }
}

extension SellDetailPresenter: SellDetailInteractorOutput {}
