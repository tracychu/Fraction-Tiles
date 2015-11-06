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
    var posWidth: [CGFloat] = []
    var fractionTileViews = [UIView]()
    var setMaxX: CGFloat!
    var sumOfWidth: CGFloat!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inithalfTile = halfTile.center
        initquarterTile = quarterTile.center
        initoneEighthTile = oneEighthTile.center
        tilePos = 0
        
        sumOfWidth = 0.0
        setMaxX = 0.0
        print("Here view didload :\(inithalfTile.x) \(inithalfTile.y)")
        
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
            
                    if self.tilePos == 0 {
                        self.posWidth.append(self.halfTile.frame.width)
                        self.fractionTileViews.append(self.halfTile)
                        
                    self.halfTile.frame.origin = self.problemTile.frame.origin
                        
                    } else {
                        self.sumOfWidth = 0
                        for (var i = 0; i < self.posWidth.count ; i++) {
                            self.sumOfWidth = self.sumOfWidth+self.posWidth[i]
                        }
                        
                        self.halfTile.frame.origin = CGPoint(x: self.problemTile.frame.origin.x + self.sumOfWidth, y:
                            self.problemTile.frame.minY)
                            self.posWidth.append(self.halfTile.frame.width)
                        self.fractionTileViews.append(self.halfTile)
                    }
                    self.tilePos = self.tilePos+1
                   
                   // self.posWidth[self.tilePos] = self.halfTile.frame.width
            })
                
            } else {
                UIView.animateWithDuration(0.6, animations: { () -> Void in
                    for (var i = 0; i < self.posWidth.count ; i++) {
                        if (self.posWidth[i]) == self.halfTile.frame.width {
                            self.posWidth.removeAtIndex(i)
                            self.fractionTileViews.removeAtIndex(i)
                            self.tilePos = self.tilePos - 1
                            
                            for (var j = i ; j < self.fractionTileViews.count; j++){
                                
                               self.fractionTileViews[j].frame.origin = CGPoint(x: self.fractionTileViews[j].frame.origin.x - self.halfTile.frame.width, y: self.problemTile.frame.minY)
                            }
                    
                        }
                        
                    }
                   // self.halfTile.removeFromSuperview()
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
               // self.problemTile.addSubview(self.quarterTile)
                self.sumOfWidth = 0.0
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    if (self.tilePos == 0) {
                        self.quarterTile.frame.origin = self.problemTile.frame.origin
                        self.posWidth.append(self.quarterTile.frame.width)
                        self.fractionTileViews.append(self.quarterTile)

                    } else {
                        for (var i = 0; i < self.posWidth.count ; i++) {
                            self.sumOfWidth = self.sumOfWidth+self.posWidth[i]
                        }
                        
                        
                        self.quarterTile.frame.origin = CGPoint(x: self.problemTile.frame.origin.x + self.sumOfWidth, y:
                            self.problemTile.frame.minY)
                        self.posWidth.append(self.quarterTile.frame.width)
                        self.fractionTileViews.append(self.quarterTile)
                       
                        

                    }
                    
                    
                })
                self.tilePos = self.tilePos+1
                
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.quarterTile.center = self.initquarterTile
                })
                for (var i = 0; i < self.posWidth.count ; i++) {
                    if (self.posWidth[i]) == self.quarterTile.frame.width {
                        self.posWidth.removeAtIndex(i)
                        self.fractionTileViews.removeAtIndex(i)
                        self.tilePos = self.tilePos - 1
                        
                        for (var j = i ; j < self.fractionTileViews.count; j++){
                            self.fractionTileViews[j].frame.origin = CGPoint(x: self.fractionTileViews[j].frame.origin.x - self.quarterTile.frame.width, y: self.problemTile.frame.minY)
                        }
                        
                    }
                }
                
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
                    
                    //self.problemTile.addSubview(self.oneEighthTile)
                    self.oneEighthTile.frame.origin = CGPoint(x: self.quarterTile.frame.maxX, y: self.quarterTile.frame.minY)
                    
                    if (self.tilePos == 0) {
                        self.oneEighthTile.frame.origin = self.problemTile.frame.origin
                       self.posWidth.append(self.oneEighthTile.frame.width)
                        self.fractionTileViews.append(self.oneEighthTile)
                    } else {
                        self.sumOfWidth = 0
                        for (var i = 0; i < self.posWidth.count ; i++) {
                            self.sumOfWidth = self.sumOfWidth+self.posWidth[i]
                        }
                        
                        self.oneEighthTile.frame.origin = CGPoint(x: self.problemTile.frame.origin.x + self.sumOfWidth, y:
                            self.problemTile.frame.minY)
                        self.posWidth.append(self.oneEighthTile.frame.width)
                        self.fractionTileViews.append(self.oneEighthTile)
                        
                    }
                    
                })
                self.tilePos = self.tilePos+1
                
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.oneEighthTile.center = self.initoneEighthTile
                })
                for (var i = 0; i < self.posWidth.count ; i++) {
                    if (self.posWidth[i]) == self.oneEighthTile.frame.width {
                        self.posWidth.removeAtIndex(i)
                        self.tilePos = self.tilePos - 1
                        print("Value of index \(i)")
                        self.fractionTileViews.removeAtIndex(i)
                    
                    print("Value of fractionTileView index \(self.fractionTileViews.count)")
                        for (var j = i ; j < self.fractionTileViews.count; j++){
                        
                            self.fractionTileViews[j].frame.origin = CGPoint(x: self.fractionTileViews[j].frame.origin.x - self.oneEighthTile.frame.width, y: self.problemTile.frame.minY)
                        }
                    }
                    
                    
                    
                }
                
            }
        }
        
        
    }
    
    
    
    
    


}

