//
//  Question3VC.swift
//  ProjectShowcase
//
//  Created by Timothy Linehan on 4/24/17.
//  Copyright © 2017 Timothy Linehan. All rights reserved.
//

import UIKit


class Question3VC: UIViewController {
    @IBOutlet weak var videoOutlet: UIWebView!
    @IBOutlet weak var questionThreeAnswerLabel: UILabel!
    
    @IBOutlet weak var phelanOutlet: UILabel!
    
    @IBOutlet weak var martinOutlet: UILabel!
    
    @IBOutlet weak var shawnOutlet: UILabel!
    
    @IBOutlet weak var riceOutlet: UILabel!
    
    @IBOutlet weak var nextFourOutlet: UIButton!
    
    
    var function = Question1VC()
    var phelanMessage = "Congrats, that's right! Gerard Phelan miraculously caught this pass to win the game. Press Next to proceed."
    var martinShawnMessage = "Oh no, though your choice was a receiver on this BC football team, he did not come down with this Haily Mary pass. The Correct answer was Gerard Phelan. Tap Next to continue."
    var riceMessage = "Oh no, though your choice was a famous wide receiver, he never attended BC. The Correct answer was Gerard Phelan. Tap Next to continue."
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phelanOutlet.layer.borderWidth = 1.0
        martinOutlet.layer.borderWidth = 1.0
        shawnOutlet.layer.borderWidth = 1.0
        riceOutlet.layer.borderWidth = 1.0

        let url = "https://www.youtube.com/embed/haemuFZoPmo?ecver=1"
        videoOutlet.allowsInlineMediaPlayback = true
        
        videoOutlet.loadHTMLString("<iframe width=\"\(videoOutlet.frame.width)\" height=\"\(videoOutlet.frame.height)\" src=\"\(url)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        nextFourOutlet.isEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToQuestion4VC" {
            let destination = segue.destination as! Question4VC
//            destination.name = name
        }
    }
    
    func correctLabelTapped() {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.martinOutlet.alpha = 0}, completion: nil)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.shawnOutlet.alpha = 0}, completion: nil)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.riceOutlet.alpha = 0}, completion: nil)
        questionThreeAnswerLabel.textColor = UIColor(red: 0.0, green: 0.8, blue: 0.0, alpha: 1.0)
        questionThreeAnswerLabel.layer.borderWidth = 2.50
        questionThreeAnswerLabel.layer.borderColor = UIColor.green.cgColor
        questionThreeAnswerLabel.text = phelanMessage
    }
    
    func wrongLabelTapped(label: UILabel, wrongAnswerMessage: String) {
        let bounds = label.bounds
        let shrinkValue: CGFloat = 60
        
        // shirnk our imageToPunch by 60 pixels
        label.bounds = CGRect(x: label.bounds.origin.x + shrinkValue, y: label.bounds.origin.y + shrinkValue, width: label.bounds.size.width - shrinkValue, height: label.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {label.bounds = bounds }, completion: nil)
        questionThreeAnswerLabel.layer.borderWidth = 2.50
        questionThreeAnswerLabel.layer.borderColor = UIColor.red.cgColor
        questionThreeAnswerLabel.text = wrongAnswerMessage
        questionThreeAnswerLabel.textColor = UIColor.red
    }
    
    func disbleUserInteraction(labelA: UILabel, labelB: UILabel, labelC: UILabel, labelD: UILabel) {
        labelA.isUserInteractionEnabled = false
        labelB.isUserInteractionEnabled = false
        labelC.isUserInteractionEnabled = false
        labelD.isUserInteractionEnabled = false
    }
    
    @IBAction func phelanTapped(_ sender: UITapGestureRecognizer) {
        correctLabelTapped()
        disbleUserInteraction(labelA: phelanOutlet, labelB: martinOutlet, labelC: shawnOutlet, labelD: riceOutlet)
        nextFourOutlet.isEnabled = true
        score += 1
    }

    @IBAction func martinTapped(_ sender: UITapGestureRecognizer) {
        wrongLabelTapped(label: martinOutlet, wrongAnswerMessage: martinShawnMessage)
        disbleUserInteraction(labelA: phelanOutlet, labelB: martinOutlet, labelC: shawnOutlet, labelD: riceOutlet)
        nextFourOutlet.isEnabled = true

    }
   
    
    @IBAction func shawnTapped(_ sender: UITapGestureRecognizer) {
        wrongLabelTapped(label: shawnOutlet, wrongAnswerMessage: martinShawnMessage)
        disbleUserInteraction(labelA: phelanOutlet, labelB: martinOutlet, labelC: shawnOutlet, labelD: riceOutlet)
        nextFourOutlet.isEnabled = true

    }

    @IBAction func riceTapped(_ sender: UITapGestureRecognizer) {
        wrongLabelTapped(label: riceOutlet, wrongAnswerMessage: riceMessage)
        disbleUserInteraction(labelA: phelanOutlet, labelB: martinOutlet, labelC: shawnOutlet, labelD: riceOutlet)
        nextFourOutlet.isEnabled = true

    }
    
    
    

}
