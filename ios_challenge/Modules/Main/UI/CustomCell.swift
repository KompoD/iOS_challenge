//
//  CustomCell.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 06.05.2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
