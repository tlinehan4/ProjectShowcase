//
//  PlayerCell.swift
//  ProjectShowcase
//
//  Created by Timothy Linehan on 4/26/17.
//  Copyright © 2017 Timothy Linehan. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var playerNameCell: UILabel!
    @IBOutlet weak var playerScoreCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        // Configure the view for the selected state
        
//        func configureCell(playerData: Player){
//            playerNameCell.text = name
//            playerScoreCell.text = String(score)
//
//        }
//   
//
}
