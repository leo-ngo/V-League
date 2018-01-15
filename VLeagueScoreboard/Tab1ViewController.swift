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
    
    

    @IBOutlet weak var popupCons: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.image = ViewController.logoList[ViewController.rowSelect]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func segmenter(_ sender: AnyObject) {
        //segmenterChose.selectedSegmentIndex
    }
    

    
    
}
