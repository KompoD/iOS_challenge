//
//  BuyRouter.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import UIKit

class BuyRouter {
	var viewController: UIViewController!
}

extension BuyRouter: BuyRouterInput {
    func presentDetail(forProduct item: Products) {
        let productDetailVC = BuyDetailBuilder.build(item)
        viewController.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}
