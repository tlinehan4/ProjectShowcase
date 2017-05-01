//
//  ViewController.swift
//  ProjectShowcase
//
//  Created by Timothy Linehan on 4/23/17.
//  Copyright © 2017 Timothy Linehan. All rights reserved.
//

import UIKit
var name = ""
var score = 0
class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nextOneOutlet: UIButton!
    @IBOutlet weak var nameField: UITextField!
    var userName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.becomeFirstResponder()
        nameField.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   
        textField.resignFirstResponder()
        return true
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToQuestion1VC" {
            let destination = segue.destination as! Question1VC
//            destination.name = userName
        }
    }
    
    
    @IBAction func nextOnePressed(_ sender: UIButton) {
        if nameField.hasText {
            name = nameField.text!
        } else {
            showAlert(title: "Error", message: "Please enter your name before pressing next.")
            
        }
    score = 0
}
    
}

