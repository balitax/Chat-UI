//
//  PanggilanListTableViewCell.swift
//  HiApp
//
//  Created by Agus Cahyono on 11/04/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class PanggilanListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class var reusableIndentifer: String { return String(describing: self) }
    
    static func reusableNIB() -> UINib {
        return UINib(nibName: self.reusableIndentifer, bundle: Bundle.main)
    }
    
}
