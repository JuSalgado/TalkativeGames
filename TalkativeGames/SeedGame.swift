//
//  SeedGame.swift
//  TalkativeGames
//
//  Created by Juliana Salgado on 15/04/15.
//  Copyright (c) 2015 Juliana Salgado. All rights reserved.
//

import UIKit

class SeedGame: UIViewController {
   
    
    var firstCardModel : SeedCard? = nil
    var secCardModel : SeedCard? = nil
    var thirdCardModel : SeedCard? = nil
    var fourthCardModel : SeedCard? = nil
    
    //the card selected during the game
    var manipulateCard : SeedCard?=nil
    
    @IBOutlet weak var forthBoard: UIButton!
    @IBOutlet weak var thirdBoard: UIButton!
    @IBOutlet weak var secondBoard: UIButton!
    @IBOutlet weak var firstBoard: UIButton!
    
    @IBOutlet weak var fourthCard: UIButton!
    @IBOutlet weak var thirdCard: UIButton!
    @IBOutlet weak var secondCard: UIButton!
    @IBOutlet weak var firstCard: UIButton!
    
    
    //action that manages board clicks
    @IBAction func clickedBoard(sender: AnyObject) {
    
        var boardClicked:UIButton = sender as! UIButton

        if boardClicked.currentImage == nil {
            
            //did I clicked on a card?
            if manipulateCard?.cardImageName != nil{
                //yes we did so set the board image with the card image
                boardClicked.setImage(UIImage(named: manipulateCard!.cardImageName) as UIImage?, forState: UIControlState.Normal)
                hideCard()
                
            }else{
                // it means we clicked the board but didn't click on a card so there is nothing to do
                println(" card missing")
            }
            
        }else {
            // there is an image so lets show again the card and delete the board image
            boardClicked.setImage(nil, forState: UIControlState.Normal)
            showCardOnInicialPosition()
        }
        
    }
    
     //The user clicked on Board and already didn't have an image, so hide the card
    func hideCard(){
        
        switch manipulateCard!.cardOrderNumber{
        case 1:
            firstCard.hidden = true
            firstCard.enabled = false
        case 2:
            secondCard.hidden = true
            secondCard.enabled = false
        case 3:
            thirdCard.hidden = true
            thirdCard.enabled = false
        case 4:
            fourthCard.hidden = true
            fourthCard.enabled = false
        default:
            //nothing
            println("error hidding card")
            
        }
        
    }
    
    //The user clicked on Board and already had an image, so show it on the initial position
    func showCardOnInicialPosition(){
        switch manipulateCard!.cardOrderNumber{
        case 1:
            
            firstCard.hidden = false
            firstCard.enabled = true
        case 2:
            secondCard.hidden = false
            secondCard.enabled = true
        case 3:
            thirdCard.hidden = false
            thirdCard.enabled = true
        case 4:
            fourthCard.hidden = false
            fourthCard.enabled = true
        default:
            println("error showing card")
            
        }
    }
    
    
    //Action that manages the game's cards
    @IBAction func clickedCard(sender: AnyObject) {
    
         var buttonClicked:UIButton = sender as! UIButton
        
       //NAO CONSEGUI PEGAR O NOME DA IMAGEM associada ao botao
        manipulateCard = SeedCard(imageName: "meninao.png", position: sender.frame)
    }
    
    //init data
    func initObjects(){
        
        
        //set cards
        firstCardModel = SeedCard(imageName: "meninao.png", position: firstCard.frame)
        secCardModel = SeedCard(imageName: "background.png", position: secondCard.frame)
        thirdCardModel = SeedCard(imageName: "meninao.png", position: thirdCard.frame)
        fourthCardModel = SeedCard(imageName: "meninao.png", position: fourthCard.frame)
        
        //set card images - view
        
        //TODO: make randomic cards position so it isn't always the same and the pacient doesn't memorize
       
        fourthCard.setImage(UIImage(named: fourthCardModel!.cardImageName) as UIImage?, forState: UIControlState.Normal)
        secondCard.setImage(UIImage(named: secCardModel!.cardImageName) as UIImage?, forState: UIControlState.Normal)
        thirdCard.setImage(UIImage(named: thirdCardModel!.cardImageName) as UIImage?, forState: UIControlState.Normal)
        firstCard.setImage(UIImage(named: firstCardModel!.cardImageName) as UIImage?, forState: UIControlState.Normal)
        
        //TODO nao esta aparecendo a imagem no 4 mas eu acho que é problema no layout mesmo
    
    }
    
    @IBAction func finishGamePlay(sender: AnyObject) {
        
        var didWin = false
        var boardClicked:UIButton = sender as! UIButton
        
        //TODO obter nome da imagem associado ao botao
        let finishedCard = SeedCard(imageName: "meninao.png", position: boardClicked.frame)
        
        switch sender.tag{
        case 1:
            if(boardClicked.currentImage != nil && finishedCard.cardOrderNumber == 1){
              didWin = true
            }
        case 2:
            if(boardClicked.currentImage != nil && finishedCard.cardOrderNumber == 2){
                didWin = true
            }
        case 3:
            if(boardClicked.currentImage != nil && finishedCard.cardOrderNumber == 3){
                didWin = true
            }
        case 4:
            if(boardClicked.currentImage != nil && finishedCard.cardOrderNumber == 4){
                didWin = true
            }
        default:
            //nothing
            println("error calculating result")
            
        }
        
        println("You win : \(didWin)")

    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        initObjects()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
