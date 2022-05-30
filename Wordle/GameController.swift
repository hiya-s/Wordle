//
//  GameController.swift
//  Wordle
//
//  Created by Raja sharma on 4/20/22.
//  Copyright © 2022 Hiya Sharma. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    var secretWord = ""
    static var wordBank = [String]()
    var deadLetter = Set<String>()
  //  var guessData = [GuessResultData]()
    var index = 0
    var guesses : [String] =  []
    var leterStates : [[LetterState]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if GameController.wordBank.isEmpty{
                loadDictionary()
        }
    
        // Do any additional setup after loading the view.
    }
    
  
    
    func loadDictionary(){
        do{
            let fileURL = Bundle.main.path(forResource : "dictionary", ofType : "txt")!
            let fileContents : String = try String (contentsOfFile: fileURL, encoding : .utf8)
            let words : [String] = fileContents.components(separatedBy :  "\n")
            for i in words {
                if i.count == 5{
                    GameController.wordBank.append(i)
                    print(i)
                }
            }
        }
        catch let error{
            Swift.print("Fatal Error: \(error.localizedDescription)")
        }
    }
    
    func selectWord() -> String{
        loadDictionary()
        var major = GameController.wordBank.count
        
        var  ab =  (Int.random(in: 1..<major))
        
        secretWord = GameController.wordBank[ab]
        print(secretWord)
        return secretWord
        }
    
    func scoreGuess(var x : String)-> [Bool]{
        
        var b : [Bool] = [false, false, false, false, false]
        
        
        
        return b
        
    }
    func getGuessResults(guess : String) -> [LetterState]{
        var codes: [LetterState] = [.notPresent, .notPresent, .notPresent, .notPresent, .notPresent]
        var used = [false, false, false, false, false]
        
        //exact location
        for i in 0..<5{
            let guessChar = guess[guess.index(guess.startIndex, offsetBy: i)]
            let secretWordChar = secretWord[secretWord.index(secretWord.startIndex, offsetBy: i)]
            print("in exact location loop")
            
            print(guessChar)
            print("guess char")
            print(secretWordChar)
            print("secret")
            if(guessChar == secretWordChar){
                print("heyyyoo")
                codes[i] = .rightPlace
                used[i] = true
            }
        }
       
        //existent in secret but in wrong order
        for i in 0..<5{
                   let guessChar = guess[guess.index(guess.startIndex, offsetBy: i)]
                   let secretWordChar = secretWord[secretWord.index(secretWord.startIndex, offsetBy: i)]
            print(guessChar)
            print(secretWordChar)
            for j in 0..<5{
                 let guessChar1 = guess[guess.index(guess.startIndex, offsetBy: j)]
                if(used[j] == false){
                   if(guessChar1 == secretWordChar){
                       codes[j] = .wrongPlace
                       used[j] = true
                   }
               }
            }
    }
        
        
        
        return codes
        
    }
    
    func processGuess(g : String){
        leterStates.append(getGuessResults(guess: g))
        guesses.append(g)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

