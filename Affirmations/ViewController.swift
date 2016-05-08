//
//  ViewController.swift
//  Affirmations
//
//  Created by Paul Nichols on 4/22/16.
//  Copyright © 2016 Paul Nicholsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var affirmations:AnyObject = [:]
    
    @IBOutlet weak var positiveMessage: UILabel!
    
    @IBAction func sendAffirmation(sender: AnyObject) {
        positiveMessage.text = getAffirmation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scheduleAffirmation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scheduleAffirmation() -> Void {
        print("test")
        let localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Testing"
        localNotification.alertBody = "Hello World!"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 15) //time in seconds
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        print("test 2")
    }
    
    func getAffirmation() -> String {
        let url = NSBundle.mainBundle().URLForResource("Affirmations", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        do {
            affirmations = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
        } catch {
            print("error")
        }

        let random = String(arc4random_uniform(UInt32(affirmations.count)) + 1)
        let new_affirmation = affirmations[random]!!["Affirmation"]!!
        print(new_affirmation)
        return new_affirmation as! String
    }
    
}

