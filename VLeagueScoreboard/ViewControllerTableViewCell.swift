//
//  ViewControllerTableViewCell.swift
//  VLeagueScoreboard
//
//  RMIT University Vietnam
//  Course: COSC2659 iOS Development
//  Semester: 2017C
//  Assignment: 3
//  Team: ALV
//  Authors: Vuong Hung Ngo, Long Hoang Tran, Arofando Hadi
//  ID: s3610887, s3635165, s3618954
//  Created date: 17/01/2018
//  Acknowledgement: http://www.vnleague.com/


import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    
    //MARK: Cell elements
    
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
