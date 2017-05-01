//
//  Question4VC.swift
//  ProjectShowcase
//
//  Created by Timothy Linehan on 4/25/17.
//  Copyright © 2017 Timothy Linehan. All rights reserved.
//

import UIKit

class Question4VC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var numField: UITextField!
    @IBOutlet weak var guessOutlet: UIButton!
    @IBOutlet weak var questionFourAnswerLabel: UILabel!
    var alert = Question2VC()
    @IBOutlet weak var nextFiveOutlet: UIButton!

   
    override func viewDidLoad() {
        super.viewDidLoad()
        nextFiveOutlet.isEnabled = false
        numField.becomeFirstResponder()
        numField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToQuestion5VC" {
            let destination = segue.destination as! Question5VC
//            destination.name = name
        }
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

    @IBAction func guessButtonPressed(_ sender: UIButton) {
        nextFiveOutlet.isEnabled = true
        if let inputValue = Int(numField.text!) {
            if inputValue == 76 {
                questionFourAnswerLabel.text = "Great job! That's correct! There are 76 Mods at Boston College! Press next to proceed!"
                questionFourAnswerLabel.textColor = UIColor(red: 0.0, green: 0.8, blue: 0.0, alpha: 1.0)
                questionFourAnswerLabel.layer.borderWidth = 2.50
                questionFourAnswerLabel.layer.borderColor = UIColor.green.cgColor
                numField.isUserInteractionEnabled = false

                score += 1
            } else {
                questionFourAnswerLabel.text = "Oh no! I'm sorry, but that is incorrect! There are actually 76 mods at Boston College. They number 2-39 each with an A and a B. Press next to proceed!"
                questionFourAnswerLabel.textColor = UIColor.red
                questionFourAnswerLabel.layer.borderWidth = 2.50
                questionFourAnswerLabel.layer.borderColor = UIColor.red.cgColor
                numField.isUserInteractionEnabled = false
            }
        } else {
            showAlert(title: "Error: Invalid Entry", message: "Please enter a valid number. Not an empty string, no commas, symbols, or non-numeric characters.")

    }
}
}
