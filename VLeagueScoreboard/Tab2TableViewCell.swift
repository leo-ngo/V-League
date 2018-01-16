//
//  Tab2TableViewCell.swift
//  VLeagueScoreboard
//
//  Created by Arofando, Hadi  on 1/14/18.
//  Copyright © 2018 VLA. All rights reserved.
//

import UIKit

class Tab2TableViewCell: UITableViewCell {

    
    @IBOutlet weak var playerNum: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPos: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
