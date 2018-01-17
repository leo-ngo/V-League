//
//  Tab1ViewController.swift
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
    
    var name = String()
    var myRank = String()
    var myScore = String()
    
    var wins = String()
    var losses = String()
    var draws = String()
    var matches = String()
    var goals = String()
    
    var goalsAgainst = String()
    var goalDifference = String()
    var yellowCards = String()
    var redCards = String()
    
    var playerList = [Player]()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! Tab2ViewController
        //ViewController.rowSelect = (tableView.indexPathsForSelectedRows?[0].row)!
        nextVC.name = name
        nextVC.playerList = playerList
        
        
    }
    
    //public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //ViewController.rowSelect = (tableView.indexPathsForSelectedRows?[0].row)!
        //rowIndex.index = (tableView.indexPathsForSelectedRows?[0].row)!
    //    performSegue(withIdentifier: "showPlayer", sender: self)
    //}
    
    
    @IBAction func showPlayer(_ sender: AnyObject) {
        performSegue(withIdentifier: "showPlayer", sender: self)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //logo.image = ViewController.logoList[ViewController.rowSelect]
        
        //let button1 = UIBarButtonItem(title: "bitch", style: normal, target: self, action: nil)
        self.navigationItem.title  = name
        print(name == "Quảng Nam")
        print(name)
        print("asdasdasdasfasfsdfsdgdfsgdfgdfgdfgdfgdfg")
        switch name {
        case "Quảng Nam":
            logo.image = UIImage(named: "Quảng Nam")
        case "Sài Gòn":
            logo.image = UIImage(named: "Sài Gòn")
        case "Becamex Bình Dương":
            logo.image = UIImage(named: "Becamex Bình Dương")
        case "FLC Thanh Hóa":
            logo.image = UIImage(named: "FLC Thanh Hóa")
        case "Hà Nội":
            logo.image = UIImage(named: "Hà Nội")
        case "Hải Phòng":
            logo.image = UIImage(named: "Hải Phòng")
        case "Hoàng Anh Gia Lai":
            logo.image = UIImage(named: "Hoàng Anh Gia Lai")
        case "Long An":
            logo.image = UIImage(named: "Long An")
        case "Sanna Khánh Hòa BVN":
            logo.image = UIImage(named: "Sanna Khánh Hòa BVN")
        case "SHB Đà Nẵng":
            logo.image = UIImage(named: "SHB Đà Nẵng")
        case "Sông Lam Nghệ An":
            logo.image = UIImage(named: "Sông Lam Nghệ An")
        case "Than Quảng Ninh":
            logo.image = UIImage(named: "Than Quảng Ninh")
        case "TP Hồ Chí Minh":
            logo.image = UIImage(named: "TP Hồ Chí Minh")
        case "XSKT Cần Thơ":
            logo.image = UIImage(named: "XSKT Cần Thơ")
        case "Khatoco Khánh Hòa":
            logo.image = UIImage(named: "Khatoco Khánh Hòa")
        case "Kienlongbank Kiên Giang":
            logo.image = UIImage(named: "Kienlongbank Kiên Giang")
        case "XM Xuân Thành Sài Gòn":
            logo.image = UIImage(named: "XM Xuân Thành Sài Gòn")
        case "Đồng Nai":
            logo.image = UIImage(named: "Đồng Nai")
        default:
            break
        }
        
        rank.text = myRank
        score.text = myScore
        
        value_1.text = wins
        value_2.text = losses
        value_3.text = draws
        value_4.text = matches
        value_5.text = goals
        
        
        label_1.text = "Wins"
        label_2.text = "Losses"
        label_3.text = "Draws"
        label_4.text = "Matches"
        label_5.text = "Goals"
        
        DispatchQueue.main.async {
            self.playerList = PlayerList(teamName: self.name).get()
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func segmenterTap(_ sender: AnyObject) {
        if segmenterChose.selectedSegmentIndex == 0 {
            
            value_1.text = wins
            value_2.text = losses
            value_3.text = draws
            value_4.text = matches
            value_5.text = goals
            
            label_1.text = "Wins"
            label_2.text = "Losses"
            label_3.text = "Draws"
            label_4.text = "Matches"
            label_5.text = "Goals"
        }
        
        if segmenterChose.selectedSegmentIndex == 1 {
            
            value_1.text = wins
            value_2.text = goalsAgainst
            value_3.text = goalDifference
            value_4.text = yellowCards
            value_5.text = redCards
            
            label_1.text = "Away Goals"
            label_2.text = "Goal Against"
            label_3.text = "Goal Diff"
            label_4.text = "Yellows"
            label_5.text = "Reds"
        }
    }

    
    
}
