//
//  BuyDetailContract.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation
import RealmSwift

protocol BuyDetailViewInput: class {
    func setupInitialState()
    func updateUI()
}

protocol BuyDetailViewOutput {
    func viewIsReady()
    func writeToRealm(count: Int, productsRef: ThreadSafeReference<Products>)
}

protocol BuyDetailInteractorInput {
    func writeToRealm(count: Int, productsRef: ThreadSafeReference<Products>)
}
protocol BuyDetailInteractorOutput: class {
    func updateUI()
}

protocol BuyDetailRouterInput {}
