//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Blake Elshire on 5/29/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController : UIViewController {
    
    @IBOutlet weak var memeViewer: UIImageView!
    var meme : Meme!
    
    override func viewWillAppear(animated: Bool) {

        if let memeImage = self.meme!.memedImage {
            memeViewer.image = memeImage
        }
        
    }
}