//
//  Products.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05.05.2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation
import RealmSwift

class Products: Object {
    @objc dynamic var name = ""
    @objc dynamic var count = 0
}
