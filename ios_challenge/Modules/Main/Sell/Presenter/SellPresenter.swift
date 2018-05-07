//
//  SellPresenter.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

class SellPresenter {
    weak var view: SellViewInput?
    var interactor: SellInteractorInput!
    var router: SellRouterInput!
}

extension SellPresenter: SellViewOutput {
    func viewIsReady() {
        view?.setupInitialState()
    }
    
    func showAddScreen() {
        router.presentDetail(forProduct: nil)
    }
    
    func showProductDetail(forProduct item: Products) {
        router.presentDetail(forProduct: item)
    }
    
    func deleteProduct(_ product: Products) {
        interactor.deleteFromRealm(product)
    }
}

extension SellPresenter: SellInteractorOutput {}
