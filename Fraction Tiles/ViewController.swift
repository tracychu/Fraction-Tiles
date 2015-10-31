//
//  ViewController.swift
//  FracTiles
//
//  Created by Ajay Gopalkrishna on 10/28/15.
//  Copyright © 2015 Ajay Gopalkrishna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var problemTile: UIView!
    
    @IBOutlet weak var halfTile: UIView!
    var inithalfTile: CGPoint!
    
    @IBOutlet weak var quarterTile: UIView!
    var initquarterTile: CGPoint!
    
    @IBOutlet weak var oneEighthTile: UIView!
    var initoneEighthTile: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inithalfTile = halfTile.center
        initquarterTile = quarterTile.center
        initoneEighthTile = oneEighthTile.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onhalfTilePan(sender: AnyObject) {
        // Absolute (x,y) coordinates in parent view
        let halfTileLocation = sender.locationInView(halfTile)
        
        // Relative change in (x,y) coordinates from where gesture began.
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            //print("Gesture began at: \(messageLocation)")
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            UIView.animateWithDuration(0.6, animations: { () -> Void in
                self.halfTile.center = CGPoint(x: self.inithalfTile.x+translation.x, y: self.inithalfTile.y+translation.y)
            })
            
            
          
             } else if sender.state == UIGestureRecognizerState.Ended {
            
            
            if problemTile.frame.contains(halfTile.frame.origin) {
           
                UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.halfTile.frame.origin = self.problemTile.frame.origin
            })
            
                
            } else {
                UIView.animateWithDuration(0.6, animations: { () -> Void in
                    self.halfTile.center = self.inithalfTile
                })
                
            }
        }
    }
    
    
    @IBAction func onquarterTilePan(sender: AnyObject) {
        // Absolute (x,y) coordinates in parent view
        let halfTileLocation = sender.locationInView(halfTile)
        
        // Relative change in (x,y) coordinates from where gesture began.
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            //print("Gesture began at: \(messageLocation)")
           // initquarterTile = quarterTile.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            quarterTile.center = CGPoint(x: initquarterTile.x+translation.x, y: initquarterTile.y+translation.y)
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            
            if problemTile.frame.contains(quarterTile.frame.origin) {
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.quarterTile.frame.origin = CGPoint(x: self.halfTile.frame.maxX, y: self.halfTile.frame.minY)
                })
                
                
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.quarterTile.center = self.initquarterTile
                })
                
            }
        }
    }
    
    
    @IBAction func onOneEighthTilePan(sender: AnyObject) {
        // Absolute (x,y) coordinates in parent view
        let halfTileLocation = sender.locationInView(halfTile)
        
        // Relative change in (x,y) coordinates from where gesture began.
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            //print("Gesture began at: \(messageLocation)")
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            oneEighthTile.center = CGPoint(x: initoneEighthTile.x+translation.x, y: initoneEighthTile.y+translation.y)
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            
            if problemTile.frame.contains(oneEighthTile.frame.origin) {
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.oneEighthTile.frame.origin = CGPoint(x: self.quarterTile.frame.maxX, y: self.quarterTile.frame.minY)
                })
                
                
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.oneEighthTile.center = self.initoneEighthTile
                })
                
            }
        }
        
        
    }
    
    
    
    
    


}

