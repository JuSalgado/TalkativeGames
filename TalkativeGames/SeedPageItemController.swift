//
//  SeedPageItemController.swift
//  TalkativeGames
//
//  Created by Juliana Salgado on 15/04/15.
//  Copyright (c) 2015 Juliana Salgado. All rights reserved.
//

import UIKit

class SeedPageItemController: UIViewController {
    
    @IBOutlet weak var finishInfo: UIButton!
    
    @IBOutlet weak var infoImage: UIImageView!
    
    var lastPage: Int?
    var pageIndex : Int?
    var imageName : String!
    
    var gameViewController : UIViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoImage.image = UIImage(named: imageName)
        
        println("Pagina \(pageIndex) ultima \(lastPage)")
        var lastPageIndex : Int? = lastPage! - 1
        if(lastPageIndex == pageIndex){
            finishInfo.enabled = true
            finishInfo.hidden = false
        }else{
            finishInfo.enabled = false
            finishInfo.hidden = true
        }
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
