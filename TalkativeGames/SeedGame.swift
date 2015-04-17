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
    var imageClicked : String = ""
    
    @IBOutlet weak var fourthBoard: UIButton!
    @IBOutlet weak var thirdBoard: UIButton!
    @IBOutlet weak var secondBoard: UIButton!
    @IBOutlet weak var firstBoard: UIButton!
    
    @IBOutlet weak var fourthCard: UIButton!
    @IBOutlet weak var thirdCard: UIButton!
    @IBOutlet weak var secondCard: UIButton!
    @IBOutlet weak var firstCard: UIButton!
    
    //init data
    func initObjects(){
        
        
        //set cards
        firstCardModel = SeedCard(imageName: "one.png")
        secCardModel = SeedCard(imageName: "two.png")
        thirdCardModel = SeedCard(imageName: "three.png")
        fourthCardModel = SeedCard(imageName: "four.png")
        
        //set card images - view
        
        //TODO: make randomic cards images so it isn't always the same and the pacient doesn't memorize
        
        firstCard.setImage(UIImage(named: firstCardModel!.cardImageName) as UIImage?, forState: UIControlState.Normal)
        firstCard.imageView?.image!.accessibilityIdentifier = firstCardModel?.cardImageName
        
        secondCard.setImage(UIImage(named: secCardModel!.cardImageName) as UIImage?, forState: UIControlState.Normal)
        secondCard.imageView?.image!.accessibilityIdentifier = secCardModel?.cardImageName
        
        thirdCard.setImage(UIImage(named: thirdCardModel!.cardImageName) as UIImage?, forState: UIControlState.Normal)
        thirdCard.imageView?.image!.accessibilityIdentifier = thirdCardModel?.cardImageName
        
        fourthCard.setImage(UIImage(named: fourthCardModel!.cardImageName) as UIImage?, forState: UIControlState.Normal)
        fourthCard.imageView?.image!.accessibilityIdentifier = fourthCardModel?.cardImageName
        
        
        firstBoard.imageView?.image?.accessibilityIdentifier = ""
        secondBoard.imageView?.image?.accessibilityIdentifier = ""
        thirdBoard.imageView?.image?.accessibilityIdentifier = ""
        fourthBoard.imageView?.image?.accessibilityIdentifier = ""
        
        //so lets get the button properties by its tag
        /*for buttonsTags in 1...4 {
        
        //get the button
        var boardButton = self.view.viewWithTag(buttonsTags) as? UIButton
        boardButton!.imageView?.image!.accessibilityIdentifier = ""
        
        }*/
    }
    
    //action that manages board clicks
    @IBAction func clickedBoard(sender: AnyObject) {
        
        var boardClicked:UIButton = sender as! UIButton
        
        if boardClicked.currentImage == nil {
            
            //did I clicked on a card?
            if manipulateCard?.cardImageName != nil{
                //yes we did so set the board image with the card image
                boardClicked.setImage(UIImage(named: manipulateCard!.cardImageName) as UIImage?, forState: UIControlState.Normal)
                boardClicked.imageView?.image!.accessibilityIdentifier = manipulateCard?.cardImageName
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
    
    //Action that manages the game's cards
    @IBAction func clickedCard(sender: AnyObject) {
        
        var buttonClicked:UIButton = sender as! UIButton
        
        var imageClicked = buttonClicked.imageView?.image?.accessibilityIdentifier
        println("nome da imagem clicada \(imageClicked)")
        manipulateCard = SeedCard(imageName: imageClicked!)
    }
    
    // see how many cards the user made right
    @IBAction func finishGamePlay(sender: AnyObject) {
        
        var totalNeeded = 0; //to win need to have 4 images correct
        
        
        //all the board have image
        
        if verifyBoardCompleted(){
            
            //so lets get the button properties by its tag
            for buttonsTags in 1...4 {
                
                //get the button
                var boardButton = self.view.viewWithTag(buttonsTags) as? UIButton
                
                //get the card on its button
                var boardCardImage = boardButton!.imageView?.image?.accessibilityIdentifier
                var boardCard = SeedCard(imageName: boardCardImage!)
                
                switch buttonsTags {
                    
                    // first button needs image that the order number is one and so on
                case 1:
                    if boardCard.cardOrderNumber == 1{
                        totalNeeded++
                    }
                    
                    
                case 2:
                    if boardCard.cardOrderNumber == 2{
                        totalNeeded++
                    }
                case 3 :
                    if boardCard.cardOrderNumber == 3{
                        totalNeeded++
                    }
                case 4:
                    if boardCard.cardOrderNumber == 4{
                        totalNeeded++
                    }
                default :
                    println("error iterating board's tags")
                    
                }
                
            }
            
            if(totalNeeded == 4){
                println("Congratulations! 4 images correct!")
            }else {
                println("Sorry you loose! But try again you made \(4 - totalNeeded) images correct!")
            }
        }else{
            println("You need to choose all images before finish the game")
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
    
    // to finish the game we need one image on each board
    func verifyBoardCompleted() -> Bool{
        
        var totalNeeded = 0;
        
        if firstBoard.currentImage != nil{
            totalNeeded++
        }
        
        if secondBoard.currentImage != nil{
            totalNeeded++
        }
        
        if thirdBoard.currentImage != nil{
            totalNeeded++
        }
        
        if fourthBoard.currentImage != nil{
            totalNeeded++
        }
        
        if totalNeeded == 4{
            // the user selected all images
            return true
        }else{
            return false
        }
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
