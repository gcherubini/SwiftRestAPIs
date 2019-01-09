//
//  SecondViewTableCell.swift
//  app
//
//  Created by Guilherme Cherubini on 09/01/19.
//  Copyright © 2019 Guilherme Cherubini. All rights reserved.
//

import UIKit

class SecondViewTableCell: UITableViewCell {

	@IBOutlet weak var label: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
		func setLabel(text: String) {
			label.text = text
		}
}
