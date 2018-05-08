//
//  BuyDetailInteractor.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import RealmSwift

class BuyDetailInteractor {
    weak var output: BuyDetailInteractorOutput?
}

extension BuyDetailInteractor: BuyDetailInteractorInput {
    func writeToRealm(count: Int, productsRef: ThreadSafeReference<Products>) {
        DispatchQueue.global(qos: .userInitiated).async {
            let realm = try! Realm()
            guard let item = realm.resolve(productsRef) else {
                return
            }
            
            try! realm.write {
                if count == item.count {
                    realm.delete(item)
                } else {
                    item.count -= count
                }
            }
            DispatchQueue.main.async {
                self.output?.updateUI()
            }
        }
    }
}
