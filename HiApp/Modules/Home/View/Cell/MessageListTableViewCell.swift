//
//  MessageListTableViewCell.swift
//  HiApp
//
//  Created by Agus Cahyono on 11/04/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class MessageListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
    }
    
    override func didTransition(to state: UITableViewCell.StateMask) {
        super.didTransition(to: state)
    }
    
    class var reusableIndentifer: String { return String(describing: self) }
    
    static func reusableNIB() -> UINib {
        return UINib(nibName: self.reusableIndentifer, bundle: Bundle.main)
    }
    
}
