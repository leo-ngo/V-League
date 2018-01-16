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
    
    
    static let teamNameList = ["Grim Dawn", "Terraria", "Necrodancer", "Don't Starve"]
    static let logoList: [UIImage] = [#imageLiteral(resourceName: "GD"),#imageLiteral(resourceName: "terraria"),#imageLiteral(resourceName: "necrodancer"),#imageLiteral(resourceName: "don't_starve")]
    static var rowSelect = 0
    let year = ["2014", "2015", "2016", "2017", "2018"]
    
    //yearTitle!.text = "2018"
    
    
    //TableView Functions
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(ViewController.teamNameList.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.rank.text = String(indexPath.row + 1)
        cell.logo.image = ViewController.logoList[indexPath.row]
        cell.teamName.text = ViewController.teamNameList[indexPath.row]
        
        return(cell)
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoView = segue.destination.tabBarController?.viewControllers?[0] as! Tab1ViewController
        infoView.myTeamName = teamNameList[(tableView.indexPathsForSelectedRows?[0].row)!]
        infoView.myLogo = logoList[(tableView.indexPathsForSelectedRows?[0].row)!]
        
    }*/
    
    //Segue to Detailed Info
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ViewController.rowSelect = (tableView.indexPathsForSelectedRows?[0].row)!
        performSegue(withIdentifier: "showInfo", sender: self)
    }
    
    
    //Button to open year
    
    @IBAction func showPopup(_ sender: AnyObject) {
        topConstraint.constant = 345
        bottomConstraint.constant = 0
        topConfirm.constant = 470
        botConfirm.constant = 0
        print("i got exec'd")
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
        print("i got exec'd")
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
        })
        self.navigationItem.rightBarButtonItem?.title = year[pickerView.selectedRow(inComponent: 0)]
            //year[pickerView.selectedRow(inComponent: 1)]
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return(year[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return(year.count)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //code required
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem?.title = "2018"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

