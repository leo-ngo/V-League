//
//  Tab2ViewController.swift
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

class Tab2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var name = String()
    var playerList = [Player]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(playerList.count)
        return playerList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! Tab2TableViewCell
        
        cell.playerNum.text = playerList[indexPath.row].number
        cell.playerName.text = playerList[indexPath.row].name
        cell.playerPos.text = playerList[indexPath.row].position
        
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
