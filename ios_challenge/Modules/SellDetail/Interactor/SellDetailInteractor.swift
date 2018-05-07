//
//  SellDetailInteractor.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import RealmSwift

class SellDetailInteractor {
    weak var output: SellDetailInteractorOutput?
    let realm = try! Realm()
}

extension SellDetailInteractor: SellDetailInteractorInput {
    func update(product: Products, name: String, count: Int) {
        try! self.realm.write {
            product.name = name
            product.count = count
        }
    }
    
    func createNew(name: String, count: Int) {
        let productItem = Products()
        productItem.name = name
        productItem.count = count
        
        try! self.realm.write {
            self.realm.add(productItem)
        }
    }
}
