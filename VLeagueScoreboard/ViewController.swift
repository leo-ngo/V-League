//
//  ViewController.swift
//  VLeagueScoreboard
//
//  Created by Arofando, Hadi  on 1/4/18.
//  Copyright © 2018 VLA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    let teamNameList = ["Grim Dawn", "Terraria", "Necrodancer", "Don't Starve"]
    let logoList: [UIImage] = [#imageLiteral(resourceName: "GD"),#imageLiteral(resourceName: "terraria"),#imageLiteral(resourceName: "necrodancer"),#imageLiteral(resourceName: "don't_starve")]
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(teamNameList.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.rank.text = String(indexPath.row + 1)
        cell.logo.image = logoList[indexPath.row]
        cell.teamName.text = teamNameList[indexPath.row]
        
        return(cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoView = segue.destination.tabBarController?.viewControllers?[0] as! Tab1ViewController
        infoView.myTeamName = teamNameList[(tableView.indexPathsForSelectedRows?[0].row)!]
        infoView.myLogo = logoList[(tableView.indexPathsForSelectedRows?[0].row)!]
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showInfo", sender: self)
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

