//
//  ViewController.swift
//  Flashcard
//
//  Created by Mengmei He on 11/3/18.
//  Copyright © 2018 Maggie He. All rights reserved.
//

import UIKit

struct Flashcard{
    var question: String
    var answer: String
}
class ViewController: UIViewController {

    
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    
    @IBOutlet weak var optOne: UIButton!
    @IBOutlet weak var optTwo: UIButton!
    @IBOutlet weak var optThree: UIButton!
    
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //array to hold flashcard
    var flashcards=[Flashcard]()
    var currentIndex=0
    
    func updateNextPrevButtons(){
        if currentIndex==flashcards.count-1{
            nextButton.isEnabled=false
        }
        else
        {nextButton.isEnabled=true}
        if currentIndex==0{
            prevButton.isEnabled=false
        }
        else{
            prevButton.isEnabled=true
        }
    }
    func updateLabels(){
        let currentFlashcard=flashcards[currentIndex]
        frontLabel.text=currentFlashcard.question
        backLabel.text=currentFlashcard.answer
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readSavedFlashcards()
        
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
        if flashcards.count==0{
        updateFlashcard(question: "What's your name?", answer: "Maggie")
        }
        else
        {
            updateLabels()
            updateNextPrevButtons()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapOnDelete(_ sender: Any) {
        let alert=UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        let deleteAction=UIAlertAction(title: "Delete", style: .destructive){
            action in self.deleteCurrentFlashcard()
        }
        alert.addAction(deleteAction)

        let cancelAction=UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func deleteCurrentFlashcard(){
        flashcards.remove(at:currentIndex)
        if currentIndex > flashcards.count-1{
            currentIndex=flashcards.count-1
        }
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
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
        let flashcard=Flashcard(question: question, answer: answer)
        frontLabel.text=flashcard.question
        backLabel.text=flashcard.answer
        flashcards.append(flashcard)
        print("Added new flashcard")
        print("We now have \(flashcards.count) flashcards")
        currentIndex=flashcards.count-1
        print("Our current index is \(currentIndex)")
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }

    @IBAction func didTapOnPrev(_ sender: Any) {
        frontLabel.isHidden=false
        currentIndex=currentIndex-1
        updateLabels()
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        frontLabel.isHidden=false
        currentIndex=currentIndex+1
        updateLabels()
        updateNextPrevButtons()
    }
    
   
    func saveAllFlashcardsToDisk(){
        let dictionaryArray=flashcards.map { (card) -> [String:String] in
            return["question": card.question, "answer":card.answer]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards(){
        
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            let savedCards = dictionaryArray.map { (dictionary) -> Flashcard in return Flashcard (question: dictionary["question"]!, answer: dictionary["answer"]!)}
                flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    }
    
  
}

