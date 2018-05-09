//
//  ViewController.swift
//  schedule
//
//  Created by ios5 on 4/19/18.
//  Copyright © 2018 ios5. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    
 
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet var editButton: UIButton!
    
    var actionSettings = [actionInfo]()
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       // Button Creation
        
        button.setTitle("Add", for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-CondensedBold", size: 30)
        button.titleLabel?.textColor = UIColor.black
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.frame = CGRect(x: 328 , y: 40, width: 99, height: 57)
        
        // TableView Data Reset
        tableView.reloadData()
        
        
        
      
        
        
    }

    
    func actionInvoker(action:actionInfo){
        
        
        let date = Date() // save date, so all components use the same date
        let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let weekDay = calendar.component(.weekday, from: date)
        
        print(hour,minute,second)
        
//        if weekDay == action.daysOfWeek && hour == action.hourOfDay && minute = action.minuteOfHour{
//
//            print("Ok")
//
//
//
//
//
//
//
//        }
//        
        
        
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        // Number of cells
        return actionSettings.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Cell Info
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = actionSettings[indexPath.row].name
        cell?.textLabel?.font = UIFont(name: "AmericanTypewriter-CondensedBold", size: 30)
        return cell!
        
        
        
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    

    
    @IBAction func button(_ sender: UIButton)
    {
        // Creating alert for adding a new cell
        
        var alert = UIAlertController(title: "New Action", message: "What would you like to name your action?", preferredStyle: .alert)
        
        var alertAction = UIAlertAction(title: "Done", style: .cancel) { (action) in
            // Alert Action
            self.actionSettings.append(actionInfo(mVolume: Int(), nVolume: Int(), vibrate: Bool(), name: alert.textFields![0].text!, hourOfDay: Int(), minuteOfHour: Int(), daysOfWeek: Int()))
            
            self.tableView.reloadData()
            
        }
        
        
        // Adding Alert TextField and Action
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "Name"
        }
        
        alert.addAction(alertAction)
       
        // Presenting Alert
        
        present(alert, animated: true, completion: nil)
        
        
        
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // Segue to SecondViewController
        
        performSegue(withIdentifier: "segueOne", sender: Any?.self)
        
        
        
        
        
        
        
        
    }
    @IBAction func editTableView(_ sender: UIButton)
    {
        if tableView.isEditing == false {
            tableView.isEditing = true
        } else {
            tableView.isEditing = false
        }
        if editButton.titleLabel?.text == "Finish Edit"
        {
            editButton.titleLabel?.text = "Edit"
        }
        if editButton.titleLabel?.text == "Edit"
        {
            editButton.titleLabel?.text = "Finish Edit"
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

