//
//  SeedBoard.swift
//  TalkativeGames
//
//  Created by Elias Ayache on 16/04/15.
//  Copyright (c) 2015 Juliana Salgado. All rights reserved.
//

import UIKit

class SeedBoard: NSObject {
   
    var seedCard : SeedCard!
    var boardIndice : Int
    
    init(seedCard: SeedCard , indice : Int) {
        self.seedCard = seedCard
        self.boardIndice = indice
    }
}
