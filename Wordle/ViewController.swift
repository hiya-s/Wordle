//
//  ViewController.swift
//  Wordle
//
//  Created by Hiya sharma on 4/6/22.
//  Copyright © 2022 Hiya Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var deadLetters: UILabel!
    @IBOutlet var firstGuess: [UILabel]!
    @IBOutlet var secondGuess: [UILabel]!
    @IBOutlet var thirdGuess: [UILabel]!
    @IBOutlet var fourthGuess: [UILabel]!
    @IBOutlet var fifthGuess: [UILabel]!
   
    
    var guessLabels : [[UILabel]]! = []
    
    var colorMap : [LetterState : UIColor] = [.notEvaluated : .blue, .notPresent : .gray, .rightPlace : .green , .wrongPlace : .yellow]
    
    @IBAction func enter(_ sender: Any) {
        count = count + 1
       var dialogMessage = UIAlertController(title: "Attention", message: "You have forfeited the game and the word was \(secret)", preferredStyle: .alert)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
    var gamecontrollerObj = GameController()
    
    var secret = ""
    
    var count = 1
    var add = false
    @IBOutlet var text: UITextField!
    
    @IBAction func wordEntered(_ sender: Any) {
        gamecontrollerObj.processGuess(g: text.text! )
        updateUI()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
      
       secret =  gamecontrollerObj.selectWord()
       
        guessLabels.append(firstGuess)
         guessLabels.append(secondGuess)
         guessLabels.append(thirdGuess)
         guessLabels.append(fourthGuess)
         guessLabels.append(fifthGuess)
        
        
        
    }
    func updateUI(){
        
        for i in 0..<gamecontrollerObj.guesses.count{
           for j in 0..<5{
            let guessChar = gamecontrollerObj.guesses[i][gamecontrollerObj.guesses[i].index(gamecontrollerObj.guesses[i].startIndex, offsetBy: j)]
            print(guessChar)
            guessLabels[i][j].text = String(guessChar)
            
            guessLabels[i][j].backgroundColor = colorMap[gamecontrollerObj.leterStates[i][j]]
            if(  guessLabels[i][j].backgroundColor == .gray){
                deadLetters.text! +=  String(guessChar)
                
            }
            }
            
        
        }
    }
    
    
    
    
    func getViewRowArray (var index : Int) -> [UILabel]! {
        if(index == 1){
            return firstGuess
        }
        if(index == 2){
            return secondGuess
        }
        if(index == 3){
           return thirdGuess
               }
        if(index == 4){
           return fourthGuess
               }
        if(index == 5){
            return fifthGuess
           }
        return nil
    }
    
    


}

