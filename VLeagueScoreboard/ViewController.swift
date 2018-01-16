//
//  ViewController.swift
//  VLeagueScoreboard
//
//  Created by Arofando, Hadi  on 1/4/18.
//  Copyright © 2018 VLA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBOutlet weak var yearTitle: UITextField!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topConfirm: NSLayoutConstraint!
    @IBOutlet weak var botConfirm: NSLayoutConstraint!
    
    
    //@IBOutlet weak var yearButton: UIBarButtonItem!
    

    
    //yearButton.setTitle("2018", forState: UIControlState.Normal)
    
    
    //static let teamNameList = ["Grim Dawn", "Terraria", "Necrodancer", "Don't Starve"]
    //static let logoList: [UIImage] = [#imageLiteral(resourceName: "GD"),#imageLiteral(resourceName: "terraria"),#imageLiteral(resourceName: "necrodancer"),#imageLiteral(resourceName: "don't_starve")]
    
    static var rowSelect = 0
    let year = [2017, 2016, 2015, 2014]
    
    var teamList = VleagueParser(year: 2017).getTeamList()
    
    
    //yearTitle!.text = "2018"
    
    
    //TableView Functions
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.rank.text = String(indexPath.row + 1)
        //cell.logo.image = teamList[indexPath.row].*supposedlytheimage
        cell.teamName.text = teamList[indexPath.row].name
        
        cell.score.text = String(teamList[indexPath.row].points)
        
        return(cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! Tab1ViewController
        ViewController.rowSelect = (tableView.indexPathsForSelectedRows?[0].row)!
        nextVC.wins = String(teamList[ViewController.rowSelect].wins)
        nextVC.losses = String(teamList[ViewController.rowSelect].losses)
        nextVC.draws = String(teamList[ViewController.rowSelect].draws)
        nextVC.matches = String(teamList[ViewController.rowSelect].matches)
        nextVC.goals = String(teamList[ViewController.rowSelect].goalsFor + teamList[ViewController.rowSelect].goalsForAway)
        //let nav = barViewControllers.viewControllers![0] as! UINavigationController
        //let destinationViewController = nav.viewControllers[0] as! Tab1ViewController
        //destinationViewController.rowIndex = (tableView.indexPathsForSelectedRows?[0].row)!
        
        
    }
    
    
    //Segue to Detailed Info
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //ViewController.rowSelect = (tableView.indexPathsForSelectedRows?[0].row)!
        //rowIndex.index = (tableView.indexPathsForSelectedRows?[0].row)!
        performSegue(withIdentifier: "showInfo", sender: self)
    }
    
    
    //Button to open year
    
    @IBAction func showPopup(_ sender: AnyObject) {
        topConstraint.constant = 345
        bottomConstraint.constant = 0
        topConfirm.constant = 470
        botConfirm.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
        self.view.layoutIfNeeded()
        })
        
    }
    
    //PickerView Functions
    
    
    @IBAction func closePopup(_ sender: AnyObject) {
        topConstraint.constant = 545
        bottomConstraint.constant = -200
        topConfirm.constant = 670
        botConfirm.constant = -200

        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
        })
        self.navigationItem.rightBarButtonItem?.title = String(year[pickerView.selectedRow(inComponent: 0)])
        teamList = VleagueParser(year: year[pickerView.selectedRow(inComponent: 0)]).getTeamList()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
        //year[pickerView.selectedRow(inComponent: 1)]
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
    
    
    
    //Loading functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "Logo_VPF"))
        self.navigationItem.title = "Rankings"
        self.navigationItem.rightBarButtonItem?.title = "2017"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

