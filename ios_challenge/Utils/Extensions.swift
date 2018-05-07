//
//  Extensions.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 07.05.2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import UIKit

// MARK: Extension helps to disable paste function in text fields
extension UITextField {
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
