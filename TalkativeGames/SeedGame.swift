//
//  SeedGame.swift
//  TalkativeGames
//
//  Created by Juliana Salgado on 15/04/15.
//  Copyright (c) 2015 Juliana Salgado. All rights reserved.
//

import UIKit

class SeedGame: UIViewController {
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var firstBlock: UIImageView!
    
    @IBOutlet weak var text: UILabel!
    var location = CGPoint(x: 0,y: 0)
    /*
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch : UITouch! = touches.first as? UITouch
        
        location = touch.locationInView(self.view!)
        
        firstImage.center = location
    }
    */
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        var touch : UITouch! = touches.first as? UITouch
        
        location = touch.locationInView(self.view!)
        
        firstImage.center = location
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    
        
        if(CGRectIntersectsRect(firstImage.frame, firstBlock.frame))
        {
            text.text="a"
            //var touch : UITouch! = touches.first as? UITouch
            
            //location = touch.locationInView(self.view)
            
            firstImage.frame = firstBlock.frame
        }
        else
        {
            text.text="c"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        firstImage.center = CGPointMake(160, 330)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collision(){
        text.text="b"
        
        if(CGRectIntersectsRect(firstImage.frame, firstBlock.frame)==true)
        {
            text.text="a"
        }
        else
        {
            text.text="c"
        }
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
