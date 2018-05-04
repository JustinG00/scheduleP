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
    
    
    
    

    
    @IBAction func button(_ sender: UIButton)
    {
        // Creating alert for adding a new cell
        
        var alert = UIAlertController(title: "New Action", message: "What would you like to name your action?", preferredStyle: .alert)
        
        var alertAction = UIAlertAction(title: "Done", style: .cancel) { (action) in
            // Alert Action
            self.actionSettings.append(actionInfo(mVolume: Int(), nVolume: Int(), vibrate: Bool(), name: alert.textFields![0].text!))
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
    
    
    
    
    
    
    
    
    
    
    
    
}

