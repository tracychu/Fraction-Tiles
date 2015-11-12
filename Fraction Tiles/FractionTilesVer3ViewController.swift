//
//  FractionTilesVer3ViewController.swift
//  Fraction Tiles
//
//  Created by Deepak Deshpande on 11/7/15.
//  Copyright © 2015 Tracy Chu. All rights reserved.
//

import UIKit

class FractionTilesVer3ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var availableWidth: CGFloat = 320
    
    var imageViewArray = Array<UIImageView>()
    
    var i = 0
    
    var newOrigin_X: CGFloat = 0.0
    
    var puzzleView: UIImageView!
    
    var solutionButtonsView: UIImageView!
    
    var puzzleLabel: UILabel!
    
    var puzzleWidth: CGFloat!
    
    var randomFractionIndex: Int!
    
    var sampleSolutionOrigin_X: CGFloat = 20
    var sampleSolutionOrigin_Y: CGFloat = 80
    
    var initialSolutionButtonViewOrigin_X: CGFloat = 20
    var initialSolutionButtonViewOrigin_Y: CGFloat = 80
    
    var solutionButtonSeparatorY: CGFloat = 70
    var solutionButtonSeparatorX: CGFloat = 320 / 2 + 20
    
    var solutionOutlineOrigin_X: CGFloat = 20
    var solutionOutlineOrigin_Y: CGFloat = 130
    
    var viewTappedOrigin_X: CGFloat = 20
    var viewTappedOrigin_Y: CGFloat = 130

    
    var tagX: Int = 0
    var tagY: Int = 0
    var initLocations = Dictionary<Int, CGPoint>()
    
    var fractionArray = [String](count: 26, repeatedValue: "1/2")
    var sampleSolutionArray = [String](count: 26, repeatedValue: "1/2, 1/2")
    var solutionArray = [String](count: 26, repeatedValue: "1/2, 1/2")
    
    var sampleSolutionOulineView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        puzzleView = UIImageView(frame: CGRectMake(0,0, CGFloat(availableWidth),100))
        solutionButtonsView = UIImageView(frame: CGRectMake(0, 300, 415, 500))
        solutionButtonsView.backgroundColor = UIColor.lightGrayColor()
        
        initializeAllArrays()
        getSampleSolution()
        drawSolutionButtonViews()
        drawSolutionOutlineView()
        displayPuzzleStatement()
       
    }
    
    
    func initializeAllArrays(){
        
        fractionArray[0] = "5/6"
        sampleSolutionArray[0] = "1/6, 1/6, 1/6, 1,6, 1,6"
        solutionArray[0] = "1/2, 1/3, 1/4, 1/5, 1/6, 1/8, 1/12, 1/12"
        
        fractionArray[1] = "1/1"
        sampleSolutionArray[1] = "1"
        solutionArray[1] = "1/2, 1/2, 1/3, 1/4, 1/4, 1/6, 1/8, 1/10"
        
        fractionArray[2] = "1/1"
        sampleSolutionArray[2] = "1/1"
        solutionArray[2] = "1/2, 1/3, 1/3, 1/4, 1/6, 1/8, 1/12, 1/12"
        
        fractionArray[3] = "1/1"
        sampleSolutionArray[3] = "1/1"
        solutionArray[3] = "1/2, 1/3, 1/4, 1/5, 1/6, 1/8, 1/8, 1/10"
        
        fractionArray[4] = "1/2"
        sampleSolutionArray[4] = "1/2"
        solutionArray[4] = "1/3, 1/3, 1/4, 1/5, 1/8, 1/8, 1/10, 1/12"
        
        fractionArray[5] = "2/4"
        sampleSolutionArray[5] = "1/4, 1/4"
        solutionArray[5] = "1/3, 1/3, 1/4, 1/5, 1/5, 1/6, 1/6, 1/8"
        
        fractionArray[6] = "4/8"
        sampleSolutionArray[6] = "1/8, 1/8, 1/8, 1/8"
        solutionArray[6] = "1/3, 1/4, 1/5, 1/6, 1/6, 1/8, 1/10, 1/12"
        
        fractionArray[7] = "1/3"
        sampleSolutionArray[7] = "1/3"
        solutionArray[7] = "1/2, 1/4, 1/5, 1/6, 1/6, 1/8, 1/12, 1/12"
        
        fractionArray[8] = "2/3"
        sampleSolutionArray[8] = "1/3, 1/3"
        solutionArray[8] = "1/2, 1/3, 1/4, 1/5, 1/6, 1/6, 1/8, 1/12"
        
        fractionArray[9] = "2/3"
        sampleSolutionArray[9] = "1/3, 1/3"
        solutionArray[9] = "1/2, 1/3, 1/4, 1/6, 1/8, 1/10, 1/12, 1/12"
        
        fractionArray[10] = "1/4"
        sampleSolutionArray[10] = "1/4"
        solutionArray[10] = "1/2, 1/3, 1/5, 1/6, 1/6, 1/8, 1/8, 1/10"
        
        fractionArray[11] = "3/4"
        sampleSolutionArray[11] = "1/4, 1/4, 1/4"
        solutionArray[11] = "1/2, 1/3, 1/4, 1/5, 1/6, 1/8, 1/8, 1/10"
        
        fractionArray[12] = "1/5"
        sampleSolutionArray[12] = "1/5"
        solutionArray[12] = "1/3, 1/4, 1/6, 1/8, 1/10, 1/10, 1/12, 1/12"
        
        fractionArray[13] = "2/5"
        sampleSolutionArray[13] = "1/5, 1/5"
        solutionArray[13] = "1/3, 1/5, 1/6, 1/6, 1/8, 1/10, 1/10, 1/12"
        
        fractionArray[14] = "3/5"
        sampleSolutionArray[14] = "1/5, 1/5, 1/5"
        solutionArray[14] = "1/3, 1/4, 1/5, 1/5, 1/6, 1/8, 1/10, 1/10"
        
        fractionArray[15] = "4/5"
        sampleSolutionArray[15] = "1/5, 1/5, 1/5, 1/5"
        solutionArray[15] = "1/2, 1/5, 1/5, 1/6, 1/8, 1/8, 1/10, 1/10"
        
        fractionArray[16] = "1/6"
        sampleSolutionArray[16] = "1/6"
        solutionArray[16] = "1/4, 1/5, 1/8, 1/10, 1/0, 1/10, 1/12, 1/12"
        
        fractionArray[17] = "5/6"
        sampleSolutionArray[17] = "1/6, 1/6, 1/6, 1/6, 1/6"
        solutionArray[17] = "1/2, 1/3, 1/4, 1/4, 1/5, 1/6, 1/6, 1/8"
        
        fractionArray[18] = "3/8"
        sampleSolutionArray[18] = "1/8, 1/8, 1/8"
        solutionArray[18] = "1/2, 1/3, 1/4, 1/4, 1/5, 1/6, 1/6, 1/8"
        
        fractionArray[19] = "5/8"
        sampleSolutionArray[19] = "1/8, 1/8, 1/8, 1/8, 1/8"
        solutionArray[19] = "1/2, 1/3, 1/4, 1/4, 1/5, 1/8, 1/10, 1/12"
        
        fractionArray[20] = "7/8"
        sampleSolutionArray[20] = "1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8"
        solutionArray[20] = "1/2, 1/3, 1/4, 1/5, 1/6, 1/6,  1/8, 1/10"
        
        fractionArray[21] = "3/10"
        sampleSolutionArray[21] = "1/10, 1/10, 1/10"
        solutionArray[21] = "1/4, 1/5, 1/5, 1/6, 1/8, 1/10, 1/10, 1/12"
        
        fractionArray[22] = "7/10"
        sampleSolutionArray[22] = "1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10"
        solutionArray[22] = "1/2, 1/3, 1/4, 1/4, 1/6, 1/8, 1/10, 1/10"
        
        fractionArray[23] = "9/10"
        sampleSolutionArray[23] = "1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10"
        solutionArray[23] = "1/2, 1/3, 1/4, 1/4, 1/5, 1/5, 1/6, 1/6"
        
        fractionArray[24] = "5/12"
        sampleSolutionArray[24] = "1/12, 1/12, 1/12, 1/12, 1/12"
        solutionArray[24] = "1/3, 1/4, 1/5, 1/6, 1/8, 1/10, 1/12, 1/12"
        
        fractionArray[25] = "7/12"
        sampleSolutionArray[25] = "1/12, 1/12, 1/12, 1/12, 1/12, 1/12, 1/12"
        solutionArray[25] = "1/2, 1/3, 1/3, 1/3, 1/4, 1/6, 1/6, 1/12"
        
    }
    
    func resetSampleSolutionOrigin(){
        sampleSolutionOrigin_X = 20
        sampleSolutionOrigin_Y = 80
    }
    
    func resetSolutionButtonOrigin(){
        initialSolutionButtonViewOrigin_X = 20
        initialSolutionButtonViewOrigin_Y = 80
    }
    
    func resetViewTappedOrigin(){
        viewTappedOrigin_X = 20
        viewTappedOrigin_Y = 130
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayPuzzleStatement(){
        var puzzleStatement: UILabel!
        puzzleStatement = UILabel(frame: CGRectMake(20, 30, 380, 50))
        puzzleStatement.text = "Build " + fractionArray[randomFractionIndex] + ". See sample answer below"
        puzzleStatement.font = UIFont(descriptor: UIFontDescriptor(name: "Verdana", size: 18), size: 18)
        puzzleStatement.textColor = UIColor.blueColor()
        puzzleView.addSubview(puzzleStatement)
        
    }
    
    
    func getSampleSolution(){
        randomFractionIndex = Int(arc4random_uniform(UInt32(fractionArray.count)))
        
        var puzzleFraction = fractionArray[randomFractionIndex].componentsSeparatedByString("/")
        
        let numerator = CGFloat(NSNumberFormatter().numberFromString(puzzleFraction[0])!)
        let denominator = CGFloat(NSNumberFormatter().numberFromString(puzzleFraction[1])!)
        
        puzzleWidth = availableWidth * numerator / denominator
        
        print ("Puzzle Width: ", puzzleWidth)
        
        var tempSampSol = sampleSolutionArray[randomFractionIndex].componentsSeparatedByString(",")
        
        for temp_x in 0...tempSampSol.count - 1 {
            var m = getNumDen(tempSampSol[temp_x])
            //Convert m from String to CGFloat
            let x = CGFloat(NSNumberFormatter().numberFromString(m[0])!)
            let y = CGFloat(NSNumberFormatter().numberFromString(m[1])!)
            
            let imageName = getFractionImage(String(Int(x)), String(Int(y)))
            
            
            drawView(sampleSolutionOrigin_X, sampleSolutionOrigin_Y, availableWidth * x/y, 50, imageName, puzzleView, UIColor.redColor(), UIColor.blueColor().CGColor)
            
            sampleSolutionOrigin_X = sampleSolutionOrigin_X + availableWidth * x/y
        }
    
    }
    
    
    func drawSolutionButtonViews(){
        var solutionViews = solutionArray[randomFractionIndex].componentsSeparatedByString(",")
        
        for temp_x in 0...solutionViews.count - 1 {
            var m = getNumDen(solutionViews[temp_x])
            let x = CGFloat(NSNumberFormatter().numberFromString(m[0])!)
            let y = CGFloat(NSNumberFormatter().numberFromString(m[1])!)
            
            tagX = Int(x)
            tagY = Int(y)
            
            print("In drawSolutionButtonViews - X, Y", tagX, tagY)

            let imageName = getFractionImage(String(Int(x)), String(Int(y)))
            
            let solutionButtonViewOrigin_X = initialSolutionButtonViewOrigin_X + solutionButtonSeparatorX * CGFloat(temp_x % 2)
            
            let solutionButtonViewOrigin_Y = initialSolutionButtonViewOrigin_Y + solutionButtonSeparatorY * CGFloat(temp_x / 2)
            
            //print("Button X, Y ", "\(temp_x)", "\(solutionButtonViewOrigin_X)", "\(solutionButtonViewOrigin_Y)")

            
            drawView(solutionButtonViewOrigin_X, solutionButtonViewOrigin_Y, availableWidth * x/y, 50, imageName, solutionButtonsView ,UIColor.redColor(), UIColor.blueColor().CGColor)
            
            
        }
        
    }
    
    
    func drawSolutionOutlineView(){
        var solutionOutlineFraction = fractionArray[randomFractionIndex].componentsSeparatedByString("/")
        
        let x = CGFloat(NSNumberFormatter().numberFromString(solutionOutlineFraction[0])!)
        let y = CGFloat(NSNumberFormatter().numberFromString(solutionOutlineFraction[1])!)
        
        sampleSolutionOulineView = drawView(solutionOutlineOrigin_X, solutionOutlineOrigin_Y, availableWidth*x/y, 50, "", puzzleView , UIColor.whiteColor(), UIColor.blackColor().CGColor)
        
        print("Sample Solution outline view: ",sampleSolutionOulineView)
    }
    
    
    func getNumDen(fraction: String) -> [String] {
        let numDen = fraction.componentsSeparatedByString("/")
        return numDen
    }
    
    
    func drawView(origin_X: CGFloat, _ origin_Y: CGFloat, _ width: CGFloat, _ height: CGFloat, _ labelText: String, _ parentView: UIImageView , _ viewColor: UIColor, _ viewBorderColor: CGColor) -> UIView {
        
        let sampleSolutionView = UIImageView(frame: CGRectMake(origin_X, origin_Y, width, height))
        
        //sampleSolutionView.layer.borderWidth = 1
        //sampleSolutionView.layer.borderColor = viewBorderColor
        //sampleSolutionView.backgroundColor = viewColor
        
        //let label = UILabel(frame: CGRectMake(0, 12.5, 30, 20))
        //label.font = UIFont(name: label.font.fontName, size: 12)
        //label.textColor = UIColor.whiteColor()
        //label.text = labelText
        
        sampleSolutionView.image = UIImage(named: labelText)
        print(labelText)
        
        let solutionTapGestureRecognizer = UITapGestureRecognizer(target: self, action:Selector("solutionTapped:"))
        sampleSolutionView.userInteractionEnabled = true
        parentView.userInteractionEnabled = true
        sampleSolutionView.addGestureRecognizer(solutionTapGestureRecognizer)
        
        sampleSolutionView.tag = tagY
        
        //sampleSolutionView.addSubview(label)
        parentView.addSubview(sampleSolutionView)
        self.view.addSubview(parentView)
        initLocations.updateValue(sampleSolutionView.center, forKey: sampleSolutionView.tag)
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onTilePan:")
        sampleSolutionView.addGestureRecognizer(panGestureRecognizer)
        
        return sampleSolutionView
        
    }
    
    
    func solutionTapped(gestureRecognizer: UITapGestureRecognizer){
        print("Tapped on solution view: ", "\(gestureRecognizer.view)")
        
        let width = gestureRecognizer.view!.frame.width
        let tag = gestureRecognizer.view!.tag
        
        
        // Call your pangesturerecognizer function here
        
        print("\(gestureRecognizer.view!.frame.width)")
        
        let imageName = String("1_") + String(tag) + String(".png")
        
        drawView(viewTappedOrigin_X, viewTappedOrigin_Y, width, 50, imageName, puzzleView, UIColor.brownColor(), UIColor.whiteColor().CGColor)
        gestureRecognizer.view?.removeFromSuperview()
        
        // End calling your function
        
        viewTappedOrigin_X = viewTappedOrigin_X + width
        
        checkAnswer()
    }
    
    
    
    
    
    @IBAction func didPressPlayAgain(sender: UIButton) {
        
        print("Random Fraction Index: ", "\(randomFractionIndex)")
        
        for view in puzzleView.subviews{
            view.removeFromSuperview()
        }
        
        for view in solutionButtonsView.subviews{
            view.removeFromSuperview()
        }
        
        resetSampleSolutionOrigin()
        resetSolutionButtonOrigin()
        resetViewTappedOrigin()
        getSampleSolution()
        drawSolutionButtonViews()
        drawSolutionOutlineView()
        displayPuzzleStatement()

    }
    

    
    func getFractionImage(x: String!, _ y: String!) -> String{
        var imageName: String!
        imageName = x + "_" + y + ".png"
        return imageName
    }
    
    
    func checkAnswer(){
        print("In Check Answer")
        print("    View Tapped Origin X: \(viewTappedOrigin_X)")
        print("    puzzleWidth: \(puzzleWidth)")
        
        if(viewTappedOrigin_X > availableWidth + 20 || Int(viewTappedOrigin_X) > Int(puzzleWidth + 20))
        {
            let alertWrong = UIAlertView()
            alertWrong.title = "Oops!!!"
            alertWrong.message = "Sorry. That's the wrong answer"
            alertWrong.addButtonWithTitle("OK")
            alertWrong.show()
        }
        else if(Int(viewTappedOrigin_X) == Int(puzzleWidth + 20)) {
            let alertRight = UIAlertView()
            alertRight.title = "Congratulations"
            alertRight.message = "That's the right Answer"
            alertRight.addButtonWithTitle("OK")
            alertRight.show()
            var defaults = NSUserDefaults.standardUserDefaults()
            var currentScore = defaults.integerForKey("correctScore")
            currentScore = currentScore+1
            defaults.setInteger(currentScore, forKey: "correctScore")
            defaults.synchronize()
            performSegueWithIdentifier("scoreBoardSegue", sender: self)
        }
    }
    
    
}
