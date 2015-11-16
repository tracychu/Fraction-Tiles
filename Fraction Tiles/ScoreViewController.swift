//
//  ScoreViewController.swift
//  Fraction Tiles
//
//  Created by Promeet Mansata on 11/12/15.
//  Copyright © 2015 Tracy Chu. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var yourScore: UILabel!
    
    @IBOutlet weak var youdidit: UIImageView!
    
    var YouDidItImage1: UIImage!
    var YouDidItImage2: UIImage!
    var YouDidItImage3: UIImage!
    var YouDidItImage4: UIImage!
    var YouDidItArray: [UIImage]!
    var randomImage: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var row2 = 0
        var row3 = 0
        var row4 = 0
        var row5 = 0
        var row6 = 0
        var row7 = 0
        var row8 = 0
        var row9 = 0
        var row10 = 0
        let imageOffset = CGFloat(215)
       
        YouDidItImage1 = UIImage(named: "YouDidIt")
        YouDidItImage2 = UIImage(named: "YouDidIt_2")
        YouDidItImage3 = UIImage(named: "YouDidIt_5")
        YouDidItImage4 = UIImage(named: "YouDidIt_6")
        
        YouDidItArray = [YouDidItImage1,YouDidItImage2,YouDidItImage3,YouDidItImage4]
        
        randomImage = Int(arc4random_uniform(UInt32(YouDidItArray.count)))
        
            print("You are here")
        
            youdidit.image = YouDidItArray[randomImage]
        
            let defaults = NSUserDefaults.standardUserDefaults()
            let ecount1 = defaults.integerForKey("correctScore")
            print(ecount1)
        
        
            let ecount = integer_t(ecount1-1)
            let ecountNS = ecount1 as NSNumber
            yourScore.text = ecountNS.stringValue
            
            for i in 0...ecount {
                print(i)
                
                if CGFloat(i) <= 5
                {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: "Emoji.png")
                    imageView.frame = CGRect(x: CGFloat(i) * (imageView.image!.size.width + 10), y: imageOffset , width: imageView.image!.size.width, height: imageView.image!.size.height)
                    view.addSubview(imageView)
                }
                    
                else if  CGFloat(i) > 5 && CGFloat(i) <= 11
                {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: "Emoji.png")
                    imageView.frame = CGRect(x: CGFloat(row2) * (imageView.image!.size.width + 10), y: imageOffset+50 , width: imageView.image!.size.width, height: imageView.image!.size.height)
                    view.addSubview(imageView)
                    row2 = row2 + 1
                }
                    
                else if  CGFloat(i) > 11 && CGFloat(i) <= 17
                {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: "Emoji.png")
                    imageView.frame = CGRect(x: CGFloat(row3) * (imageView.image!.size.width + 10), y: imageOffset+100 , width: imageView.image!.size.width, height: imageView.image!.size.height)
                    view.addSubview(imageView)
                    row3 = row3 + 1
                }
                    
                else if  CGFloat(i) > 17 && CGFloat(i) <= 23
                {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: "Emoji.png")
                    imageView.frame = CGRect(x: CGFloat(row4) * (imageView.image!.size.width + 10), y: imageOffset+150, width: imageView.image!.size.width, height: imageView.image!.size.height)
                    view.addSubview(imageView)
                    row4 = row4 + 1
                }
                    
                else if  CGFloat(i) > 23 && CGFloat(i) <= 29
                {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: "Emoji.png")
                    imageView.frame = CGRect(x: CGFloat(row5) * (imageView.image!.size.width + 10), y: imageOffset+200, width: imageView.image!.size.width, height: imageView.image!.size.height)
                    view.addSubview(imageView)
                    row5 = row5 + 1
                }
                    
                else if  CGFloat(i) > 29 && CGFloat(i) <= 35
                {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: "Emoji.png")
                    imageView.frame = CGRect(x: CGFloat(row6) * (imageView.image!.size.width + 10), y: imageOffset+250, width: imageView.image!.size.width, height: imageView.image!.size.height)
                    view.addSubview(imageView)
                    row6 = row6 + 1
                }
                    
                else if  CGFloat(i) > 35 && CGFloat(i) <= 41
                {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: "Emoji.png")
                    imageView.frame = CGRect(x: CGFloat(row7) * (imageView.image!.size.width + 10), y: imageOffset+300, width: imageView.image!.size.width, height: imageView.image!.size.height)
                    view.addSubview(imageView)
                    row7 = row7 + 1
                }
                else if  CGFloat(i) > 41 && CGFloat(i) <= 47
                {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: "Emoji.png")
                    imageView.frame = CGRect(x: CGFloat(row8) * (imageView.image!.size.width + 10), y: imageOffset+350, width: imageView.image!.size.width, height: imageView.image!.size.height)
                    view.addSubview(imageView)
                    row8 = row8 + 1
                }
                else if  CGFloat(i) > 47 && CGFloat(i) <= 53
                {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: "Emoji.png")
                    imageView.frame = CGRect(x: CGFloat(row9) * (imageView.image!.size.width + 10), y: imageOffset+400, width: imageView.image!.size.width, height: imageView.image!.size.height)
                    view.addSubview(imageView)
                    row9 = row9 + 1
                }
                else if  CGFloat(i) > 53 && CGFloat(i) <= 59
                {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: "Emoji.png")
                    imageView.frame = CGRect(x: CGFloat(row10) * (imageView.image!.size.width + 10), y: imageOffset+450, width: imageView.image!.size.width, height: imageView.image!.size.height)
                    view.addSubview(imageView)
                    row10 = row10 + 1
                }
            }
            
        }


    @IBAction func onButtonPress(sender: AnyObject) {
    performSegueWithIdentifier("PlayAgainSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    

}
