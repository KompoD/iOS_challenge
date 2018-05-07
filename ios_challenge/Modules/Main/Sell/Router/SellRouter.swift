//
//  SellRouter.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import UIKit

class SellRouter {
	var viewController: UIViewController!
}

extension SellRouter: SellRouterInput {
    func presentDetail(forProduct item: Products?) {
        let productDetailVC = SellDetailBuilder.build(item)
        viewController.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}
