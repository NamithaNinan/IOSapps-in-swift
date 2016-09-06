//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Namitha Ninan on 9/5/16.
//  Copyright © 2016 namithaninan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameActive = true
    var activePlayer = 1 // 1- noughts, 2 - cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    @IBAction func playAgainButton(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activePlayer = 1
        gameActive = true
        label.hidden = true
        label.center = CGPointMake(label.center.x-500, label.center.y)
        playAgain.hidden = true
        playAgain.center = CGPointMake(label.center.x-500, label.center.y)
        var buttonToClear : UIButton
        
        for (var i = 0; i < 9; i++){
            buttonToClear = view.viewWithTag(i) as! UIButton// setting this button as the button which has that tag
            buttonToClear.setImage(nil, forState: .Normal)
        }
    }
    
    func endGame() {
        label.hidden = false
        
        playAgain.hidden = false
        
        UIView.animateWithDuration(0.5, animations: {
            self.label.center = CGPointMake(self.label.center.x+500, self.label.center.y)
            
            self.playAgain.center = CGPointMake(self.playAgain.center.x+500, self.label.center.y)
        })
    }
    
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonPressed(sender: AnyObject) {
        if (gameState[sender.tag] == 0 && gameActive == true){
        if(activePlayer == 1){
            sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
            activePlayer = 2
            gameState[sender.tag]=activePlayer
        }else {
            sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            activePlayer = 1
            gameState[sender.tag]=activePlayer
            }
            
            
            for combination in winningCombination{
                if(gameState[combination[0]] != 0 && gameState[combination[0]]==gameState[combination[1]] && gameState[combination[1]]==gameState[combination[2]]){
                    if ( gameState[combination[0]] == 1){
                        label.text = "cross has won !"
                        gameActive = false
                    }else{
                        label.text = "noughts has won !"
                        gameActive = false
                    }
                    endGame()
              
                }
            }
            if gameActive == true {
                gameActive = false
                for buttonState in gameState{
                    if buttonState == 0 {
                        gameActive = true
                    }
                }
                if gameActive == false {
                    label.text = " It is a draw !"
                    gameActive = false
                    endGame()
                }
            }
        }
        
    }
    
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.hidden = true
        label.center = CGPointMake(label.center.x-500, label.center.y)
        playAgain.hidden = true
        playAgain.center = CGPointMake(label.center.x-500, label.center.y)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

