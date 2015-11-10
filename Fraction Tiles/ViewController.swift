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
                        
                  //  self.problemTile.addSubview(self.halfTile)
                    self.halfTile.frame.origin = self.problemTile.frame.origin
                        
                    } else {
                        self.sumOfWidth = 0
                        for (var i = 0; i < self.posWidth.count ; i++) {
                            self.sumOfWidth = self.sumOfWidth+self.posWidth[i]
                        }
                        print("problemTile Origin : \(self.problemTile.frame.origin.x)")
                        print("Sum Of Width : \(self.sumOfWidth)")
                        
                        self.halfTile.frame.origin = CGPoint(x: self.problemTile.frame.origin.x + self.sumOfWidth, y:
                            self.problemTile.frame.minY)
                            self.posWidth.append(self.halfTile.frame.width)
                    }
                    self.tilePos = self.tilePos+1
                   
                   // self.posWidth[self.tilePos] = self.halfTile.frame.width
            })
                
            } else {
                UIView.animateWithDuration(0.6, animations: { () -> Void in
                    for (var i = 0; i < self.posWidth.count ; i++) {
                        if (self.posWidth[i]) == self.halfTile.frame.width {
                            self.posWidth.removeAtIndex(i)
                            self.tilePos = self.tilePos - 1
                    
                        }
                        
                    }
                   // self.halfTile.removeFromSuperview()
                    self.halfTile.center = self.inithalfTile
                    print("Removed from problemTile :\(self.halfTile.center.x) \(self.halfTile.center.y)")
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
               // self.problemTile.addSubview(self.quarterTile)
                self.sumOfWidth = 0.0
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    if (self.tilePos == 0) {
                        self.quarterTile.frame.origin = self.problemTile.frame.origin
                        self.posWidth.append(self.quarterTile.frame.width)
                    } else {
                        for (var i = 0; i < self.posWidth.count ; i++) {
                            self.sumOfWidth = self.sumOfWidth+self.posWidth[i]
                        }
                        
                        print("X Y Pos after adding quarter tile :\(self.setMaxX), \(self.problemTile.frame.minY)")
                        print("sumOfWidth quarter tile :\(self.sumOfWidth)")
                        
                        self.quarterTile.frame.origin = CGPoint(x: self.problemTile.frame.origin.x + self.sumOfWidth, y:
                            self.problemTile.frame.minY)
                        self.posWidth.append(self.quarterTile.frame.width)

                    }
                    
                    print("After addiing quarter tile Width :\(self.quarterTile.frame.width)")
                })
                self.tilePos = self.tilePos+1
                
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.quarterTile.center = self.initquarterTile
                })
                for (var i = 0; i < self.posWidth.count ; i++) {
                    if (self.posWidth[i]) == self.quarterTile.frame.width {
                        self.posWidth.removeAtIndex(i)
                        self.tilePos = self.tilePos - 1
                        
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
                    } else {
                        self.sumOfWidth = 0
                        for (var i = 0; i < self.posWidth.count ; i++) {
                            self.sumOfWidth = self.sumOfWidth+self.posWidth[i]
                        }
                        
                        self.oneEighthTile.frame.origin = CGPoint(x: self.problemTile.frame.origin.x + self.sumOfWidth, y:
                            self.problemTile.frame.minY)
                        self.posWidth.append(self.oneEighthTile.frame.width)
                        
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
                    }
                }
                
            }
        }
        
        
    }
    
    
    
    
    


}

