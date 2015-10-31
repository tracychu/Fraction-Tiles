//
//  FractionTilesver2ViewController.swift
//  Fraction Tiles
//
//  Created by Deepak Deshpande on 10/31/15.
//  Copyright © 2015 Tracy Chu. All rights reserved.
//

import UIKit

class FractionTilesver2ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageViewArray = Array<UIImageView>()
    
    var i = 0
    
    var newOrigin_X: CGFloat = 0.0
    
    var puzzleView: UIImageView!
    
    var puzzleLabel: UILabel!
    
    var puzzleWidth: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        puzzleView = UIImageView(frame: CGRectMake(20,50,280,50))
        puzzleLabel = UILabel(frame: CGRectMake(0, 0, 40, 50))
        setPuzzle(0, 1)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func drawRectangle(origin_X: CGFloat, _ origin_Y: CGFloat,  _ width: CGFloat, _ height: CGFloat, _ labelText: String){
        
        // print("New X: \(newOrigin_X)")
        
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 280, height: 50), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        let rectangle = CGRect(x: origin_X, y: 0, width: width, height: height)
        
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 1)
        CGContextAddRect(context, rectangle)
        CGContextDrawPath(context, .FillStroke)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        //Create an UIImageView Array
        imageViewArray.append(UIImageView(frame:CGRectMake(20, 100, 280, 50)))
        var newImageView = imageViewArray[i]
        newImageView.image = img
        var label = UILabel(frame: CGRectMake(origin_X + width/2 - 10, 12.5, 30, 25))
        label.text = labelText
        newImageView.addSubview(label)
        view.addSubview(newImageView)
        
        i+=1
        
    }
    
    
    func setPuzzle(x: Int, _ y:Int){
        clearPuzzle()
        puzzleWidth = CGFloat(280*x/y)
        
        print("Puzzle Width: \(puzzleWidth)")
        
        
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 280, height: 50), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        var rectangle = CGRect(x: 0, y: 0, width: puzzleWidth, height: 50)
        
        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 1)
        CGContextAddRect(context, rectangle)
        CGContextDrawPath(context, .FillStroke)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        puzzleView.image = img
        puzzleLabel = UILabel(frame: CGRectMake(CGFloat((puzzleWidth/2)-10), 0, 40, 50))
        puzzleLabel.textColor = UIColor.whiteColor()
        
        puzzleLabel.text = String(x) + "/" + String(y)
        puzzleView.addSubview(puzzleLabel)
        view.addSubview(puzzleView)
    }
    
    
    
    
    @IBAction func didPressPlayAgain(sender: UIButton) {
        var y = Int(arc4random_uniform(10))
        var x = Int(arc4random_uniform(UInt32(y)))
        
        if( x == 0 || y == 0){
            x = 1
            y = 1
        }
        print("X, Y: \(x), \(y)")
        clearPuzzle()
        setPuzzle(x, y)
        
    }
    
    
    @IBAction func onPress1By2(sender: UIButton) {
        drawRectangle(newOrigin_X, 0, 280/2, 50, "1/2")
        newOrigin_X = newOrigin_X + 280/2
        checkAnswer()
        
    }
    
    
    @IBAction func onPress1by3(sender: UIButton) {
        drawRectangle(newOrigin_X, 0, 280/3, 50, "1/3")
        newOrigin_X = newOrigin_X + 280/3
        checkAnswer()
    }
    
    
    
    @IBAction func onPress1By4(sender: UIButton) {
        drawRectangle(newOrigin_X, 0, 280/4, 50, "1/4")
        newOrigin_X = newOrigin_X + 280/4
        checkAnswer()
    }
    
    
    @IBAction func onPress1By5(sender: AnyObject) {
        drawRectangle(newOrigin_X, 0, 280/5, 50, "1/5")
        newOrigin_X = newOrigin_X + 280/5
        checkAnswer()
    }
    
    
    
    @IBAction func onPress1By6(sender: UIButton) {
        drawRectangle(newOrigin_X, 0, 280/6, 50, "1/6")
        newOrigin_X = newOrigin_X + 280/6
        checkAnswer()
    }
    
    
    @IBAction func onPress1By9(sender: UIButton) {
        drawRectangle(newOrigin_X, 0, 280/9, 50, "1/9")
        newOrigin_X = newOrigin_X + 280/9
        checkAnswer()
    }
    
    
    @IBAction func onPress1by8(sender: UIButton) {
        drawRectangle(newOrigin_X, 0, 280/8, 50, "1/8")
        newOrigin_X = newOrigin_X + 280/8
        checkAnswer()
    }
    
    
    
    @IBAction func onPress1by7(sender: UIButton) {
        drawRectangle(newOrigin_X, 0, 280/7, 50, "1/7")
        newOrigin_X = newOrigin_X + 280/7
        checkAnswer()
    }
    
    func checkAnswer(){
        print("In Check Answer")
        print("    New Origin X: \(newOrigin_X)")
        print("    puzzleWidth: \(puzzleWidth)")
        
        if(newOrigin_X > 280 || Int(newOrigin_X) > Int(puzzleWidth))
        {
            let alertWrong = UIAlertView()
            alertWrong.title = "Oops!!!"
            alertWrong.message = "Sorry. That's the wrong answer"
            alertWrong.addButtonWithTitle("OK")
            alertWrong.show()
        }
        else if(Int(newOrigin_X) == Int(puzzleWidth)) {
            let alertRight = UIAlertView()
            alertRight.title = "Congratulations"
            alertRight.message = "That's the right Answer"
            alertRight.addButtonWithTitle("OK")
            alertRight.show()
        }
    }
    
    
    func clearPuzzle(){
        puzzleView.removeFromSuperview()
        puzzleLabel.removeFromSuperview()
        for var x = 0; x < i; x++
        {
            print("Clearing solution Image view: \(x)")
            imageViewArray[x].removeFromSuperview()
        }
        newOrigin_X = 0
    }
    
    func clearSolution(){
        for var x = 0; x < i; x++
        {
            print("Clearing solution Image view: \(x)")
            imageViewArray[x].removeFromSuperview()
        }
        newOrigin_X = 0
    }
    
    @IBAction func didPressTryAgain(sender: UIButton) {
        clearSolution()
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
