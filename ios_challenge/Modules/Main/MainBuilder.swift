//
//  MainBuilder.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05.05.2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import UIKit

class MainBuilder {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBar = storyboard.instantiateViewController(withIdentifier: "tabBarVC") as! UITabBarController
        
        let buy = BuyBuilder.build()
        let sell = SellBuilder.build()
        
        tabBar.viewControllers = [buy, sell]
        
        return tabBar
    }
}
