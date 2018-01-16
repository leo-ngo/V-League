//
//  Tab1ViewController.swift
//  VLeagueScoreboard
//
//  Created by Arofando, Hadi  on 1/7/18.
//  Copyright © 2018 VLA. All rights reserved.
//

import UIKit

class Tab1ViewController: UIViewController {

    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var segmenterChose: UISegmentedControl!
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var losses: UILabel!
    @IBOutlet weak var draws: UILabel!
    @IBOutlet weak var matches: UILabel!
    @IBOutlet weak var goals: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var label_1: UILabel!
    @IBOutlet weak var label_2: UILabel!
    @IBOutlet weak var label_3: UILabel!
    @IBOutlet weak var label_4: UILabel!
    @IBOutlet weak var label_5: UILabel!
    
    
    
    
    @IBOutlet weak var popupCons: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.image = ViewController.logoList[ViewController.rowSelect]
        wins.text = String(69)
        losses.text = String(420)
        
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
        if segmenterChose.selectedSegmentIndex == 1 {
            
            wins.text = String(5)
            losses.text = String(96)
            
            label_1.text = "Do"
            label_2.text = "you"
            label_3.text = "know"
            label_4.text = "da"
            label_5.text = "wei?"
        }
        if segmenterChose.selectedSegmentIndex == 0 {
            wins.text = String(55)
            losses.text = String(0455)
            
            label_1.text = "Wins"
            label_2.text = "Losses"
            label_3.text = "Draws"
            label_4.text = "Matches"
            label_5.text = "Goals"
        }
    }
    

    
    
}
