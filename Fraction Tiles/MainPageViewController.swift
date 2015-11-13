//
//  MainPageViewController.swift
//  Fraction Tiles
//
//  Created by Promeet Mansata on 11/12/15.
//  Copyright © 2015 Tracy Chu. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    override func viewDidLoad() {
        var defaults = NSUserDefaults.standardUserDefaults()
        var currentScore = defaults.integerForKey("correctScore")
        currentScore = 0
        defaults.setInteger(currentScore, forKey: "correctScore")
        defaults.synchronize()
      super.viewDidLoad()

        // Do any additional setup after loading the view.
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
