//
//  Tab1ViewController.swift
//  VLeagueScoreboard
//
//  Created by Arofando, Hadi  on 1/7/18.
//  Copyright © 2018 VLA. All rights reserved.
//

import UIKit

//struct rowIndex {
    //static var index: Int = 0
//}

class Tab1ViewController: UIViewController {

    
    //@IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var segmenterChose: UISegmentedControl!
    
    @IBOutlet weak var value_1: UILabel!
    @IBOutlet weak var value_2: UILabel!
    @IBOutlet weak var value_3: UILabel!
    @IBOutlet weak var value_4: UILabel!
    @IBOutlet weak var value_5: UILabel!
    
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var label_1: UILabel!
    @IBOutlet weak var label_2: UILabel!
    @IBOutlet weak var label_3: UILabel!
    @IBOutlet weak var label_4: UILabel!
    @IBOutlet weak var label_5: UILabel!
    
    
    
    
    var teamList = VleagueParser(year: 2017).getTeamList()
    //@IBOutlet weak var popupCons: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //logo.image = ViewController.logoList[ViewController.rowSelect]
        
        value_1.text = String(teamList[ViewController.rowSelect].wins)
        value_2.text = String(teamList[ViewController.rowSelect].losses)
        value_3.text = String(teamList[ViewController.rowSelect].draws)
        value_4.text = String(teamList[ViewController.rowSelect].matches)
        value_5.text = String(teamList[ViewController.rowSelect].goalsFor + teamList[ViewController.rowSelect].goalsForAway)
        
        
        label_1.text = "Wins"
        label_2.text = "Losses"
        label_3.text = "Draws"
        label_4.text = "Matches"
        label_5.text = "Goals"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func segmenter(_ sender: AnyObject) {
        if segmenterChose.selectedSegmentIndex == 0 {
            
            value_1.text = String(teamList[ViewController.rowSelect].wins)
            value_2.text = String(teamList[ViewController.rowSelect].losses)
            value_3.text = String(teamList[ViewController.rowSelect].draws)
            value_4.text = String(teamList[ViewController.rowSelect].matches)
            value_5.text = String(teamList[ViewController.rowSelect].goalsFor + teamList[ViewController.rowSelect].goalsForAway)
            
            label_1.text = "Wins"
            label_2.text = "Losses"
            label_3.text = "Draws"
            label_4.text = "Matches"
            label_5.text = "Goals"
        }

        if segmenterChose.selectedSegmentIndex == 1 {
            
            value_1.text = String(teamList[ViewController.rowSelect].goalsFor)
            value_2.text = String(teamList[ViewController.rowSelect].goalsForAway)
            value_3.text = String(teamList[ViewController.rowSelect].goalsAgainst)
            value_4.text = String(teamList[ViewController.rowSelect].goalDifference)
            value_5.text = String(teamList[ViewController.rowSelect].yellowCards)
            
            label_1.text = "Do"
            label_2.text = "you"
            label_3.text = "know"
            label_4.text = "da"
            label_5.text = "wei?"
        }
            }
    

    
    
}
