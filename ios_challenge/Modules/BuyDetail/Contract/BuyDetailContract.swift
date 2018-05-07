//
//  BuyDetailContract.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation

protocol BuyDetailViewInput: class {
    func setupInitialState()
}

protocol BuyDetailViewOutput {
    func viewIsReady()
}

protocol BuyDetailInteractorInput {}
protocol BuyDetailInteractorOutput: class {}

protocol BuyDetailRouterInput {}
