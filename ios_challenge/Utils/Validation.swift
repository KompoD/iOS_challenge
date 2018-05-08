//
//  Validation.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 06.05.2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import Foundation

class Validation {
    private init() {}
    
    static func validateName(_ name: String) -> Bool {
        return name.count >= 1 && name.count <= 15
    }
    
    static func validateCount(_ count: String) -> Bool {
        return count.count >= 1 && count != "0" && count.count <= 15
    }
    
    static func validateCount(_ count: String, availableCount: Int) -> Bool {
        let writtenCount = count.isEmpty ? "0" : count
        if availableCount - Int(writtenCount)! < 0 || count.count < 1 || count == "0" {
            return false
        }
        return true
    }
}
