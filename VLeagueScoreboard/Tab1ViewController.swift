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

    
    var myTeamName = String()
    var myLogo = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamName.text = myTeamName
        logo.image = myLogo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
