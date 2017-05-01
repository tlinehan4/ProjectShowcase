//
//  Question2VC.swift
//  ProjectShowcase
//
//  Created by Timothy Linehan on 4/24/17.
//  Copyright © 2017 Timothy Linehan. All rights reserved.
//

import UIKit

class Question2VC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var nextThreeOutlet: UIButton!
     

    override func viewDidLoad() {
        super.viewDidLoad()
        yearField.becomeFirstResponder()
        yearField.delegate = self
        nextThreeOutlet.isEnabled = false

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToQuestion3VC" {
            let destination = segue.destination as! Question3VC
//            destination.name = name
        }
    }
    
    func buttonControl() {
        if yearField.hasText == true {
            nextThreeOutlet.isEnabled = true
        } else {
            nextThreeOutlet.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)

    }
    
    @IBAction func guessYearPressed(_ sender: UIButton) {
        
        if let inputValue = Int(yearField.text!) {
            if inputValue == 1863 {
                answerLabel.text = "Great job! That's correct! Boston College was founded in 1863 by the Society of Jesus. Press Next to continue your hot streak!"
                answerLabel.textColor = UIColor(red: 0.0, green: 0.8, blue: 0.0, alpha: 1.0)
                answerLabel.layer.borderWidth = 2.50
                answerLabel.layer.borderColor = UIColor.green.cgColor
                yearField.isUserInteractionEnabled = false
                score += 1
            } else {
                answerLabel.text = "Oh no! I'm sorry, but that is incorrect! Boston College was actually founded in 1863. Press Next for a chance to improve your score though!"
                answerLabel.textColor = UIColor.red
                answerLabel.layer.borderWidth = 2.50
                answerLabel.layer.borderColor = UIColor.red.cgColor
                yearField.isUserInteractionEnabled = false
            }
        } else {
            showAlert(title: "Error: Invalid Entry", message: "Please enter a valid number. Not an empty string, no commas, symbols, or non-numeric characters.")
        }
        buttonControl()
    }


}
