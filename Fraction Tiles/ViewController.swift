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
    var SolRect: CGRect!
    var tilePos: Int!
    var posWidth: Array<CGFloat>!
    var setMaxX: CGFloat!
    var sumOfWidth: CGFloat!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inithalfTile = halfTile.center
        initquarterTile = quarterTile.center
        initoneEighthTile = oneEighthTile.center
        tilePos = 0
        posWidth = [0,0,0,0,0,0,0,0]
        sumOfWidth = 0.0
        print("Here view didload")
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
                print("Here \(tilePos)")
           
                UIView.animateWithDuration(0.6, animations: { () -> Void in
            
                    if self.tilePos == 0 {
                        //self.posWidth[self.tilePos] = self.halfTile.frame.width
                        self.posWidth.append(self.halfTile.frame.width)
                    self.problemTile.addSubview(self.halfTile)
                    self.halfTile.frame.origin = self.problemTile.bounds.origin
                        
                    } else {
                        
                        for (var i = 0; i <= self.tilePos; i++) {
                            self.sumOfWidth = self.sumOfWidth+self.posWidth[i]
                            
                        }
                        print("Total Width :\(self.sumOfWidth)")
                        print("Problem Tile Width :\(self.problemTile.frame.origin.x)")
                     self.setMaxX = self.problemTile.frame.origin.x + self.sumOfWidth
                        self.halfTile.frame.origin = CGPoint(x: self.setMaxX, y:
                            self.problemTile.frame.height)
                    }
                    
                    self.tilePos = self.tilePos+1
                    
            })
                
            } else {
                UIView.animateWithDuration(0.6, animations: { () -> Void in
                    self.halfTile.center = self.inithalfTile
                    
                })
               // halfTile.removeFromSuperview()
                print("HalfTile removed from problemTile")
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
                self.problemTile.addSubview(self.quarterTile)
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.quarterTile.frame.origin = self.problemTile.bounds.origin
                    self.posWidth[self.tilePos] = self.quarterTile.frame.width
                    print("After addiing quarter tile Width :\(self.quarterTile.frame.width)")
                })
                self.tilePos = self.tilePos+1
                
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

