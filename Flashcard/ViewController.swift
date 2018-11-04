//
//  ViewController.swift
//  Flashcard
//
//  Created by Mengmei He on 11/3/18.
//  Copyright © 2018 Maggie He. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    
    @IBOutlet weak var optOne: UIButton!
    @IBOutlet weak var optTwo: UIButton!
    @IBOutlet weak var optThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        card.layer.cornerRadius=30
    
        card.layer.shadowRadius=15
        card.layer.shadowOpacity=0.2
        frontLabel.layer.cornerRadius=30
        backLabel.layer.cornerRadius=30
        frontLabel.clipsToBounds=true
        backLabel.clipsToBounds=true
        
        optOne.layer.borderWidth = 3
        optOne.layer.borderColor=#colorLiteral(red: 0.9730371086, green: 0.7049640979, blue: 1, alpha: 1)
        optOne.layer.cornerRadius=15
        
        optTwo.layer.borderWidth = 3
        optTwo.layer.borderColor=#colorLiteral(red: 0.9730371086, green: 0.7049640979, blue: 1, alpha: 1)
        optTwo.layer.cornerRadius=15
        
        optThree.layer.borderWidth = 3
        optThree.layer.borderColor=#colorLiteral(red: 0.9730371086, green: 0.7049640979, blue: 1, alpha: 1)
        optThree.layer.cornerRadius=15
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func didTapOnOne(_ sender: Any) {
        optOne.isHidden=true
    }
    
    @IBAction func didTapOnTwo(_ sender: Any) {
        frontLabel.isHidden=true
    }
    
    @IBAction func didTapOnThree(_ sender: Any) {
        optThree.isHidden=true
    }
    
    @IBAction func didTapOnView(_ sender: Any) {
        frontLabel.isHidden=false
        optOne.isHidden=false
        optTwo.isHidden=false
        optThree.isHidden=false
    }
    
    
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
       frontLabel.isHidden = true
    }
    func updateFlashcard(question:String, answer: String){
        frontLabel.text=question
        backLabel.text=answer
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    }
}

