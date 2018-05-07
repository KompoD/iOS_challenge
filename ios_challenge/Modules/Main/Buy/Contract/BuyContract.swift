//
//  BuyContract.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation

protocol BuyViewInput: class {
    func setupInitialState()
}

protocol BuyViewOutput {
    func viewIsReady()
    func showProductDetail(forProduct item: Products)
}

protocol BuyInteractorInput {}
protocol BuyInteractorOutput: class {}

protocol BuyRouterInput {
    func presentDetail(forProduct item: Products)
}
