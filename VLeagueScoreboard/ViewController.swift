//
//  ViewController.swift
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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBOutlet weak var yearTitle: UITextField!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topConfirm: NSLayoutConstraint!
    @IBOutlet weak var botConfirm: NSLayoutConstraint!
    
    
    
    static var rowSelect = 0
    let year = [2017, 2016, 2015, 2014, 2013, 2012]
    //let screenRect = UIScreen.main.bounds
    let CurrentHeight = UIScreen.main.bounds.height
    
    var teamList = VleagueParser(year: 2017).getTeamList()
    
    
    //MARK: TableView Functions and Settings
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.rank.text = String(indexPath.row + 1)
        cell.teamName.text = teamList[indexPath.row].name
        cell.score.text = String(teamList[indexPath.row].points)
        switch teamList[indexPath.row].name {
        case "Quảng Nam":
            cell.logo.image = UIImage(named: "Quảng Nam")
        case "Sài Gòn":
            cell.logo.image = UIImage(named: "Sài Gòn")
        case "Becamex Bình Dương":
            cell.logo.image = UIImage(named: "Becamex Bình Dương")
        case "FLC Thanh Hóa":
            cell.logo.image = UIImage(named: "FLC Thanh Hóa")
        case "Hà Nội":
            cell.logo.image = UIImage(named: "Hà Nội")
        case "Hải Phòng":
            cell.logo.image = UIImage(named: "Hải Phòng")
        case "Hoàng Anh Gia Lai":
            cell.logo.image = UIImage(named: "Hoàng Anh Gia Lai")
        case "Long An":
            cell.logo.image = UIImage(named: "Long An")
        case "Sanna Khánh Hòa BVN":
            cell.logo.image = UIImage(named: "Sanna Khánh Hòa BVN")
        case "SHB Đà Nẵng":
            cell.logo.image = UIImage(named: "SHB Đà Nẵng")
        case "Sông Lam Nghệ An":
            cell.logo.image = UIImage(named: "Sông Lam Nghệ An")
        case "Than Quảng Ninh":
            cell.logo.image = UIImage(named: "Than Quảng Ninh")
        case "TP Hồ Chí Minh":
            cell.logo.image = UIImage(named: "TP Hồ Chí Minh")
        case "XSKT Cần Thơ":
            cell.logo.image = UIImage(named: "XSKT Cần Thơ")
        case "Khatoco Khánh Hòa":
            cell.logo.image = UIImage(named: "Khatoco Khánh Hòa")
        case "Kienlongbank Kiên Giang":
            cell.logo.image = UIImage(named: "Kienlongbank Kiên Giang")
        case "XM Xuân Thành Sài Gòn":
            cell.logo.image = UIImage(named: "XM Xuân Thành Sài Gòn")
        case "Hùng Vương An Giang":
            cell.logo.image = UIImage(named: "Hùng Vương An Giang")
        default:
            break
        }

        return(cell)
    }
    
    
    //MARK: Transition to Detailed Info
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! Tab1ViewController
        ViewController.rowSelect = (tableView.indexPathsForSelectedRows?[0].row)!
        nextVC.name = teamList[ViewController.rowSelect].name
        nextVC.myRank = String(teamList[ViewController.rowSelect].rank)
        nextVC.myScore = String(teamList[ViewController.rowSelect].points)
        nextVC.wins = String(teamList[ViewController.rowSelect].wins)
        nextVC.losses = String(teamList[ViewController.rowSelect].losses)
        nextVC.draws = String(teamList[ViewController.rowSelect].draws)
        nextVC.matches = String(teamList[ViewController.rowSelect].matches)
        nextVC.goals = String(teamList[ViewController.rowSelect].goalsFor)
        nextVC.awayGoals = String(teamList[ViewController.rowSelect].goalsForAway)
        nextVC.goalsAgainst = String(teamList[ViewController.rowSelect].goalsAgainst)
        nextVC.goalDifference = String(teamList[ViewController.rowSelect].goalDifference)
        nextVC.yellowCards = String(teamList[ViewController.rowSelect].yellowCards)
        nextVC.redCards = String(teamList[ViewController.rowSelect].redCards)
        
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showInfo", sender: self)
    }
    
    
    //MARK: Trigger pickerView opening
    
    @IBAction func showPopup(_ sender: AnyObject) {
        topConstraint.constant = CurrentHeight / 2
        bottomConstraint.constant = 0
        topConfirm.constant = CurrentHeight * 4 / 5
        botConfirm.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
        self.view.layoutIfNeeded()
        })
        
        
    }
    
    //MARK: PickerView Functions and Settings
    
    
    @IBAction func closePopup(_ sender: AnyObject) {
        topConstraint.constant = CurrentHeight
        bottomConstraint.constant = 0 - CurrentHeight
        topConfirm.constant = CurrentHeight
        botConfirm.constant = 0 - CurrentHeight

        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
        })
        self.navigationItem.rightBarButtonItem?.title = String(year[pickerView.selectedRow(inComponent: 0)])
        teamList = VleagueParser(year: year[pickerView.selectedRow(inComponent: 0)]).getTeamList()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return(String(year[row]))
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return(year.count)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    
    
    //MARK: Initial loading functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Rankings"
        self.navigationItem.rightBarButtonItem?.title = "Years"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

