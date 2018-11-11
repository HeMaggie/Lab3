//
//  CreationViewController.swift
//  Flashcard
//
//  Created by Mengmei He on 11/3/18.
//  Copyright © 2018 Maggie He. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardsController: ViewController!
    
    @IBOutlet weak var qTextField: UITextField!
    @IBOutlet weak var aTextField: UITextField!
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated:true)
    }
    
  
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = qTextField.text
        let answerText = aTextField.text
        
        if questionText==nil||answerText==nil||questionText!.isEmpty||answerText!.isEmpty
        {
            let alert=UIAlertController(title: "Missing text", message: "You need an answer", preferredStyle:.alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present (alert, animated:true)
            
        }
        else
        {
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
            dismiss(animated: true)
            flashcardsController.frontLabel.isHidden=false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
