//
//  Question1VC.swift
//  ProjectShowcase
//
//  Created by Timothy Linehan on 4/23/17.
//  Copyright © 2017 Timothy Linehan. All rights reserved.
//

import UIKit

class Question1VC: UIViewController {
    @IBOutlet weak var kerryImage: UIImageView!
    @IBOutlet weak var alexanderImage: UIImageView!
    @IBOutlet weak var ryanImage: UIImageView!
    @IBOutlet weak var poehlerImage: UIImageView!
    @IBOutlet weak var questionOneAnswerLabel: UILabel!
    @IBOutlet weak var nextTwoOutlet: UIButton!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        nextTwoOutlet.isEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var incorrectMessage = "I'm sorry, that's incorrect! You clicked on one of our esteemed alumni! The correct answer was Jason Alexander(top right). Please press Next to continue."

//    func buttonControl() {
//        let touch: UITouch = UITouch()
//        if touch.view == alexanderImage || touch.view == ryanImage || touch.view == poehlerImage || touch.view == kerryImage {
//            nextTwoOutlet.isEnabled = true
//        } else {
//            nextTwoOutlet.isEnabled = false
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToQuestion2VC" {
            let destination = segue.destination as! Question2VC
//            destination.name = name
        }
    }
    
    func animateImage(image: UIImageView, wrongAnswerMessage: String) {
        let bounds = image.bounds
        let shrinkValue: CGFloat = 60
        
        // shirnk our imageToPunch by 60 pixels
        image.bounds = CGRect(x: image.bounds.origin.x + shrinkValue, y: image.bounds.origin.y + shrinkValue, width: image.bounds.size.width - shrinkValue, height: image.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {image.bounds = bounds }, completion: nil)
        questionOneAnswerLabel.layer.borderWidth = 2.50
        questionOneAnswerLabel.layer.borderColor = UIColor.red.cgColor
        questionOneAnswerLabel.text = wrongAnswerMessage
        questionOneAnswerLabel.textColor = UIColor.red
    }
    
    func correctImagePicked(message: String) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.kerryImage.alpha = 0}, completion: nil)
       
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
        self.ryanImage.alpha = 0}, completion: nil)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [], animations: {
            self.poehlerImage.alpha = 0}, completion: nil)
        questionOneAnswerLabel.textColor = UIColor(red: 0.0, green: 0.8, blue: 0.0, alpha: 1.0)
        questionOneAnswerLabel.layer.borderWidth = 2.50
        questionOneAnswerLabel.layer.borderColor = UIColor.green.cgColor
        questionOneAnswerLabel.text = message
    
    }
    
    func disbleUserInteraction(imageOne: UIImageView, imageTwo: UIImageView, imageThree: UIImageView, imageFour: UIImageView) {
        imageOne.isUserInteractionEnabled = false
        imageTwo.isUserInteractionEnabled = false
        imageThree.isUserInteractionEnabled = false
        imageFour.isUserInteractionEnabled = false
    }
    

    

    @IBAction func kerryTapped(_ sender: UITapGestureRecognizer) {
        animateImage(image: kerryImage, wrongAnswerMessage: incorrectMessage)
        disbleUserInteraction(imageOne: kerryImage, imageTwo: alexanderImage, imageThree: ryanImage, imageFour: poehlerImage)
        nextTwoOutlet.isEnabled = true
        
}

    @IBAction func alexanderTapped(_ sender: UITapGestureRecognizer) {
        correctImagePicked(message: "Yes! That's correct! Jason Alexander, of Seinfeld, attended our rival, Boston University, for three years before dropping out. Now press next to continue with the quiz!")
        disbleUserInteraction(imageOne: kerryImage, imageTwo: alexanderImage, imageThree: ryanImage, imageFour: poehlerImage)
        nextTwoOutlet.isEnabled = true
        score += 1
    }

    @IBAction func ryanTapped(_ sender: UITapGestureRecognizer) {
        animateImage(image: ryanImage, wrongAnswerMessage: incorrectMessage)
        disbleUserInteraction(imageOne: kerryImage, imageTwo: alexanderImage, imageThree: ryanImage, imageFour: poehlerImage)
        nextTwoOutlet.isEnabled = true

    }
    
    @IBAction func PoehlerTapped(_ sender: UITapGestureRecognizer) {
        animateImage(image: poehlerImage, wrongAnswerMessage: incorrectMessage)
        disbleUserInteraction(imageOne: kerryImage, imageTwo: alexanderImage, imageThree: ryanImage, imageFour: poehlerImage)
        nextTwoOutlet.isEnabled = true
    }
    
}
