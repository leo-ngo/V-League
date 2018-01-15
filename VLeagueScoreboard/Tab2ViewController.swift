//
//  Tab2ViewController.swift
//  VLeagueScoreboard
//
//  Created by Arofando, Hadi  on 1/14/18.
//  Copyright © 2018 VLA. All rights reserved.
//

import UIKit

class Tab2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(3)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! Tab2TableViewCell
        cell.playerNum.text = "27"
        cell.playerName.text = "Spaghetti"
        cell.playerPos.text = "FWD"
        
        
        //cell.rank.text = String(indexPath.row + 1)
        //cell.logo.image = ViewController.logoList[indexPath.row]
        //cell.teamName.text = ViewController.teamNameList[indexPath.row]
        
        return(cell)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
