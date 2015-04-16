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
    
    init( imageName: String , position : CGRect ) {
        self.cardImageName = imageName
        self.cardPosition = position
    }
    
}
