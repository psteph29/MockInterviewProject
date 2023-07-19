//
//  ViewController.swift
//  MockInterviewProject#2
//
//  Created by Paige Stephenson on 7/17/23.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var locationSwitch: UISwitch!
    @IBOutlet weak var textFieldNumber: UITextField!
    @IBOutlet weak var nationalitySwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    
    @IBSegueAction func generateButtonPressed(_ coder: NSCoder)  -> DetailTableViewController? {
 
        return DetailTableViewController(gender: genderSwitch.isOn, location: locationSwitch.isOn, nationality: nationalitySwitch.isOn, numberOfPeople: Int(textFieldNumber.text ?? "1") ?? 1, coder: coder)

          
        }
}

