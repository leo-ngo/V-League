//
//  ViewControllerTableViewCell.swift
//  VLeagueScoreboard
//
//  Created by Arofando, Hadi  on 1/7/18.
//  Copyright © 2018 VLA. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var score: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
