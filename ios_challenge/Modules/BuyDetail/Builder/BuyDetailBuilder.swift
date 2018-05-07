//
//  BuyDetailBuilder.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation
import UIKit

class BuyDetailBuilder {

    static func build(_ item: Products) -> UIViewController {
        let storyboard = UIStoryboard(name: "BuyDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "buyDetailVC") as! BuyDetailViewController
        viewController.currentItem = item
        
		let router = BuyDetailRouter()

        let presenter = BuyDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = BuyDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        router.viewController = viewController
        
		return viewController
     }
	 
}
