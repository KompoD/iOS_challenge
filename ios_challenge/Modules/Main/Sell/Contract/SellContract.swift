//
//  SellContract.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation

protocol SellViewInput: class {
    func setupInitialState()
}

protocol SellViewOutput {
    func viewIsReady()
    func showAddScreen()
    func showProductDetail(forProduct item: Products)
    func deleteProduct(_ product: Products)
}

protocol SellInteractorInput {
    func deleteFromRealm(_ product: Products)
}
protocol SellInteractorOutput: class {}

protocol SellRouterInput {
    func presentDetail(forProduct item: Products?)
}
