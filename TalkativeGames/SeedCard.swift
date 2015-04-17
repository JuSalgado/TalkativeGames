//
//  SeedCard.swift
//  TalkativeGames
//
//  Created by Elias Ayache on 16/04/15.
//  Copyright (c) 2015 Juliana Salgado. All rights reserved.
//

import UIKit

class SeedCard: NSObject {
   
    var cardImageName: String
    var cardPosition: CGRect
    var cardOrderNumber : Int {
             //according to image name we know its position on sequence
            get {
                switch self.cardImageName{
                case "background.png":
                    return 1
                case "meninao.png":
                    return 2
                case "teste3":
                    return 3
                case "teste4":
                    return 4
                default:
                    return 0
                }
            }
    }
    
    init( imageName: String , position : CGRect ) {
        self.cardImageName = imageName
        self.cardPosition = position
    }
    
    func findCardOrderByImageName(imageName: String) -> Int{
    
        switch imageName{
        case "background.png":
            return 1
        case "meninao.png":
            return 2
        case "teste3":
            return 3
        case "teste4":
            return 4
        default:
            return 0
        }
    }
    
}
