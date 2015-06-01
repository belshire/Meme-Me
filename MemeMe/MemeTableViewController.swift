//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Blake Elshire on 5/27/15.
//  Copyright (c) 2015 Blake Elshire. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var memes: [Meme]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as AppDelegate
        memes = appDelegate.memes
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeCell") as MemeTableViewCell
        let meme = self.memes[indexPath.row]
        
        // Set the name and image
        cell.memeLabel?.text = meme.topText
        cell.memeImageView?.image = meme.memedImage
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Grab the DetailVC from Storyboard
        let object:AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailVC")!
        
        let detailVC = object as MemeDetailViewController
        //Populate view controller with data from the selected item
        detailVC.meme = self.memes[indexPath.row]
        
        //Present the view controller using navigation
        self.navigationController!.pushViewController(detailVC, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
}