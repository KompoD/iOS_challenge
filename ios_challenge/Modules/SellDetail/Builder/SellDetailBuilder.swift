//
//  SellDetailBuilder.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation
import UIKit

class SellDetailBuilder {

    static func build(_ item: Products?) -> UIViewController {
        let storyboard = UIStoryboard(name: "SellDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "sellDetailVC") as! SellDetailViewController
        viewController.currentItem = item
        
		let router = SellDetailRouter()

        let presenter = SellDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SellDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        router.viewController = viewController
        
		return viewController
     }
	 
}
