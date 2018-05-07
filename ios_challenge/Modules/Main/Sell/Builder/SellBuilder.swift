//
//  SellBuilder.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation
import UIKit

class SellBuilder {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sellNavVC = storyboard.instantiateViewController(withIdentifier: "sellNavVC") as! UINavigationController
        let viewController = sellNavVC.visibleViewController as! SellViewController
        
		let router = SellRouter()

        let presenter = SellPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SellInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        router.viewController = viewController
        
		return sellNavVC
     }
}
