//
//  SellDetailContract.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation

protocol SellDetailViewInput: class {
    func setupInitialState()
}

protocol SellDetailViewOutput {
    func viewIsReady()
    func updateProduct(_ product: Products, name: String, count: Int)
    func createProduct(name: String, count: Int)
}

protocol SellDetailInteractorInput {
    func update(product: Products, name: String, count: Int)
    func createNew(name: String, count: Int)
}
protocol SellDetailInteractorOutput: class {}

protocol SellDetailRouterInput {}
