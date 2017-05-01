//
//  Question5VC.swift
//  ProjectShowcase
//
//  Created by Timothy Linehan on 4/25/17.
//  Copyright © 2017 Timothy Linehan. All rights reserved.
//

import UIKit

class Question5VC: UIViewController {
    @IBOutlet weak var uconnOutlet: UIButton!
    @IBOutlet weak var ncOutlet: UIButton!
    @IBOutlet weak var umdOutlet: UIButton!
    @IBOutlet weak var wfOutlet: UIButton!
    @IBOutlet weak var endQuizOutlet: UIButton!
    @IBOutlet weak var question5AnswerLabel: UILabel!
    
    @IBOutlet weak var runnerImage: UIImageView!
    
    @IBOutlet weak var winnersImage: UIImageView!
    
    var wrongButtonMessage = "Oh no! I'm sorry that's incorrect. Though BC did beat this team in their comeback 2016 season, they actually beat Maryland in the Bowl Game. Press end quiz to check out the leaderboard!"
    var correctButtonMessage = "Correct! Boston College beat Maryland 36-30! Press end quiz to check out the leaderboard!"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        uconnOutlet.layer.borderWidth = 1.0
        ncOutlet.layer.borderWidth = 1.0
        umdOutlet.layer.borderWidth = 1.0
        wfOutlet.layer.borderWidth = 1.0
        endQuizOutlet.isEnabled = false
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // if segue.identifier == "ToTableView" {
          //  let destination = segue.destination as! LeaderBoardTableVC
//            destination.name = name
      //  }
   // }
    func correctLabelTapped() {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.uconnOutlet.alpha = 0}, completion: nil)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.ncOutlet.alpha = 0}, completion: nil)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.wfOutlet.alpha = 0}, completion: nil)
        question5AnswerLabel.textColor = UIColor(red: 0.0, green: 0.8, blue: 0.0, alpha: 1.0)
        question5AnswerLabel.layer.borderWidth = 2.50
        question5AnswerLabel.layer.borderColor = UIColor.green.cgColor
        question5AnswerLabel.text = correctButtonMessage
        runnerImage.image = UIImage(named: "mdTerp")
        winnersImage.image = UIImage(named: "bcEagle")
        UIView.animate(withDuration: 0.5, delay: 0.8, options: [], animations: {self.runnerImage.frame.origin.x = self.view.frame.origin.x - self.runnerImage.frame.width}, completion: nil)
        UIView.animate(withDuration: 0.6, delay: 0.8, options: [], animations: {self.winnersImage.frame.origin.x = self.view.frame.origin.x }, completion: {_ in self.endQuizOutlet.isEnabled = true})
    }
    
    func wrongButtonTapped(button: UIButton, wrongAnswerMessage: String) {
        let bounds = button.bounds
        let shrinkValue: CGFloat = 60
        
        // shirnk our imageToPunch by 60 pixels
        button.bounds = CGRect(x: button.bounds.origin.x + shrinkValue, y: button.bounds.origin.y + shrinkValue, width: button.bounds.size.width - shrinkValue, height: button.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {button.bounds = bounds }, completion: nil)
        question5AnswerLabel.layer.borderWidth = 2.50
        question5AnswerLabel.layer.borderColor = UIColor.red.cgColor
        question5AnswerLabel.text = wrongAnswerMessage
        question5AnswerLabel.textColor = UIColor.red
    }
    func disbleUserInteraction(buttonA: UIButton, buttonB: UIButton, buttonC: UIButton, buttonD: UIButton) {
        buttonA.isUserInteractionEnabled = false
        buttonB.isUserInteractionEnabled = false
        buttonC.isUserInteractionEnabled = false
        buttonD.isUserInteractionEnabled = false
    }
    
    @IBAction func uconnPressed(_ sender: UIButton) {
        wrongButtonTapped(button: uconnOutlet, wrongAnswerMessage: wrongButtonMessage)
        disbleUserInteraction(buttonA: uconnOutlet, buttonB: umdOutlet, buttonC: ncOutlet, buttonD: wfOutlet)
        endQuizOutlet.isEnabled = true
    }
    
    @IBAction func ncPressed(_ sender: UIButton) {
        wrongButtonTapped(button: ncOutlet, wrongAnswerMessage: wrongButtonMessage)
        disbleUserInteraction(buttonA: uconnOutlet, buttonB: umdOutlet, buttonC: ncOutlet, buttonD: wfOutlet)
        endQuizOutlet.isEnabled = true
        
    }
    
    @IBAction func umdPressed(_ sender: UIButton) {
        correctLabelTapped()
        disbleUserInteraction(buttonA: uconnOutlet, buttonB: umdOutlet, buttonC: ncOutlet, buttonD: wfOutlet)
        score += 1
        
    }
    @IBAction func wfPressed(_ sender: UIButton) {
        wrongButtonTapped(button: wfOutlet, wrongAnswerMessage: wrongButtonMessage)
        disbleUserInteraction(buttonA: uconnOutlet, buttonB: umdOutlet, buttonC: ncOutlet, buttonD: wfOutlet)
        endQuizOutlet.isEnabled = true
        
    }
    

}
