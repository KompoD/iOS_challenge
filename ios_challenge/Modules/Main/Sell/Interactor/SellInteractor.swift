//
//  SellInteractor.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import RealmSwift

class SellInteractor {
    weak var output: SellInteractorOutput?
    
    let realm = try! Realm()
}

extension SellInteractor: SellInteractorInput {
    func deleteFromRealm(_ product: Products) {
        try! realm.write {
            realm.delete(product)
        }
    }
}
