//
//  BuyBuilder.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation
import UIKit

class BuyBuilder {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let buyNavVC = storyboard.instantiateViewController(withIdentifier: "buyNavVC") as! UINavigationController
        let viewController = buyNavVC.visibleViewController as! BuyViewController
        
		let router = BuyRouter()

        let presenter = BuyPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = BuyInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        router.viewController = viewController
        
		return buyNavVC
     }
}
