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
    
    var firstBoardModel : SeedBoard? = nil
    var secBoardModel : SeedBoard? = nil
    var thirdBoardModel : SeedBoard? = nil
    var fourthBoardModel : SeedBoard? = nil
    
    @IBOutlet weak var forthBoard: UIButton!
    @IBOutlet weak var thirdBoard: UIButton!
    @IBOutlet weak var secondBoard: UIButton!
    @IBOutlet weak var firstBoard: UIButton!
    
    @IBOutlet weak var fourthCard: UIButton!
    @IBOutlet weak var thirdCard: UIButton!
    @IBOutlet weak var secondCard: UIButton!
    @IBOutlet weak var firstCard: UIButton!
    
    
    @IBAction func clickedBoard(sender: AnyObject) {
    
       //if imagem é vazia do botao add o card selecionado
           //add imagem
        //if tem imagem  volta imagem pra posição
        
        //hide no card selecionado
    
    }
    
    
    
    @IBAction func clickedCard(sender: AnyObject) {
    
        //verificar qual o card
    
    }
    
    func initObjects(){
        
        firstCardModel = SeedCard(imageName: "background.png", position: firstCard.frame)
        secCardModel = SeedCard(imageName: "background.png", position: secondCard.frame)
        thirdCardModel = SeedCard(imageName: "background.png", position: thirdCard.frame)
        fourthCardModel = SeedCard(imageName: "background.png", position: fourthCard.frame)
        
        // boards
        
        firstBoardModel = SeedBoard(seedCard: firstCardModel!, indice: 1)
        secBoardModel = SeedBoard(seedCard: secCardModel!, indice: 2)
        thirdBoardModel = SeedBoard(seedCard: thirdCardModel!, indice: 3)
        fourthBoardModel = SeedBoard(seedCard: fourthCardModel!, indice: 4)
    
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
